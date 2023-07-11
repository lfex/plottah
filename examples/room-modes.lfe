(defmodule room-modes
  (export all))

(defun opts ()
  "Room modes are used in room acoustics analysis. For more details,
  see the following:
  * https://en.wikipedia.org/wiki/Room_modes"
  '(#(title ("Room Modes" "(Dimensions: 12'11'' x 11'3'' x 9')"))
    #(datafile "separator ','")
    #(style "increment default")
    #(style "histogram clustered gap 1 title textcolor lt -1")
    #(style "data histograms")
    #(style "fill solid")
    #(boxwidth "2")
    #(fillstyle "0.5 solid")
    #(yrange "[ 0.00000 : 1.0 ] noreverse nowriteback")
    #(format "y ''")
    #(unset ytics)
    #(xrange "[ 20 : 460 ] noreverse writeback")
    #(xlabel "'Frequency (Hz)'")
    #(xtic "out")
    #(xtics "20 nomirror")
    #(grid "")
    #(key "on outside")))

(defun plot-args ()
  "'examples/room-modes.csv' u 2:1 title 'Length' w boxes lc rgb 'blue', '' u 3:1 title 'Width' w boxes lc rgb 'green', '' u 4:1 title 'Height' w boxes lc rgb 'red'")
