infescript

(defun list-examples ()
  '(3d-heatmap
    3d-hidden
    fourier-approx
    histogram
    room-modes))

(defun run-example
  ((name '())
   (run-example name #"false"))
  ((#"all"  `(,to-file? . ,_))
   (lists:map
    (lambda (name)
      (run-example (list_to_binary (atom_to_list name)) (list to-file?)))
      (list-examples)))
  (((= #"3d-heatmap" name) `(,to-file? . ,_))
   (splot-example name
                  to-file?
                  (3d-heatmap:splot-args)
                  (3d-heatmap:opts)
                  (3d-heatmap:funcs)))
  (((= #"3d-hidden" name) `(,to-file? . ,_))
   (splot-example name
                  to-file?
                  (3d-hidden:eqn)
                  (3d-hidden:opts)))
  (((= #"fourier-approx" name) `(,to-file? . ,_))
   (plot-example name
                 to-file?
                 (fourier-approx:plot-args)
                 (fourier-approx:opts)
                 (fourier-approx:funcs-and-vars))
   ;; This one's complex, so it needs a bit more time to render
   (timer:sleep 1000))
  (((= #"histogram" name) `(,to-file? . ,_))
   (plot-example name
                 to-file?
                 (histogram:plot)
                 (histogram:opts)))
  (((= #"room-modes" name) `(,to-file? . ,_))
   (plot-example name
                 to-file?
                 (room-modes:plot)
                 (room-modes:opts))))

(defun to-file-opts (opts name)
  (lists:append opts
                `(#(terminal "jpeg enhanced size 800,600")
                  #(output ,(++ "'priv/output/" (binary_to_list name) ".jpg'")))))

(defun update-opts (opts name to-file?)
  (if (list_to_atom (binary_to_list to-file?))
    (to-file-opts opts name)
    opts))

(defun plot-example (name to-file? args opts)
  (plot-example name to-file? args opts '()))

(defun plot-example (name to-file? args opts vars)
  (let ((opts (update-opts opts name to-file?)))
    (plottah:plot args opts vars)))

(defun splot-example (name to-file? args opts)
  (splot-example name to-file? args opts '()))

(defun splot-example (name to-file? args opts vars)
  (let ((opts (update-opts opts name to-file?)))
    (plottah:splot args opts vars)))

(defun main
  (('())
   (lfe_io:format "~p~n" (list (list-examples))))
  ((`(,name . ,args))
   (plottah:start)
   (timer:sleep 500)
   (run-example name args)
   (timer:sleep 1000)
   (plottah:stop)))
