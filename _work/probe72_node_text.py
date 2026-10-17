r"""What `cetz.node_text` answers for a delimiter pair written tight behind a line break.

The three shapes the #72 test has to state exactly: a break before a plain paren (`alpha\\(i)`, which
TeX sets as prose because no closing delimiter exists), a break before a real pair
(`alpha\\\(t\in[2,5]\)`), and two pairs separated by breaks (`Reset\\\(a\)\\\(b\)`).
"""
import io
import sys

sys.path.insert(0, r"E:\math\tools")
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

B = chr(92)
print(repr(cetz.node_text("alpha" + B * 2 + "(i)")))
print(repr(cetz.node_text("alpha" + B * 3 + "(t" + B + "in[2,5]" + B + ")")))
print(repr(cetz.node_text("Reset" + B * 3 + "(t" + B + "in[2,5]" + B + ")" + B * 3
                          + "(v" + B + "ell=0" + B + ")")))
