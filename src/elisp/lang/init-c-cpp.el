;;; init-c-cpp.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; auto-mode-alist
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.mak$\\'" . makefile-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile" . makefile-mode))

;; C/C++ Indent
(c-set-offset 'arglist-intro '+)
(c-set-offset 'arglist-cont-nonempty 'c-lineup-math)
(c-set-offset 'arglist-close 0)

(provide 'init-c-cpp)
