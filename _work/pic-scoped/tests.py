import math
from t2t import cetz


def test_rotate_expression_angle_matches_pdflatex():
    # _work/pic-scoped/m_rotate_expr.tex, head x=1cm,y=1cm: the refused picture's scope
    # [shift={(45:1.65)},rotate={45/2+90}] puts local (.19,0) at 31.12762pt,38.19067pt and
    # (-.19,0) at 35.26498pt,28.20193pt; pgf points are pt of 1/72.27in -> cm.
    xf = cetz._transform({"shift": "{(45:1.65)}", "rotate": "{45/2+90}"})
    assert xf is not None
    pt = 2.54 / 72.27
    a = cetz._apply(xf, 0.19, 0)
    assert abs(a[0] - 31.12762 * pt) < 1e-4 and abs(a[1] - 38.19067 * pt) < 1e-4
    b = cetz._apply(xf, -0.19, 0)
    assert abs(b[0] - 35.26498 * pt) < 1e-4 and abs(b[1] - 28.20193 * pt) < 1e-4


def test_rotate_expression_equals_literal_degrees():
    # same control: rotate={45/2+90} and rotate={112.5} printed identical coordinates,
    # and a bare rotate={20+30} turns (1,0) to 18.28918pt,21.79585pt
    assert cetz._transform({"rotate": "{45/2+90}"}) == cetz._transform({"rotate": "{112.5}"})
    xf = cetz._transform({"rotate": "{20+30}"})
    pt = 2.54 / 72.27
    a = cetz._apply(xf, 1, 0)
    assert abs(a[0] - 18.28918 * pt) < 1e-4 and abs(a[1] - 21.79585 * pt) < 1e-4


def test_rotate_plain_and_deg_forms_still_read():
    # the reader kept every form the picture-free suites measured: bare, deg-suffixed, centred
    assert abs(cetz._transform({"rotate": "45"})[0] - math.cos(math.radians(45))) < 1e-9
    xf = cetz._transform({"rotate": "90deg"})
    a = cetz._apply(xf, 1, 0)
    assert abs(a[0]) < 1e-9 and abs(a[1] - 1.0) < 1e-9
    spec = cetz._rotate_spec("45:(1,2)")
    assert spec == (45.0, (1.0, 2.0))
    # measured: TeX errors on `rotate={45/2+90 deg}` -- an expression never carries a letter
    assert cetz._transform({"rotate": "{45/2+90 deg}"}) is None


def test_named_shift_moves_origin_by_the_canvas_point_verbatim():
    # _work/pic-scoped/m_shift_name.tex, head x=2cm: shift={(A)} for A at user (1,0) --
    # page 56.9055pt = 2cm -- put the scope origin at 2cm, not at 4cm; a user-unit reading
    # would have doubled it.
    outer = (2.0, 0.0, 0.0, 2.0, 1.0, 0.0, 0.0, 1.0, -0.385, -0.385, 0.0, 0.0)
    xf = cetz._transform({"shift": "{(A)}"}, outer, {"A": (2.0, 0.0, 0.4, 0.3)})
    assert xf is not None
    assert abs(xf[10] - 2.0) < 1e-9 and abs(xf[11]) < 1e-9
    # the same scope with a plain pair stays in user units: shift={(1,0)} -> 2cm
    pair = cetz._transform({"shift": "{(1,0)}"}, outer)
    assert abs(pair[10] - 2.0) < 1e-9


def test_named_shift_survives_an_enclosing_rotation():
    # same control: inside [rotate=90], shift={(A)} still lands at 56.9055pt,0pt (canvas
    # verbatim), while shift={(1,0)} lands at 0pt,56.9055pt (through the enclosing matrix);
    # the head is x=2cm, and TikZ rotate=90 sends (1,0) to (0,1)
    ca, sa = math.cos(math.radians(90)), math.sin(math.radians(90))
    outer = (ca, -sa, sa, ca, 2.0, 0.0, 0.0, 2.0, -0.385, -0.385, 0.0, 0.0)
    xf = cetz._transform({"shift": "{(A)}"}, outer, {"A": (2.0, 0.0, 0.4, 0.3)})
    assert abs(xf[10] - 2.0) < 1e-9 and abs(xf[11]) < 1e-9
    pair = cetz._transform({"shift": "{(1,0)}"}, outer)
    assert abs(pair[10]) < 1e-9 and abs(pair[11] - 2.0) < 1e-9


def test_scope_shift_onto_earlier_named_node_places_the_body():
    # the Deligne-Drinfeld pattern: a sized vertex node, then scope [shift={(A)}];
    # measured NAMEDSHIFTB equals the node's own centre (56.9055pt,113.811pt under x=2cm),
    # and a local (0,.75) inside kept the outer units (LOCALPT 56.9055pt,42.67912pt)
    tikz = (r"\begin{tikzpicture}[x=1cm,y=1cm]"
            r"\node (A) at (-4.2,0) {};"
            r"\begin{scope}[shift={(A)}]\draw (0,.75) -- (.9,-.3);\end{scope}"
            r"\end{tikzpicture}")
    canvas = cetz.build(tikz)
    assert canvas is not None
    assert "line((-4.2, 0.75), (-3.3, -0.3)" in canvas
