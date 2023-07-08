(defmodule plottah
  ;; Convenience wrappers
  (export
    (start 0)
    (stop 0))
  ;; Plottah API
  ;; Debug
  (export
   (echo 1)
   (pid 0)
   (ping 0)
   (state 0)))

;; Constants

(defun APP () 'plottah)
(defun SERVER () 'plottah-svr)


;; Convenience wrappers
(defun start () (application:ensure_all_started (APP)))
(defun stop () (application:stop (APP)))

;; Plottah API

;; Debug

(defun echo (msg)
  (gen_server:call (SERVER) `#(cmd echo ,msg)))

(defun pid ()
  (erlang:whereis (SERVER)))

(defun ping ()
  (gen_server:call (SERVER) `#(cmd ping)))

(defun state ()
  (gen_server:call (SERVER) `#(cmd state)))
