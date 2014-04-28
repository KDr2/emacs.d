;;; init-geiser.el --- geiser mode settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'geiser)
(setq geiser-active-implementations '(guile flisp))
(setq geiser-default-implementation 'guile)

(require 'geiser-impl)
(setq geiser-flisp--binary "~/Work/opensrc/femtolisp/flisp")
(define-geiser-implementation (flisp guile)
    (binary geiser-flisp--binary)
    (arglist (lambda () nil))
    (repl-startup (lambda (remote) nil))
    (prompt-regexp "> ")
    (debugger-prompt-regexp geiser-guile--debugger-prompt-regexp)
    (enter-debugger geiser-guile--enter-debugger)
    (marshall-procedure geiser-guile--geiser-procedure)
    (find-module geiser-guile--get-module)
    (enter-command geiser-guile--enter-command)
    (exit-command geiser-guile--exit-command)
    (import-command geiser-guile--import-command)
    (find-symbol-begin geiser-guile--symbol-begin)
    (display-error geiser-guile--display-error)
    (display-help)
    (check-buffer geiser-guile--guess)
    (keywords geiser-guile--keywords)
    (case-sensitive geiser-guile-case-sensitive-p))

(provide 'init-geiser)
