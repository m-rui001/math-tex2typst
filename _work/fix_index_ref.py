"""Repair the index line's swallowed backslash.

`read_text` in text mode translates a lone CR into a newline, which is why the first attempt printed
the fragment on its own line and reported no match. Read with ``newline=""`` so the CR stays a CR, and
write it back the same way so the file's existing line endings are not rewritten wholesale.
"""
import pathlib

P = pathlib.Path(r"C:\Users\hp\.qoder-cn\projects\E--math\memory\MEMORY.md")
with open(P, encoding="utf-8", newline="") as f:
    text = f.read()

bad = "`" + "\r" + "ef`"
print("CR count:", text.count("\r"), "| bad count:", text.count(bad))
if bad in text:
    text = text.replace(bad, "`" + chr(92) + "ref`")
    with open(P, "w", encoding="utf-8", newline="") as f:
        f.write(text)
    print("patched")

with open(P, encoding="utf-8", newline="") as f:
    print(f.read().splitlines()[4][:240])
