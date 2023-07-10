(defmodule histogram
  (export all))

;;; Original example:
;;; * https://gnuplot.sourceforge.net/demo_5.2/histograms.2.gnu
;;;
(defun opts ()
  '(#(title "US immigration from Northern Europe\nPlot selected data columns as histogram of clustered boxes")
    #(style "fill solid 1.00 border lt -1")
    #(boxwidth "0.9 absolute")
    #(key "fixed right top vertical Right noreverse noenhanced autotitle nobox")
    #(style "increment default")
    #(style "histogram clustered gap 1 title textcolor lt -1")
    #(datafile "missing '-'")
    #(style "data histograms")
    #(xtics "border in scale 0,0 nomirror rotate by -45  autojustify")
    #(xtics "norangelimit")
    #(xtics  "()")
    #(xrange "[ * : * ] noreverse writeback")
    #(x2range "[ * : * ] noreverse writeback")
    #(yrange "[ 0 : 300000 ] noreverse nowriteback")
    #(y2range "[ * : * ] noreverse writeback")
    #(zrange "[ * : * ] noreverse writeback")
    #(cbrange "[ * : * ] noreverse writeback")
    #(rrange "[ * : * ] noreverse writeback")))

(defun plot ()
  "'examples/immigration.dat' using 6:xtic(1) ti col, '' u 12 ti col, '' u 13 ti col, '' u 14 ti col")
