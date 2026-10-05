# Numerical Methods

MATLAB scripts and Python (Jupyter) notebooks implementing the standard algorithms of an introductory numerical methods course, organized by chapter. Each chapter folder also contains its exercise sheet (`BTChuong<N>CK.pdf`).

Some comments, prompts and notebook text are in Vietnamese.

## Contents

| Chapter | Topic | Methods |
|---|---|---|
| [`c2-root-finding`](c2-root-finding) | Root finding | Bisection, false position, fixed-point iteration, Newton's method, secant method |
| [`c3-systems-of-equations`](c3-systems-of-equations) | Linear systems | Gaussian elimination, Gauss–Jordan, Jacobi, Gauss–Seidel; LU factorizations in [`ALU/`](c3-systems-of-equations/ALU): Doolittle, Crout, Cholesky, LU with pivoting |
| [`c4-interpolation`](c4-interpolation) | Interpolation | Lagrange, Newton divided differences, Newton backward differences, quadratic spline, natural and clamped cubic splines |
| [`c5-least-squares-approximation`](c5-least-squares-approximation) | Least squares | Discrete least squares (line and polynomial), Gram–Schmidt orthogonal polynomials, continuous least squares |
| [`c6-integration`](c6-integration) | Numerical differentiation & integration | Three- and five-point derivative formulas; midpoint, trapezoid and Simpson's rules |
| [`c7-ordinary-differential-equations`](c7-ordinary-differential-equations) | Initial value problems | Euler, Heun, midpoint, Taylor, Runge–Kutta 4, Adams–Bashforth / Adams–Moulton predictor–corrector |
| [`c8-approximating-Eigenvalues`](c8-approximating-Eigenvalues) | Eigenvalues | Power method, inverse power method, Rayleigh quotient iteration, QR algorithm |

## Running

**MATLAB scripts (`.m`)** — `cd` into the chapter folder in MATLAB (or GNU Octave), then call the function or run the script by name. Scripts that use `input(...)` prompt for their data; type MATLAB expressions such as `[1 2 3]` at each prompt. `GramSchmidt.m`, `runTaylor.m` and `adamsbashforth.m` need the Symbolic Math Toolbox.

**Notebooks (`.ipynb`)** — open with Jupyter or Google Colab (Python 3 kernel) and run the cells in order. They use `numpy`, `matplotlib` and `prettytable`.

## Examples

Each algorithm below has one example, in the same order as the table above. Outputs are rounded.

### Chapter 2 — Root finding

All examples solve **x³ − x − 2 = 0**, whose root is **x ≈ 1.52138**.

```matlab
f = @(x) x.^3 - x - 2;
```

**Bisection** — `bisection_method(f, a, b)`; `[a, b]` must bracket the root. Tolerance 10⁻¹⁰.

```matlab
[x, k] = bisection_method(f, 1, 2)
% x = 1.5214, k = 34
```

**False position** — `false_position_method(f, p0, p1)`; `p0`, `p1` bracket the root. Tolerance 10⁻⁶.

```matlab
[x, k] = false_position_method(f, 1, 2)
% x = 1.5214, k = 13
```

**Fixed-point iteration** — `fixed_point_iteration(g, x0, TOL)` iterates x = g(x). Rewrite the equation as x = ∛(x + 2). `TOL` is optional and defaults to 10⁻², which is only accurate to about two decimals.

```matlab
g = @(x) (x + 2)^(1/3);
[c, k] = fixed_point_iteration(g, 1)
% c = 1.5197, k = 3
[c, k] = fixed_point_iteration(g, 1, 1e-10)
% c = 1.5214
```

`bai7a.m` plots y = x and y = 2 sin x to locate starting points for exercise 7a (x = 2 sin x); run it with no arguments.

**Newton's method** — `newtons_method(f, df, x0)` takes the derivative as a second function. Tolerance 10⁻¹⁰.

```matlab
df = @(x) 3*x.^2 - 1;
[x, k] = newtons_method(f, df, 1.5)
% x = 1.52137970680457, k = 4
```

**Secant method** — `secant_method(f, x0)` needs only one starting point; it generates the second by perturbing `x0`. Tolerance 10⁻⁶.

```matlab
[x, k] = secant_method(f, 1.5)
% x = 1.5214, k = 5
```

### Chapter 3 — Systems of linear equations

Unless noted, the examples use this system, whose solution is **x = [1; 2; 3]**:

```matlab
A = [ 4 -1  0;
     -1  4 -1;
      0 -1  4];
b = [2; 4; 10];
```

**Gaussian elimination** — `gaussian_elimination(A, b)`

```matlab
x = gaussian_elimination(A, b)
% x = [1; 2; 3]
```

