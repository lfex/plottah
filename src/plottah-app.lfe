(defmodule plottah-app
  (behaviour application)
  ;; app implementation
  (export
   (start 2)
   (stop 1)))

(include-lib "logjam/include/logjam.hrl")

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (logger:set_application_level 'plottah 'all)
  (let ((cfg-file (++ (code:priv_dir 'logjam) "/config/dev.config")))
    (logjam:set-config `#(path ,cfg-file)))
  (log-info "Starting plottah application ...")
  (plottah-sup:start_link))

(defun stop (_state)
  (plottah-sup:stop)
  'ok)
