;;; common.el --- common functions/macros for KDr2's emacs configuration

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


(defmacro do-on-os (os-type &rest body)
  `(if (string= system-type ,os-type)
       (progn ,@body)))

(defun string/starts-with (s arg)
      "returns non-nil if string S starts with ARG.  Else nil."
      (cond ((>= (length s) (length arg))
             (string-equal (substring s 0 (length arg)) arg))
            (t nil)))

(defun string/trim-left (s)
  "Remove whitespace at the beginning of S."
  (if (string-match "\\`[ \t\n\r]+" s)
      (replace-match "" t t s)
    s))

(defun string/trim-right (s)
  "Remove whitespace at the end of S."
  (if (string-match "[ \t\n\r]+\\'" s)
      (replace-match "" t t s)
    s))

(defun string/trim (s)
  "Remove whitespace at the beginning and end of S."
  (string/trim-left (string/trim-right s)))

(defun file-string (file)
    "Read the contents of a file and return as a string."
    (with-temp-buffer
      (insert-file-contents file)
      (buffer-string)))

(defun box-type ()
  (string/trim (file-string (concatenate 'string user-emacs-directory "box-type"))))

(defun xhtml-css-from-file (file)
  (concatenate
   'string
   "<style rel=\"stylesheet\" type=\"text/css\">
<!--/*--><![CDATA[/*><!--*/
"
   (file-string file)
   "
/*]]>*/-->
</style>"))
