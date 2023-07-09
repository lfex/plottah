#! /usr/bin/env lfescript

(defun main (_args)
  (plottah:start)
  (timer:sleep 500)
  (plottah:splot (3d-hidden:eqn) (3d-hidden:opts))
  (timer:sleep 1000)
  (plottah:stop))
