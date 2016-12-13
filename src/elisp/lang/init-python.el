;;; init-python.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load python mode

(require 'init-elpa)
(require 'init-yas)

(require-package 'python-mode)
(require-package 'elpy)
(require-package 'cython-mode)

(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
;; Python Hook
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode nil
                            tab-width 4)
                      (setq python-indent-offset 4))))


;; pip install rope jedi flake8 importmagic autopep8 yapf

(elpy-enable)
;; (elpy-clean-modeline)

(provide 'init-python)
