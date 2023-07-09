#! /usr/bin/env lfescript

(defun list-examples ()
  '(3d-hidden
    histogram))

(defun run-example
 ((#"3d-hidden")
  (plottah:splot (3d-hidden:eqn) (3d-hidden:opts)))
 ((#"histogram")
  (plottah:plot (histogram:plot) (histogram:opts))))

(defun main
 (('())
  (lfe_io:format "~p~n" (list (list-examples))))
 ((`(,name . ,_))
  (plottah:start)
  (timer:sleep 500)
  (run-example name)
  (timer:sleep 1000)
  (plottah:stop)))
