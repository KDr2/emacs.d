
;; auto-mode-alist
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.mak$\\'" . makefile-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.[sS]\\'" . asm-mode))

;; C/C++ Indent
(c-set-offset 'arglist-intro '+)
(c-set-offset 'arglist-cont-nonempty 'c-lineup-math)
(c-set-offset 'arglist-close 0)

(provide 'init-c-cpp)
