"""Land the reference-name fix: a `\ref` whose counter is already named in front of it prints its
number alone, so 'Section~\\ref{sec:a}' stops reaching the page as 'Section Section 3'."""
import re

p = "tools/t2t/emit.py"
s = open(p, encoding="utf-8").read()

subs = [
    ("    def ref_text(self, label, literal, named=True):",
     "    def ref_text(self, label, literal, named=True, before=\"\"):"),
    ('''        if name or shown:
            return ("%s %s" % (name, shown) if named else shown) if name else (shown or "[??]")''',
     '''        if name or shown:
            # the counter's own word is added only when nothing in front of the reference names it:
            # LaTeX's \\ref answers with the number alone, and 'Section~' is the author's own text
            if name and named and not names_counter(before, name):
                return "%s %s" % (name, shown)
            return shown or "[??]"'''),
    ("    def inline(self, node):", "    def inline(self, node, before=\"\"):"),
    ("                return self.book.ref_text(ref or url[1:], text)",
     "                return self.book.ref_text(ref or url[1:], text, before=before)"),
    ("                out.append(self.inline(node))",
     "                out.append(self.inline(node, \"\".join(out)))"),
    ("                buf.append(self.inline(node))",
     "                buf.append(self.inline(node, \"\".join(buf)))"),
]
for old, new in subs:
    assert s.count(old) == 1, old
    s = s.replace(old, new)

s = s.replace("def _snake(name):", '''def names_counter(before, name):
    """True when the words already written carry the counter's own name, plural or not."""
    words = before.rstrip().split()
    if not words:
        return False
    stem = lambda w: re.sub(r"s$", "", w.lower())
    return stem(words[-1]) == stem(name)


def _snake(name):''', 1)
open(p, "w", encoding="utf-8").write(s)
print("patched emit.py")
