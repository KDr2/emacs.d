;;; init-basic.el --- patches for KDr2's emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; patches for outline functions
(dolist (fname '("hide-sublevels" "show-all"))
  (let ((short-func-name (intern fname))
        (long-func-name (intern (concat "outline-" fname))))
    (unless (fboundp long-func-name)
      (fset long-func-name (symbol-function short-func-name)))))

(provide 'init-patches)
