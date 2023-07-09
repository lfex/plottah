(defmodule plottah-cmd
  (export
    (join 2)))

(defun space () 32)
(defun dbl-quote () 34)

(defun join
  (('title args)
   (join "title" (list (dbl-quote) args (dbl-quote))))
  ((cmd args) (when (is_atom cmd))
   (join (atom_to_list cmd) args))
  ((cmd args)
   (let ((args (lists:flatten args)))
     (if (io_lib:printable_unicode_list args)
       (io_lib:format "~s ~s" `(,cmd ,args))
       (io_lib:format "~s ~s" `(,cmd ,(string:join args " ")))))))
