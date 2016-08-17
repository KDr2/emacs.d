;;; init-hl-s.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; hightlight-symbol settings

(require 'init-elpa)

(require-package 'highlight-symbol)

(setq highlight-symbol-idle-delay 0.5)
(highlight-symbol-mode)

(defun hl-s-turn-on ()
  (let ((mod-list '("sh-mode"
                    "c-mode"
                    "c++-mode"
                    "julia-mode"
                    "lua-mode"
                    "clojure-mode"
                    "scala-mode"
                    "ruby-mode"
                    "erlang-mode"
                    "lisp-mode"
                    "cperl-mode"
                    "javascript-mode"
                    "js2-mode"
                    "emacs-lisp-mode"
                    "scheme-mode"
                    "python-mode"
                    "php-mode"
                    ;;"web-mode"
                    "tuareg-mode"
                    "graphviz-dot-mode")))
    (if (member (symbol-name major-mode) mod-list)
        (highlight-symbol-mode t))))

(define-globalized-minor-mode
  global-highlight-symbol-mode
  highlight-symbol-mode hl-s-turn-on)

(global-highlight-symbol-mode)

(provide 'init-hl-s)
