;;; init-clojure.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load modes about clojure

(require 'init-elpa)

(require-package 'clojure-mode)

(if (version< "26" emacs-version)
    (require-package 'cider))

(require-package 'elein)

(add-hook 'clojure-mode-hook 'paredit-mode)

(setq cider-repl-display-help-banner nil)

(provide 'init-clojure)
