(defmodule fourier-approx
  (export all))

;;; Original example:
;;; * https://gnuplot.sourceforge.net/demo_5.2/bivariat.8.gnu
;;;
(defun opts ()
  '(#(title "Finite summation of 10, 100, 1000 fourier coefficients")
    #(key "fixed right bottom vertical Right noreverse enhanced autotitle nobox")
    #(style "increment default")
    #(samples "500, 500")
    #(style "data lines")
    #(title "")
    #(xrange "[ -10.0000 : 10.0000 ] noreverse writeback")
    #(x2range "[ * : * ] noreverse writeback")
    #(yrange "[ -0.400000 : 1.20000 ] noreverse writeback")
    #(y2range "[ * : * ] noreverse nowriteback")
    #(zrange "[ * : * ] noreverse nowriteback")
    #(cbrange "[ * : * ] noreverse nowriteback")
    #(rrange "[ * : * ] noreverse nowriteback")))

(defun funcs-and-vars ()
  '(#("int2(x,y,d)" "(x>y-d*.5) ? 0 : (int2(x+d,y,d) + (f(x)+4*f(x+d*.5)+f(x+d))*d/6.)")
    #("ack(m,n)" "(m == 0) ? n + 1 : (n == 0) ? ack(m-1,1) : ack(m-1,ack(m,n-1))")
    #("min(x,y)" "(x < y) ? x : y")
    #("max(x,y)" "(x > y) ? x : y")
    #("gcd(x,y)" "gcd1(rnd(max(x,y)),rnd(min(x,y)))")
    #("rnd(x)" "int(x+0.5)")
    #("gcd1(x,y)" "(y == 0) ? x : gcd1(y, x - x/y * y)")
    #("fourier(k, x)" "sin(3./2*k)/k * 2./3*cos(k*x)")
    #("sum10(x)" "1./2 + sum [k=1:10]   fourier(k, x)")
    #("sum100(x)" "1./2 + sum [k=1:100]  fourier(k, x)")
    #("sum1000(x)" "1./2 + sum [k=1:1000] fourier(k, x)")
    #("delta" "0.2")
    #("k" "1000")))

(defun plot-args ()
  "sum10(x)   title '1./2 + sum [k=1:10]   sin(3./2*k)/k * 2./3*cos(k*x)',     sum100(x)  title '1./2 + sum [k=1:100]  sin(3./2*k)/k * 2./3*cos(k*x)',     sum1000(x) title '1./2 + sum [k=1:1000] sin(3./2*k)/k * 2./3*cos(k*x)'")