**Gauss–Jordan** — `gauss_jordan.m` is a script with its system written inside it (`A = [5 -2 9; -2 10 -2; 0 -2 15]`, `B = [18; -60; 128]`). Edit those two lines to solve a different system.

```matlab
gauss_jordan
% The required solution is:
%   -12.8895
%    -7.0595
%     7.5921
```

**Jacobi** — `jacobi_method(A, b)` starts from all ones and always runs 10 iterations, printing each one and pausing; press any key to continue.

```matlab
[x, it] = jacobi_method(A, b)
% after iteration 10: x ≈ [1.0000; 2.0000; 3.0000]
```

**Gauss–Seidel** — `gauss_seidel` ignores its arguments and asks for everything interactively. It checks convergence first and stops if the iteration matrix has spectral radius ≥ 1.

```text
>> gauss_seidel
Enter matrix A :            [4 -1 0; -1 4 -1; 0 -1 4]
Enter matrix B :            [2; 4; 10]
Any initial guess for X? (y/n):   n
Enter the error allowed in final answer:  1e-6
The final answer obtained after 10 iterations is
    1.0000
    2.0000
    3.0000
```

**Doolittle LU** (`ALU/doolittle.m`) — L has a unit diagonal.

```matlab
[L, U] = doolittle(A)
% L = [ 1       0       0          U = [ 4  -1      0
%      -0.25    1       0                0   3.75  -1
%       0      -0.2667  1 ]              0   0      3.7333 ]
```

`ALU/alu.m` uses `doolittle` to solve a full system: run it and enter `A` and `B` at the prompts to get L, U, the intermediate Y (LY = B) and the solution X (UX = Y).

**Crout LU** (`ALU/crout.m`) — U has a unit diagonal.

```matlab
[L, U] = crout(A)
% L = [ 4   0     0                U = [ 1  -0.25   0
%      -1   3.75  0                      0   1     -0.2667
%       0  -1     3.7333 ]               0   0      1 ]
```

**Cholesky** (`ALU/cholesky.m`) — A must be symmetric positive definite; returns lower-triangular L with A = L·Lᵀ.

```matlab
L = cholesky(A)
% L = [ 2       0       0
%      -0.5     1.9365  0
%       0      -0.5164  1.9322 ]
```

**LU with partial pivoting** (`ALU/lu_pivot.m`) — returns P·A = L·U.

```matlab
[L, U, P] = lu_pivot([1 2 3; 4 5 6; 7 8 10])
% L = [1 0 0; 0.1429 1 0; 0.5714 0.5 1]
% U = [7 8 10; 0 0.8571 1.5714; 0 0 -0.5]
% P = [0 0 1; 1 0 0; 0 1 0]
```

### Chapter 4 — Interpolation

Unless noted, the examples interpolate the points below and evaluate at **x = 5**. The degree-4 polynomial through them gives **p(5) = −245**.

```matlab
x = [1   2    4   7   8];
y = [-9 -41 -189  9  523];
```

**Lagrange** — `lagrange_interpolation.m` prompts for x, y and the evaluation point.

```text
>> lagrange_interpolation
Nhap cac gia tri diem roi rac x vao mot mang:      [1 2 4 7 8]
Nhap cac gia tri diem roi rac y vao mot mang:      [-9 -41 -189 9 523]
Nhap gia tri vi tri x ma ta can tim f(x):  5
Gia tri tim duoc cua f(5.00) = -245.0000
```

**Newton divided differences** — `newton_interpolation(x, y, p)` is the function version and prints the divided-difference table `d`.

```matlab
fp = newton_interpolation(x, y, 5)
% fp = -245
```

`newton_divided_diff_interpolation.m` is the interactive version: enter the same x, y and 5 at the prompts, and it prints `The required value is f(5.00)= -245.000`.

**Newton backward differences** — `newton_backward_interpolation.m` needs equally spaced x. It prints the difference table, then the value.

```text
>> newton_backward_interpolation
Enter the values of independent variable x in an array:   1:6
Enter the values of dependent variable y in an array:     [1 8 27 65 123 208]
Enter the value of x where we want to find the value of f(x):  5.5
The required value is f(5.50)= 161.1250
```

**Quadratic spline** — `quadratic_spline.m` is a script with its data written inside it (`x = [0 1 2]`, `y = [0 1 2]`). It sets the first piece's x² coefficient to zero and plots the spline. Edit the `x` and `y` lines for your own data.

```matlab
quadratic_spline   % opens a figure of the spline with the data points in red
```

**Natural cubic spline** — `cubic_spline(X, Y, C0, CN, hh)`; `C0 = CN = 0` gives the natural spline, and `hh` is the spacing of the output points. Example with f(x) = eˣ:

