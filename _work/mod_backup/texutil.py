"""Brace-aware primitives shared by the LaTeX side of the converter."""


def find_group(s, i):
    """s[i] must be '{'. Return index just past the matching '}'."""
    if i >= len(s) or s[i] != "{":
        raise ValueError("expected { at %d" % i)
    depth = 0
    j = i
    while j < len(s):
        c = s[j]
        if c == "\\":
            j += 2
            continue
        if c == "{":
            depth += 1
        elif c == "}":
            depth -= 1
            if depth == 0:
                return j + 1
        j += 1
    raise ValueError("unbalanced group starting at %d" % i)


def split_args(s):
    """Split a macro body argument list string on unescaped top-level commas."""
    out, buf, depth, i = [], [], 0, 0
    while i < len(s):
        c = s[i]
        if c == "\\" and i + 1 < len(s):
            buf.append(s[i:i + 2])
            i += 2
            continue
        if c == "{":
            depth += 1
        elif c == "}":
            depth -= 1
        if c == "," and depth == 0:
            out.append("".join(buf))
            buf = []
        else:
            buf.append(c)
        i += 1
    out.append("".join(buf))
    return out


def top_level_find(s, sub, start=0):
    """First index of `sub` outside braces, or -1."""
    depth, i = 0, start
    n = len(sub)
    while i < len(s):
        c = s[i]
        if c == "\\" and i + 1 < len(s):
            i += 2
            continue
        if c == "{":
            depth += 1
        elif c == "}":
            depth = max(0, depth - 1)
        elif depth == 0 and s.startswith(sub, i):
            return i
        i += 1
    return -1


def scan_command_name(s, i):
    """s[i] == '\\'. Return (name-without-backslash, index-after-name)."""
    if i + 1 >= len(s):
        return "", i + 1
    if s[i + 1].isalpha():
        j = i + 1
        while j < len(s) and s[j].isalpha():
            j += 1
        return s[i + 1:j], j
    return s[i + 1], i + 2


def skip_spaces(s, i):
    while i < len(s) and s[i] in " \t\n":
        i += 1
    return i


def env_body(text, env, pos=0):
    """Return (inner, index_after_end) for the first \\begin{env} at/after pos."""
    b = "\\begin{%s}" % env
    i = text.find(b, pos)
    if i < 0:
        return None, pos
    start = i + len(b)
    e = "\\end{%s}" % env
    depth, j = 0, start
    while True:
        nb = text.find("\\begin{", j)
        ne = text.find(e, j)
        if ne < 0:
            raise ValueError("unclosed environment %s" % env)
        if 0 <= nb < ne:
            depth += 1
            j = text.find("}", nb) + 1
            continue
        if depth:
            depth -= 1
            j = ne + len(e)
            continue
        return text[start:ne], ne + len(e)
