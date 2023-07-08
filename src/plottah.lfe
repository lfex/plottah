(defmodule plottah
  ;; Convenience wrappers
  (export
    (start 0)
    (stop 0))
  ;; Plottah API
  ;; Debug
  (export
   (pid 0)
   (echo 1)))

;; Constants

(defun APP () 'plottah)
(defun SERVER () 'plottah-svr)


;; Convenience wrappers
(defun start () (application:ensure_all_started (APP)))
(defun stop () (application:stop (APP)))

;; Plottah API

;; Debug

(defun pid ()
  (erlang:whereis (SERVER)))

(defun echo (msg)
  (gen_server:call (SERVER) `#(echo ,msg)))