```matlab
X = 0:3;  Y = exp(X);
[XX, YY] = cubic_spline(X, Y, 0, 0, 0.5);
YY(2:2:end)   % values at x = 0.5, 1.5, 2.5
% 1.7645  4.2303  13.0085      (exact: 1.6487  4.4817  12.1825)
```

**Clamped cubic spline** — `clamped_spline(x, y, v, u)`; `v = [f'(x₁), f'(xₙ)]` are the end slopes and `u` the points to evaluate. Knowing the slopes makes it much closer to eˣ than the natural spline:

```matlab
S = clamped_spline(0:3, exp(0:3), [1 exp(3)], [0.5 1.5 2.5])
% S = 1.6454  4.4766  12.1424
```

### Chapter 5 — Least-squares approximation

**Least-squares line** — `least_square.m` is a script with seven data points written inside it. It prints the coefficients, the fitted values and the squared error, then plots the line. Edit the `input` matrix (one `[x, y]` pair per row) for your own data.

```matlab
least_square
% a = [-4.9961; 0.8644]          →  y = -4.9961 + 0.8644x
% least_square_error = 0.7647
```

**Least-squares polynomial** — in `Chuong5BinhPhuongToiThieu.ipynb`, run the first cell, then call `main(x, y, degree)`:

```python
x = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
y = np.array([1.3, 3.5, 4.2, 5.0, 7.0, 8.8, 10.1, 12.5, 13, 15.6])
main(x, y, 2)
# f(x) = 0.40669 + 1.15484*x + 0.03485*x^2   (and plots the fit)
```

**Gram–Schmidt orthogonal polynomials** — `GramSchmidt.m` turns 1, x, x², x³ into orthonormal polynomials on [1, 3]. Change `n` and the interval `[1,3]` in the script to use others.

```matlab
GramSchmidt
% degree 0: 0.7071
% degree 1: 1.225x − 2.449
% degree 2: 2.372x² − 9.487x + 8.696
% degree 3: 4.677x³ − 28.06x² + 53.32x − 31.8
```

**Continuous least squares** — in the "Xấp xỉ bình phương liên tục" section of the same notebook, `main(f, a, b, degree)` finds the polynomial P closest to f on [a, b], computing the integrals with Simpson's rule. Pass f as a string.

```python
main("x^2 + 3*x + 2", 0, 1, 1)
# P(x) = 1.834 + 3.9997*x    (and plots f and P)
```

### Chapter 6 — Numerical differentiation and integration

Everything in this chapter is in `Chuong6TinhGanDungDHTP.ipynb`. Run the definition cells first.

**Three-point formulas on tabulated data** — `threePoint(x, f, h)` uses the end-point formula at the ends and the midpoint formula inside:

```python
x = np.array([1.1, 1.2, 1.3, 1.4])
y = np.array([9.025013, 11.02318, 13.46374, 16.44465])
threePoint(x, y, 0.1)
# [17.769705 22.193635 27.10735 32.51085]
```

**Three- and five-point formulas at a single point** — for f(x) = x·eˣ at x₀ = 2 with h = 0.1 (exact f′(2) = 22.16717):

```python
threePoint_endPoint_formula(2, val_f, 0.1)   # 22.03230
threePoint_midPoint_formula(2, val_f, 0.1)   # 22.22879
fivePoint_endPoint_formula(2, val_f, 0.1)    # 22.16591
fivePoint_midPoint_formula(2, val_f, 0.1)    # 22.16700
```

**Midpoint, trapezoid and Simpson's rules** — `midpoint(f, a, b, n)`, `trapezoid(f, a, b, n)` and `simpson(f, a, b, n)` (n even for Simpson's). For ∫₀² x⁴ dx = 6.4:

```python
f = lambda x: x**4
midpoint(f, 0, 2, 4)    # 6.0703
trapezoid(f, 0, 2, 4)   # 7.0625
simpson(f, 0, 2, 4)     # 6.4167
```

The notebook's `main()` runs all three for n = 2, 4, …, n on one of eight built-in functions: choose one from the menu, then enter a, b and n (type `q` to stop).

### Chapter 7 — Ordinary differential equations

The Euler, Heun, Runge–Kutta 4 and Adams examples solve **y′ = x(y − x), y(2) = 3** on [2, 3] with h = 0.1, all from `adamsbashforth.m`. Run it with no arguments; it prints a table for each method and its error against MATLAB's `ode45`. The exact value is **y(3) ≈ 10.35376**.

**Euler's method**

```matlab
adamsbashforth
% euler: y(3) ≈ 8.45372
```

The notebook `Chuong7PhuongTrinhViPhan.ipynb` has more Euler examples. For y′ = x + 2y, y(0) = 0, with h = 0.25, it prints y(1) ≈ 0.515625.

**Heun's method** (improved Euler)

```matlab
% heuns (from the same run): y(3) ≈ 10.19502
```

