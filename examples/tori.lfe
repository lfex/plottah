(defmodule tori
  (export all))

;;; Original example:
;;; * https://gnuplot.sourceforge.net/demo_5.4/surface2.9.gnu
;;;
(defun opts ()
  '(#(title ("Interlocking Tori"))
    #(dummy "u, v")
    #(key "bmargin center horizontal Right noreverse enhanced autotitle nobox")
    #(parametric "")
    #(view "50, 30, 1, 1")
    #(isosamples "50, 20")
    #(style "data lines")
    #(xyplane "relative 0")
    #(hidden3d "back offset 1 trianglepattern 3 undefined 1 altdiagonal bentover")
    #(urange "[ -3.14159 : 3.14159 ] noreverse writeback")
    #(vrange "[ -3.14159 : 3.14159 ] noreverse writeback")
    #(xrange "[ * : * ] noreverse writeback")
    #(x2range "[ * : * ] noreverse writeback")
    #(yrange "[ * : * ] noreverse writeback")
    #(y2range "[ * : * ] noreverse writeback")
    #(zrange "[ * : * ] noreverse writeback")
    #(cbrange "[ * : * ] noreverse writeback")
    #(rrange "[ * : * ] noreverse writeback")
    #(colorbox "vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault")))

(defun vars ()
  '(#("NO_ANIMATION" "1")))

(defun splot-args ()
  "cos(u)+.5*cos(u)*cos(v),sin(u)+.5*sin(u)*cos(v),.5*sin(v) with lines,       1+cos(u)+.5*cos(u)*cos(v),.5*sin(v),sin(u)+.5*sin(u)*cos(v) with lines")
