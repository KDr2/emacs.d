;;; init-clojure.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load modes about clojure

(require-package 'clojure-mode)
(require-package 'clojure-test-mode)
(require-package 'elein)
(require-package 'nrepl)
(require-package 'ac-nrepl)

(add-hook 'clojure-mode-hook 'paredit-mode)
(setq nrepl-hide-special-buffers t)

(provide 'init-clojure)
