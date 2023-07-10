(defmodule plottah-cmd
  (export
    (join 2)))

(defun dbl-quote () 34)
(defun sngl-quote () 39)

(defun join
  (('title args)
   (join "title" (list (sngl-quote) args (sngl-quote))))
  ((cmd args) (when (is_atom cmd))
   (join (atom_to_list cmd) args))
  ((`#(,opt offset) args)
   (join (++ (atom_to_list opt) " offset") args))
  ((`#(,prefix label) args)
   (join (++ (atom_to_list prefix) "label") (list (sngl-quote) args (sngl-quote))))
  ((cmd args)
   (let ((args (lists:flatten args)))
     (if (io_lib:printable_unicode_list args)
       (io_lib:format "~s ~s" `(,cmd ,args))
       (io_lib:format "~s ~s" `(,cmd ,(string:join args " ")))))))
