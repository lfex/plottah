(defmodule 3d-heatmap
  (export all))

;;; Original example:
;;; * https://gnuplot.sourceforge.net/demo_5.2/heatmaps.6.gnu
;;;
(defun opts ()
  '(#(title "4D data (3D Heat Map)\\nIndependent value color-mapped onto 3D surface")
    #(size "1, 0.9")
    #(origin "0, 0.05")
    #(#(title offset) "character 0, 1, 0 font '' norotate")
    #(style "increment default")
    #(format "cb '%4.1f'")
    #(view "49, 28, 1, 1.48")
    #(samples "25, 25")
    #(isosamples "50, 50")
    #(xyplane "relative 0")
    #(cbtics "border in scale 0,0 mirror norotate autojustify")
    #(urange "[ 5 : 35 ] noreverse nowriteback")
    #(vrange "[ 5 : 35 ] noreverse nowriteback")
    #(xrange "[ * : * ] noreverse nowriteback")
    #(x2range "[ * : * ] noreverse nowriteback")
    #(yrange "[ * : * ] noreverse nowriteback")
    #(y2range "[ * : * ] noreverse nowriteback")
    #(zrange "[ * : * ] noreverse nowriteback")
    #(cbrange "[ * : * ] noreverse nowriteback")
    #(rrange "[ * : * ] noreverse nowriteback")
    #(pm3d "implicit at s")
    #(colorbox "user")
    #(colorbox "vertical origin screen 0.9, 0.2, 0 size screen 0.03, 0.6, 0 front noinvert noborder")
    #(#(x label) "x")
    #(#(xlabel offset) "character 3, 0, 0 font '' textcolor lt -1 norotate")
    #(#(y label) "y")
    #(#(ylabel offset) "character -5, 0, 0 font '' textcolor lt -1 rotate")
    #(#(z label) "z")
    #(#(zlabel offset) "character 2, 0, 0 font '' textcolor lt -1 norotate")))

(defun funcs ()
  '(#("sinc(x,y)" "sin(sqrt((x-20.)**2+(y-20.)**2))/sqrt((x-20.)**2+(y-20.)**2)")
    #("Z(x,y)" "100. * (sinc(x,y) + 1.5)")
    #("color(x,y)" "10. * (1.1 + sin((x-20.)/5.)*cos((y-20.)/10.))")))

(defun splot-args ()
  "'++' using 1:2:(Z($1,$2)):(color($1,$2)) with pm3d title ''")
