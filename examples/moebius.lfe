(defmodule moebius
  (export all))

;;; Original example:
;;; * https://gnuplot.sourceforge.net/demo_5.4/singulr.16.gnu
;;;
(defun opts ()
  '(#(title "Moebius strip (view from opposite side)")
    #(size "1, 1.1")
    #(dummy "u, v")
    #(style "increment default")
    #(key "bmargin center horizontal Right noreverse enhanced autotitle nobox")
    #(parametric "")
    #(view "60, 210, 1, 1")
    #(isosamples "24, 12")
    #(style "data lines")
    #(urange "[ 0 : 6.28319 noreverse writeback")
    #(vrange "[ -0.25 : 0.25 ] noreverse writeback")
    #(xrange "[ * : * ] noreverse writeback")
    #(x2range "[ * : * ] noreverse writeback")
    #(yrange "[ * : * ] noreverse writeback")
    #(y2range "[ * : * ] noreverse writeback")
    #(zrange "[ * : * ] noreverse writeback")
    #(cbrange "[ * : * ] noreverse writeback")
    #(rrange "[ * : * ] noreverse writeback")
    #(pm3d "implicit at s ftriangles corners2color max")
    #(colorbox "vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front noinvert bdefault")))

(defun vars ()
  '(#("NO_ANIMATION" "1")))

(defun splot-args ()
  "(2-v*sin(u/2))*sin(u),(2-v*sin(u/2))*cos(u),v*cos(u/2) lt rgb '#333333'")
