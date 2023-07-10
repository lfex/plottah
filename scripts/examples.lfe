infescript

(defun list-examples ()
  '(3d-heatmap
    3d-hidden
    histogram
    room-modes))

(defun run-example
  ((#"3d-heatmap")
   (plottah:splot (3d-heatmap:splot-args) (3d-heatmap:opts) (3d-heatmap:vars)))
  ((#"3d-hidden")
   (plottah:splot (3d-hidden:eqn) (3d-hidden:opts)))
  ((#"histogram")
   (plottah:plot (histogram:plot) (histogram:opts)))
  ((#"room-modes")
   (plottah:plot (room-modes:plot) (room-modes:opts))))

(defun main
  (('())
   (lfe_io:format "~p~n" (list (list-examples))))
  ((`(,name . ,_))
   (plottah:start)
   (timer:sleep 500)
   (run-example name)
   (timer:sleep 1000)
   (plottah:stop)))
