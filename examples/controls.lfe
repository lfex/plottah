(defmodule controls
  (export all))

;;; Original example:
;;; * https://gnuplot.sourceforge.net/demo_5.4/controls.1.gnu
;;;
(defun opts ()
  '(#(title ("transient response of a second-order system" "to a unit step input function"))
    #(dummy "t, y")
    #(key "fixed right top vertical Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid")
    #(unset parametric)
    #(samples "50, 50")
    #(style "data lines")
    #(xrange "[ 0 : 13 ] noreverse writeback")
    #(x2range "[ * : * ] noreverse writeback")
    #(yrange "[ * : * ] noreverse writeback")
    #(y2range "[ * : * ] noreverse writeback")
    #(zrange "[ * : * ] noreverse writeback")
    #(cbrange "[ * : * ] noreverse writeback")
    #(rrange "[ * : * ] noreverse writeback")
    #(colorbox "vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault")))

(defun funcs-and-vars ()
  '(#("damp(t)" "exp(-s*wn*t)/sqrt(1.0-s*s)")
    #("per(t)" "sin(wn*sqrt(1.0-s**2)*t - atan(-sqrt(1.0-s**2)/s))")
    #("c(t)" "1-damp(t)*per(t)")
    #("NO_ANIMATION" "1")
    #("s" "2.0")
    #("wn" "1.0")))

(defun plot-args ()
  "s=.1,c(t),s=.3,c(t),s=.5,c(t),s=.7,c(t),s=.9,c(t),s=1.0,c(t),s=1.5,c(t),s=2.0,c(t)")
