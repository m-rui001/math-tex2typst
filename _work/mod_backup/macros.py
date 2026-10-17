"""Parse and expand user macros (\\newcommand / \\def / \\DeclareMathOperator ...)."""

import re

from .texutil import find_group, scan_command_name, skip_spaces

DEF_KEYWORDS = ("\\newcommand", "\\renewcommand", "\\providecommand",
                "\\DeclareMathOperator", "\\DeclareMathSymbol",
                "\\DeclarePairedDelimiter", "\\DeclarePairedDelimiterX",
                "\\newenvironment", "\\def", "\\edef", "\\let", "\\gdef", "\\xdef")

# Redefinitions of names LaTeX already defines (accsupp wrappers around \mapsto,
# \let\label\SomeInternal, ...) carry no content we want: expanding them turns a
# formula pandoc understands into internal plumbing it refuses.
OVERRIDE_KEYWORDS = ("\\renewcommand", "\\providecommand", "\\let", "\\edef",
                     "\\gdef", "\\xdef")


class Macro:
    __slots__ = ("name", "nargs", "opt", "body", "kind", "alias")

    def __init__(self, name, nargs=0, opt=None, body="", kind="macro", alias=None):
        self.name, self.nargs, self.opt, self.body, self.kind, self.alias = \
            name, nargs, opt, body, kind, alias


def _read_name(s, i):
    """After a \newcommand keyword: return (name, index)."""
    if i < len(s) and s[i] == "{":
        end = find_group(s, i)
        return s[i + 1:end - 1].strip(), end
    if i < len(s) and s[i] == "\\":
        name, j = scan_command_name(s, i)
        return "\\" + name, j
    return None, i


def parse_definitions(text):
    """Collect macros defined in `text`. Returns (table, skipped)."""
    table, skipped, bad = {}, [], set()
    i = 0
    n = len(text)
    while i < n:
        if text[i] != "\\":
            i += 1
            continue
        name, after = scan_command_name(text, i)
        cmd = "\\" + name
        if cmd not in DEF_KEYWORDS:
            i = after
            continue
        seg = text[i:min(n, after + 400)]
        try:
            entry, consumed = _parse_one(text, after, cmd)
        except Exception as exc:  # malformed/conditional definition: leave it alone
            entry, consumed = None, after
            bad.add(_peek_name(text, after))
            skipped.append((cmd + name, str(exc)[:60], seg[:80].replace("\n", " ")))
        if entry:
            if cmd in OVERRIDE_KEYWORDS:
                bad.add(entry.name)
                skipped.append((cmd + entry.name, "redefines a builtin", ""))
            else:
                table[entry.name] = entry
        i = max(consumed, after)
    _prune(table, bad)
    return table, skipped


def _peek_name(text, i):
    j = skip_spaces(text, i)
    if text[j:j + 1] == "*":
        j = skip_spaces(text, j + 1)
    name, _ = _read_name(text, j)
    return name or ""


def _prune(table, bad):
    """Drop macros that expand into plumbing pandoc cannot read.

    A body is only usable when everything it references is plain LaTeX or another
    usable macro, so one bad definition cascades to its callers.
    """
    changed = True
    while changed:
        changed = False
        for name, mac in list(table.items()):
            body = mac.alias or mac.body or ""
            refs = re.findall(r"\\[a-zA-Z]+@?[a-zA-Z@]*", body)
            if any(ref in bad or "@" in ref for ref in refs):
                bad.add(name)
                del table[name]
                changed = True


UNSAFE = ("\\if", "\\csname", "\\expandafter", "\\else", "\\fi", "\\@if",
          "\\edef", "\\let", "\\futurelet", "\\noexpand", "\\romannumeral",
          "\\begingroup", "\\BeginAccSupp", "\\EndAccSupp", "\\pdfliteral",
          "\\ActualText", "\\special", "\\protect")


