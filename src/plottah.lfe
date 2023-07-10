(defmodule plottah
  ;; Convenience wrappers
  (export
   (start 0)
   (stop 0))
  ;; Plottah API
  (export
   (plot 1) (plot 2) (plot 3)
   (set-opt 1)
   (set-opts 1)
   (set-var 1)
   (set-vars 1)
   (splot 1) (splot 2) (splot 3))
  ;; Debug
  (export
   (echo 1)
   (pid 0)
   (ping 0)
   (raw 1)
   (state 0)))

(include-lib "logjam/include/logjam.hrl")

;;; Constants

(defun APP () 'plottah)
(defun SERVER () 'plottah-svr)
(defun default-ms-delay () 100)

;;; Convenience wrappers

(defun start () (application:ensure_all_started (APP)))
(defun stop () (application:stop (APP)))

;;; Plottah API

(defun plot (args)
  (plot args '()))

(defun plot (args opts)
  (plot args opts '()))

(defun plot (args opts vars)
  (set-opts opts)
  (set-vars vars)
  (gen_server:call (SERVER) `#(cmd gplot ,(plottah-cmd:join 'plot args))))

(defun set-opts
  (('())
   '())
  ((`(,opt . ,rest))
   (set-opt opt)
   (set-opts rest)
   (default-ms-delay)))

(defun set-opt
  ((`#(unset ,val))
   (unset-opt (atom_to_list val)))
  ((`#(,opt ,val))
   (let ((args (plottah-cmd:join opt val)))
     (log-info (io_lib:format "Setting opt ~s" `(,args)))
     (gen_server:call (SERVER) `#(cmd gplot ,(lists:flatten (plottah-cmd:join 'set args)))))))

(defun unset-opt (opt)
  (log-info (io_lib:format "Unsetting opt ~s" `(,opt)))
  (gen_server:call (SERVER) `#(cmd gplot ,(lists:flatten (plottah-cmd:join 'unset opt)))))

(defun set-vars
  (('())
   '())
  ((`(,lhs-rhs . ,rest))
   (set-var lhs-rhs)
   (set-vars rest)
   (default-ms-delay)))

(defun set-var
  ((`#(,lhs ,rhs))
   (log-info (io_lib:format "Defining '~s' as '~s'" (list lhs rhs)))
   (let ((cmd (io_lib:format "~s = ~s" (list lhs rhs)))
         (ms-delay 500))
     (gen_server:call (SERVER) `#(cmd gplot ,cmd delay ,ms-delay)))))

(defun splot (args)
  (splot args '()))

(defun splot (args opts)
  (splot args opts '()))

(defun splot (args opts vars)
  (set-opts opts)
  (set-vars vars)
  (gen_server:call (SERVER) `#(cmd gplot ,(plottah-cmd:join 'splot args))))

;;; Debug

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
