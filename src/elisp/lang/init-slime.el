;;; init-slime.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; Common-Lisp and SLIME Settings

(require-package 'slime)
;; package.el compiles the contrib subdir, but the compilation order
;; causes problems, so we remove the .elc files there. See
;; http://lists.common-lisp.net/pipermail/slime-devel/2012-February/018470.html

;; (mapc #'delete-file
;;       (file-expand-wildcards (concat user-emacs-directory "elpa/slime-2*/contrib/*.elc")))

(require-package 'ac-slime)
(require-package 'hippie-expand-slime)

(setq inferior-lisp-program "/usr/bin/sbcl")
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)
;;(slime-setup)
;;(slime-setup '(slime-fancy))
(slime-setup '(slime-repl))
(defmacro def-slime (func-name lisp)
  `(if ,lisp
       (defun ,func-name ()
         (interactive)
         (let ((inferior-lisp-program ,lisp))
           (slime)))))

(def-slime ecl-slime (vars-get 'ecl-path))
(def-slime ecl-dev-slime (vars-get 'ecl-dev-path))
(def-slime sbcl-slime (vars-get 'sbcl-path))
(def-slime ccl-slime (vars-get 'ccl-path))
(def-slime clisp-slime (vars-get 'clisp-path))

(provide 'init-slime)
