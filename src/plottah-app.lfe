(defmodule plottah-app
  (behaviour application)
  ;; app implementation
  (export
   (start 2)
   (stop 1)))

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (logger:set_application_level 'plottah 'all)
  (logger:info "Starting plottah application ...")
  (plottah-sup:start_link))

(defun stop (_state)
  (plottah-sup:stop)
  'ok)
