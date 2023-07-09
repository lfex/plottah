(defmodule plottah
  ;; Convenience wrappers
  (export
    (start 0)
    (stop 0))
  ;; Plottah API
  (export
    (set-opt 1)
    (set-opts 1)
    (splot 1) (splot 2))
  ;; Debug
  (export
   (echo 1)
   (pid 0)
   (ping 0)
   (raw 1)
   (state 0)))

(include-lib "logjam/include/logjam.hrl")

;; Constants

(defun APP () 'plottah)
(defun SERVER () 'plottah-svr)


;; Convenience wrappers
(defun start () (application:ensure_all_started (APP)))
(defun stop () (application:stop (APP)))

;; Plottah API

(defun set-opts
 ((opts) (when (is_map opts))
  (set-opts (maps:to_list opts)))
 (('())
  '())
 ((`(,opt . ,rest))
  (set-opt opt)
  (set-opts rest)))

(defun set-opt
  ((`#(,opt ,val))
   (let ((args (plottah-cmd:join opt val)))
     (log-debug (io_lib:format "Setting opt ~s" `(,args)))
     (gen_server:call (SERVER) `#(cmd gplot ,(lists:flatten (plottah-cmd:join 'set args)))))))

(defun splot (args)
  (splot args #m()))

(defun splot (args opts)
  (set-opts opts)
  (gen_server:call (SERVER) `#(cmd gplot ,(plottah-cmd:join 'splot args))))

;; Debug

(defun echo (msg)
  (gen_server:call (SERVER) `#(cmd echo ,msg)))

(defun pid ()
  (erlang:whereis (SERVER)))

(defun ping ()
  (gen_server:call (SERVER) `#(cmd ping)))

(defun state ()
  (gen_server:call (SERVER) `#(cmd state)))

(defun raw (raw-cmd)
  (gen_server:call (SERVER) `#(cmd gplot ,raw-cmd)))
