(defmodule helix
  (export all))

;;; Original example:
;;; * https://gnuplot.sourceforge.net/demo_5.4/controls.1.gnu
;;;
(defun opts ()
  '(#(title ("Parametric Helix"))
    #(dummy "u, v")
    #(key "bmargin center horizontal Right noreverse enhanced autotitle nobox")
    #(parametric "")
    #(view "45 50 1 1")
    #(isosamples "100, 20")
    #(style "data lines")
    #(hidden3d "back offset 1 trianglepattern 3 undefined 1 altdiagonal bentover")
    #(urange "[ 0 : 31.4159 ] noreverse writeback")
    #(vrange "[ 0 : 6.28319 ] noreverse writeback")
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
  "(1-0.1*cos(v))*cos(u),(1-0.1*cos(v))*sin(u),0.1*(sin(v)+u/1.7-10)")