def _parse_one(text, after, cmd):
    i = skip_spaces(text, after)
    if text[i:i + 1] == "*":
        i += 1
        i = skip_spaces(text, i)
    if cmd == "\\let":
        target, i = _read_name(text, i)
        i = skip_spaces(text, i)
        if text[i:i + 1] == "=":
            i += 1
        i = skip_spaces(text, i)
        source, i = _read_name(text, i)
        if target and source:
            return Macro(target, kind="let", alias=source), i
        raise ValueError("let form")
    if cmd.startswith("\\DeclarePairedDelimiter"):
        mname, i = _read_name(text, i)
        if not mname:
            raise ValueError("no name")
        i = skip_spaces(text, i)
        if text[i:i + 1] == "[":
            i = text.index("]", i) + 1
        delims = []
        for _ in range(2):
            i = skip_spaces(text, i)
            if text[i:i + 1] != "{":
                raise ValueError("delimiter group missing")
            end = find_group(text, i)
            delims.append(text[i + 1:end - 1])
            i = end
        inner = ""
        j = skip_spaces(text, i)
        if cmd.endswith("X") and text[j:j + 1] == "{":
            end = find_group(text, j)
            inner = text[j + 1:end - 1]
            i = end
        body = ("%s %s %s" % (delims[0], inner or "#1", delims[1])
                if inner else "\\left%s{#1}\\right%s" % (delims[0], delims[1]))
        return Macro(mname, max_iter(body), None, body, "macro"), i
    mname, i = _read_name(text, i)
    if not mname:
        raise ValueError("no name")
    nargs, opt = 0, None
    optional_first = False
    i = skip_spaces(text, i)
    if text[i:i + 1] == "[":
        end = text.index("]", i)
        head = text[i + 1:end].strip()
        if re.fullmatch(r"#\d+", head):
            nargs, optional_first = int(head[1:]), True
            i = end + 1
            i = skip_spaces(text, i)
            if text[i:i + 1] == "[":
                end2 = text.index("]", i)
                opt = text[i + 1:end2]
                i = end2 + 1
        elif re.fullmatch(r"\d+", head):
            nargs = int(head)
            i = end + 1
    while text[i:i + 1] == "#" and len(text) > i + 1 and text[i + 1].isdigit():
        nargs = max(nargs, int(text[i + 1]))
        i += 2
    if text[i:i + 1] != "{":
        raise ValueError("no body group")
    end = find_group(text, i)
    body = text[i + 1:end - 1]
    i = end
    if cmd == "\\newenvironment":
        # two bodies (before/after); take the "before" one as the opening markup
        alt = text[i:i + 1]
        if alt == "{":
            end2 = find_group(text, i)
            body = body + "\n" + text[i + 1:end2 - 1] + "\n\\relax"
            i = end2
    if cmd.startswith("\\DeclareMath"):
        kind = "operator"
    else:
        kind = "env" if cmd == "\\newenvironment" else "macro"
    if any(u in body for u in UNSAFE):
        raise ValueError("conditional body")
    if nargs == 0:
        nargs = max_iter(body)
    if optional_first and opt is None:
        opt = ""
    return Macro(mname, nargs, opt, body, kind), i


def max_iter(body):
    hi = 0
    for m in re.finditer(r"#(\d)", body):
        hi = max(hi, int(m.group(1)))
    return hi


def expand(text, table, log=None, _depth=0):
    """Replace macro invocations by their (recursively expanded) bodies."""
    if _depth > 14:
        return text
    out, i, n = [], 0, len(text)
    while i < n:
        c = text[i]
        if c != "\\":
            out.append(c)
            i += 1
            continue
        name, after = scan_command_name(text, i)
        cmd = "\\" + name
        mac = table.get(cmd)
        if mac is None:
            # a control symbol (\\, \, ...) is one token; advancing by a single
            # char would rescan its second backslash as a macro name ("\\Q")
            if name and not name.isalpha():
                out.append("\\" + name)
                i = after
            else:
                out.append(c)
                i += 1
            continue
        j, args = _read_args(text, after, mac)
        if args is None:
            out.append(c)
            i += 1
            continue
        if mac.kind == "let" and mac.alias:
            piece = expand(mac.alias, table, log, _depth + 1)
        elif mac.kind == "operator":
            piece = "\\operatorname{%s}" % _subst(mac.body, args)
        else:
            piece = expand(_subst(mac.body, args), table, log, _depth + 1)
        # a body starting with a letter would glue onto the preceding command
        # name ("\otimes" + "D_{1}" -> "\otimesD_{1}")
        if piece and out and out[-1][-1:].isalpha() and piece[:1].isalpha():
            out.append(" ")
        out.append(piece)
        if log is not None:
            log[cmd] = log.get(cmd, 0) + 1
        i = j
    return "".join(out)


def _subst(body, args):
    """Fill #1..#n, keeping a preceding control-sequence name separable."""
    if not args:
        return body
    out, i = [], 0
    for m in re.finditer(r"#(\d)", body):
        k = int(m.group(1))
        val = args[k - 1] if 1 <= k <= len(args) else m.group(0)
        seg = body[i:m.start()]
        if val and seg and seg[-1].isalpha():
            seg += " "
        out.append(seg)
        out.append(val)
        i = m.end()
    out.append(body[i:])
    return "".join(out)


def _read_args(text, i, mac):
    """Read mac.nargs arguments starting at i. Return (pos, args) or (i, None)."""
    args = []
    if mac.opt is not None:
        j = skip_spaces(text, i)
        if text[j:j + 1] == "[":
            try:
                end = _bracket_end(text, j)
            except ValueError:
                return i, None
            args.append(text[j + 1:end - 1])
            i = end
    while len(args) < mac.nargs:
        j = skip_spaces(text, i)
        if j >= len(text):
            break
        if text[j] == "{":
            try:
                end = find_group(text, j)
            except ValueError:
                return i, None
            args.append(text[j + 1:end - 1])
            i = end
            continue
        if text[j] == "\\":
            name, after = scan_command_name(text, j)
            args.append("\\" + name)
            i = after
            continue
        if j == i and (text[j].isalnum() or text[j] in "&^_"):
            args.append(text[j])
            i = j + 1
            continue
        break
    while len(args) < mac.nargs:
        args.append(mac.opt if (mac.opt is not None and not args) else "")
    return i, args


def _bracket_end(text, i):
    depth = 0
    j = i
    while j < len(text):
        c = text[j]
        if c == "{":
            depth += 1
        elif c == "}":
            depth -= 1
        elif c == "]" and depth == 0:
            return j + 1
        j += 1
    raise ValueError("unclosed [")