The notebook's "Phương pháp Heun" section solves y′ = y − 2x/y, y(0) = 1, and compares the result with the exact solution √(2x + 1).

**Midpoint method** — `midpoint_ivp(fun, tspan, y0, dt)` works on systems. `midpoint_example.m` uses it on the third-order equation u‴ = −u″ + 4u′ + 4u (u(0) = 4, u′(0) = −2, u″(0) = 10), written as a first-order system, and plots it against the exact solution:

```matlab
odefun = @(t,y) [y(2); y(3); -y(3) + 4*y(2) + 4*y(1)];
[t, y] = midpoint_ivp(odefun, [0 0.6], [4 -2 10], 0.03);
y(end, 1)
% 4.71698   (exact: 4.71893)
```

**Taylor method (order 2)** — `TaylorMethod(f, inter, y0, k)` solves y′ = f(t, y) on the interval `inter` with step h = 0.1 · 2⁻ᵏ. `runTaylor.m` calls it for y′ = 5t⁴y, y(0) = 1 on [0, 1] and plots the result against the step index.

```matlab
f = @(t,y) 5*t^4*y;
y = TaylorMethod(f, [0 1], 1, 1);   % h = 0.05
y(end)
% 2.65694    (exact y(1) = e = 2.71828)
```

**Runge–Kutta 4**

```matlab
% rk4 (from the adamsbashforth run): y(3) ≈ 10.35323
```

The notebook's "Phương pháp Runge-Kutta bậc 4" section solves y′ = x·e³ˣ − 2y, y(0) = 0, with h = 0.1. It prints k₁ to k₄ for each step in a table.

**Adams–Bashforth / Adams–Moulton** — four-step predictor (Adams–Bashforth), then corrector (Adams–Moulton), started from the RK4 values:

```matlab
% Adam_Bashworth (predictor): y(3) ≈ 10.31946
% Adam_Moulton   (corrector): y(3) ≈ 10.34532
```

`adams_bashforth_method(a, b, s, f, y0)` is a function version of the predictor with `s` steps on [a, b]. It prints each new value and plots the solution:

```matlab
adams_bashforth_method(2, 3, 10, @(x,y) x*(y-x), 3)
% last entry of the final printed u: 10.3195   (exact y(3) ≈ 10.35376)
```

### Chapter 8 — Approximating eigenvalues

The examples use the symmetric matrix below. Its eigenvalues are **11.66199, 3.83940 and −2.50139**.

```matlab
A = [ 1  3 -1;
      3  2  4;
     -1  4 10];
```

**Power method** — finds the eigenvalue of largest absolute value. `PPLuyThua/power_method.m` iterates until the change is below a tolerance you enter:

```text
>> power_method
Nhap ma tran dau vao A :                  [1 3 -1; 3 2 4; -1 4 10]
Nhap vector rieng khoi tao ban dau:       [1; 1; 1]
Nhap muc do sai so cho phep:              1e-4
 Tri rieng lon nhat la 11.66202
Vector rieng tuong ung la:  [0.0249; 0.4217; 1.0000]
```

`PPLuyThua/pplt.m` takes the same A and x0 but always runs 20 iterations and prints every step. It reaches 11.661991.

**Inverse power method** — finds the eigenvalue of smallest absolute value. Use the function, which starts from a random vector:

```matlab
[lambda, v] = inverse_power_method(A)
% lambda ≈ -2.501   (tolerance 10⁻² on the eigenvector)
```

`PPLapNguoc/ppln.m` is the interactive 20-iteration version. With `[1; 1; 1]` as the starting vector, it prints −2.505912 at step 20, still converging.

**Rayleigh quotient iteration** — converges very fast, but to whichever eigenvalue is nearest the Rayleigh quotient of the random starting vector, so repeated runs can give different eigenvalues.

```matlab
[lambda, v] = RayleighQuotientIteration(A, 1e-10, 50)
% lambda = one of 11.66199, 3.83940, -2.50139
```

`PPRayleigh/RayleighQuotient.m` is the interactive version. It asks for the matrix and a tolerance, then prints a table of each iteration's eigenvalue estimate and eigenvector.

**QR algorithm** — `PP-QR/QR.m` builds a random 4×4 matrix with known eigenvalues 4, 3, 2, 1 (A = S·D·S⁻¹). It then runs 20 QR iterations using `QR_Factorization` (Gram–Schmidt QR). The diagonal of A converges to the eigenvalues, `lambda = A(1,1)` approaches 4, and the final `B./A` shows the convergence rate. To factor your own matrix:

```matlab
[Q, R] = QR_Factorization([1 2; 3 4])
% Q = [0.3162 0.9487; 0.9487 -0.3162]
% R = [3.1623 4.4272; 0 0.6325]
```
