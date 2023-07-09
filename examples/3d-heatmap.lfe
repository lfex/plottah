(defmodule 3d-heatmap
  (export all))

;;; Original example:
;;; * https://commons.wikimedia.org/wiki/File:Gnuplot_heatmap_3.svg
(defun opts ()
 #m(title "4D data (3D Heat Map)\nIndependent value color-mapped onto 3D surface"
    title-offset "character 0, 1, 0 font \"\" norotate"
    style "increment default"
    terminal "svg size 600,400 dynamic enhanced fname 'arial' fsize 11 butt solid"
    encoding "iso_8859_1"
    format "cb \"%4.1f\""
    view "49, 28, 1, 1.48"
    samples "25, 25"
    isosamples "50, 50"
    ticslevel "0"
    cbtics "border in scale 0,0 mirror norotate offset character 0, 0, 0"
    hidden3d "back offset 1 trianglepattern 3 undefined 1 altdiagonal bentover"
    style "data lines"
    xrange "[ 5.00000 : 35.0000 ] noreverse nowriteback"
    x2range "[ * : * ] noreverse nowriteback # (currently [-0.500000:4.50000] )"
    yrange "[ 5.00000 : 35.0000 ] noreverse nowriteback"
    y2range "[ * : * ] noreverse nowriteback # (currently [-0.500000:4.50000] )"
    zrange "[ * : * ] noreverse nowriteback # (currently [120.000:260.000] )"
    cbrange "[ * : * ] noreverse nowriteback # (currently [0.00000:22.0000] )"
    trange "[ * : * ] noreverse nowriteback # (currently [-5.00000:5.00000] )"
    urange "[ * : * ] noreverse nowriteback # (currently [-5.00000:5.00000] )"
    vrange "[ * : * ] noreverse nowriteback # (currently [-5.00000:5.00000] )"
    rrange "[ * : * ] noreverse nowriteback # (currently [8.98847e+307:-8.98847e+307] )"
    pm3d "implicit at s"
    colorbox "user"
    colorbox "vertical origin screen 0.9, 0.2, 0 size screen 0.03, 0.6, 0 front noborder"
    xlabel "x"
    xlabel-offset "character 3, 0, 0 font \"\" textcolor lt -1 norotate"
    ylabel "y"
    ylabel-offset "character -5, 0, 0 font \"\" textcolor lt -1 rotate by -270"
    zlabel "z"
    zlabel-offset "character 2, 0, 0 font \"\" textcolor lt -1 norotate"))


; Z(x,y) = 100. * (sinc(x,y) + 1.5)
; sinc(x,y) = sin(sqrt((x-20.)**2+(y-20.)**2))/sqrt((x-20.)**2+(y-20.)**2)
; color(x,y) = 10. * (1.1 + sin((x-20.)/5.)*cos((y-20.)/10.))
; GPFUN_Z = "Z(x,y) = 100. * (sinc(x,y) + 1.5)"
; GPFUN_sinc = "sinc(x,y) = sin(sqrt((x-20.)**2+(y-20.)**2))/sqrt((x-20.)**2+(y-20.)**2)"
; GPFUN_color = "color(x,y) = 10. * (1.1 + sin((x-20.)/5.)*cos((y-20.)/10.))"
; splot '++' using 1:2:(Z($1,$2)):(color($1,$2)) with pm3d title "4 data columns x/y/z/color"


(defun eqn ()
  ;; TBD
  )
