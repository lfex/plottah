infescript

(defun list-examples ()
  '(3d-heatmap
    3d-hidden
    fourier-approx
    histogram
    room-modes))

(defun run-example
  ((#"3d-heatmap")
   (plottah:splot (3d-heatmap:splot-args)
                  (3d-heatmap:opts)
                  (3d-heatmap:funcs)))
  ((#"3d-hidden")
   (plottah:splot (3d-hidden:eqn)
                  (3d-hidden:opts)))
  ((#"fourier-approx")
   (plottah:plot (fourier-approx:plot-args)
                 (fourier-approx:opts)
                 (fourier-approx:funcs-and-vars))
   ;; This one's complex, so it need a bit more time to render
   (timer:sleep 1000))
  ((#"histogram")
   (plottah:plot (histogram:plot)
                 (histogram:opts)))
  ((#"room-modes")
   (plottah:plot (room-modes:plot)
                 (room-modes:opts))))

(defun main
  (('())
   (lfe_io:format "~p~n" (list (list-examples))))
  ((`(,name . ,_))
   (plottah:start)
   (timer:sleep 500)
   (run-example name)
   (timer:sleep 1000)
   (plottah:stop)))
