# Numerical Methods

MATLAB scripts and Python (Jupyter) notebooks implementing the standard algorithms of an introductory numerical methods course, organized by chapter. Each chapter folder also contains its exercise sheet (`BTChuong<N>CK.pdf`).

Some comments, prompts and notebook text are in Vietnamese.

## Contents

| Chapter | Topic | Methods |
|---|---|---|
| [`c2-root-finding`](c2-root-finding) | Root finding | Bisection, false position, fixed-point iteration, Newton's method, secant method |
| [`c3-systems-of-equations`](c3-systems-of-equations) | Linear systems | Gaussian elimination, Gauss–Jordan, Jacobi, Gauss–Seidel; LU factorizations in [`ALU/`](c3-systems-of-equations/ALU): Doolittle, Crout, Cholesky, LU with pivoting |
| [`c4-interpolation`](c4-interpolation) | Interpolation | Lagrange, Newton (forward, backward, divided differences), quadratic spline, natural and clamped cubic splines |
| [`c5-least-squares-approximation`](c5-least-squares-approximation) | Least squares | Discrete least-squares fitting, Gram–Schmidt orthogonal polynomials, continuous least squares (notebook) |
| [`c6-integration`](c6-integration) | Numerical differentiation & integration | Finite-difference derivatives and quadrature rules (notebook) |
| [`c7-ordinary-differential-equations`](c7-ordinary-differential-equations) | Initial value problems | Euler, Heun, midpoint, Taylor, Runge–Kutta 4, Adams–Bashforth / Adams–Moulton predictor–corrector |
| [`c8-approximating-Eigenvalues`](c8-approximating-Eigenvalues) | Eigenvalues | Power method (`PPLuyThua`), inverse power method (`PPLapNguoc`), Rayleigh quotient iteration (`PPRayleigh`), QR algorithm (`PP-QR`) |

## Running

**MATLAB scripts (`.m`)** — open the folder in MATLAB (or GNU Octave) and run the script, or call the function with your own inputs, e.g.

```matlab
[L, U] = doolittle([4 3; 6 3]);
[x, it] = jacobi_method([10 -1; -1 10], [9; 9]);
```

Some scripts prompt for input interactively with `input(...)`. `GramSchmidt.m` uses the Symbolic Math Toolbox (`syms`).

**Notebooks (`.ipynb`)** — open with Jupyter or Google Colab (Python 3 kernel).

## Credits

Some scripts are adapted from publicly shared implementations; original author notes are kept in the file headers where present.
