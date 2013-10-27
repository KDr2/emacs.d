;;; init-javascript.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load Javascript/JS2 mode

;;(require-package 'javascript-mode)

;;(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;;(autoload 'javascript-mode "javascript" nil t)

(require-package 'js2-mode)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(provide 'init-javascript)