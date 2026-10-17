"""What does the emitter actually see for `\[ ... \tag{(\ast_{\adj})}\label{...} \]`?

Two papers print `sg:ambient-adjunction (no-number)`, which is the branch where a display registered
its label with an empty number. The suspicion is the tag: `_tag_of` allows one level of nested braces,
and this tag carries `_{\mathrm{adj}}`. Print the env, the tag `_tag_of` returns, what `tag_text`
makes of it and whether the env would have been numbered, so the refusal is attributed to a named
function rather than to a guess. Static: it imports the module, it never compiles anything.
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

TARGETS = ("sg:ambient-adjunction", "proj:sg:ambient-adjunction", "finite:enclosures")

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for target in TARGETS:
        i = src.find("\\label{%s}" % target)
        if i < 0:
            continue
        # walk back to the display's opening and forward to its closing
        start = max(src.rfind("\\[", 0, i), src.rfind("\\begin{", 0, i))
        stop = min(x for x in (src.find("\\]", i), src.find("\\end{", i), len(src)) if x > 0)
        chunk = src[start:stop + 8]
        env = emit._display_env(chunk)
        tag = emit._tag_of(chunk)
        print("%-44s %s" % (path.name[:-4][:44], target))
        print("   env=%r numbered-env=%s star=%s all-rows-tagged=%s"
              % (env, env in emit.NUMBERED_ENVS, "*" in env, emit._all_rows_tagged(chunk)))
        print("   _tag_of=%r -> tag_text=%r" % (tag, mathconv.tag_text(tag, {})))
        print("   chunk=%s" % " ".join(chunk.split())[:150])
