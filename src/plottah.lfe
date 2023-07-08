(defmodule plottah
  (behaviour gen_server)
  ;; OTP API
  (export
   (start_link 0)
   (stop 0))
  ;; Convenience wrappers
  (export
    (start 0))
  ;; Plottah API
  ;; Debug
  (export
   (pid 0)
   (echo 1)))

;; Constants

(defun SERVER () 'plottah-svr)

;; OTP API
(defun start_link () (plottah-svr:start_link))
(defun stop () (plottah-svr:stop))

;; Convenience wrappers
(defun start () (plottah-svr:start_link))

;; Plottah API

;; Debug

(defun pid ()
  (erlang:whereis (SERVER)))

(defun echo (msg)
  (gen_server:call (SERVER) `#(echo ,msg)))
