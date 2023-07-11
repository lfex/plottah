(defmodule 3d-hidden
  (export all))

;;; Original example:
;;; * https://gnuplot.sourceforge.net/demo_5.2/hidden.3.gnu
;;;
(defun opts ()
  '(#(title "Hidden line removal of explicit surfaces")
    #(style "increment default")
    #(view "70, 45, 1, 1")
    #(samples "20, 20")
    #(isosamples "20, 20")
    #(hidden3d "back offset 1 trianglepattern 3 undefined 1 altdiagonal bentover")
    #(style "data lines")
    #(xrange "[ -3.00000 : 3.00000 ] noreverse nowriteback")
    #(x2range "[ * : * ] noreverse writeback")
    #(yrange "[ -3.00000 : 3.00000 ] noreverse nowriteback")
    #(y2range "[ * : * ] noreverse writeback")
    #(zrange "[ * : * ] noreverse writeback")
    #(cbrange "[ * : * ] noreverse writeback")
    #(rrange "[ * : * ] noreverse writeback")))

(defun splot-args ()
  "sin(x*x + y*y) / (x*x + y*y)")
