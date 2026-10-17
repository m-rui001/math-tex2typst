r"""Compile a canvas of node_text() output for the label forms that failed."""
import subprocess
import sys
import tempfile
import pathlib

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

BODIES = [
    'radial contraction stops at ( Y_)',
    'test: (_n)',
    r'A complete transit with $D^f$-length at most $B_0$ must enter the $\rho$-collar, since \[ e^Hm_*w \]',
    '$Q=Q_1"IQ"_2, |E(I)|gt.eq31$',
    r'old class $\ge .eq12$',
    r'Spectral vectors [3pt] $h_n=1$, radius $\delta_n$ $m_t^{\mathrm{TU}}_n^{2}$',
    r'Compress (U_j) using (D_y,j); (D_z,j) remains available in (E).',
    r'Heat on; $\beta$ off ($v=r$)',
    r'Remaining smooth canonical case (W) non-uniruled, (q(W)=0) (a(W)>0)',
    r'$.\ref{eq0}$',
    r'$E^{I\ge}$.eq0 for the two blocks Section~sec:coupling',
    r'${\mathrm{macroblock}} \Plt .eq1$',
    r'$0\lt .eq "slt".eq1, 0 s_H\lt .eq1$',
    r'(y^i,0=t_i) (w^i,1 y^i,1=a_i,0)',
    r'(ord_F_D(f^*t)=m_D)',
    r'explicit rational entries; $\dl t.eq2 \ns ^2$',
    r'$\lambda_{vgt.eq2}/3$',
    r'block A: $\kappa/$',
    r'slope $\beta=v/$',
    r'$L_*/3+O(b_m)$',
    r'Tensoring outputs: $6\dot\op C_*/6=C_*$',
    r'$q<\plt.eq4$: remove row $p=4$, column $q=1$.',
    r'Weighted densities are close to $1/2$ at small widths',
    r'(Section~sec:sequence-models)',
    r'On $S$: $|h|>b_2>2b_3$. At the end: $h0$.',
    r'(a)-cap collar (=_A)',
    r'$R(u_s)=R(v)+s \,dR_v(h)+o(s)$ (sarrow.r0).',
    r'(=5p/3, s_1<s_2)',
    '(K<0)',
    r'$t0: b(t)\arrow.r\infty$',
    r'$C_n=N/2^{\text{narrow}}\infty$',
    r'positive\ tape negative',
    r'100\% of $x_i$ & $y_j$',
    r'$M_kappa=U_e U_f, _kappa=M_kappa kappa$',
]

lines = []
for i, body in enumerate(BODIES):
    lines.append("  content((%d, 0), [%s])" % (i, cetz.node_text(body)))
canvas = (cetz.HEADER + "#set page(width: 600pt, height: 400pt)\n#cetz.canvas({\n"
          "  import cetz.draw: *\n" + "\n".join(lines) + "\n})\n")

with tempfile.TemporaryDirectory() as tmp:
    p = pathlib.Path(tmp) / "t.typ"
    p.write_text(canvas, encoding="utf-8")
    r = subprocess.run(["typst", "compile", str(p), str(pathlib.Path(tmp) / "t.pdf")],
                       capture_output=True)
print("compile:", "OK" if r.returncode == 0 else "FAILED")
if r.returncode:
    print(" ".join(r.stderr.decode("utf-8", "replace").split())[:1200])
for i, body in enumerate(BODIES):
    print("%2d  %-52s -> %s" % (i, body[:52], cetz.node_text(body)[:88]))
