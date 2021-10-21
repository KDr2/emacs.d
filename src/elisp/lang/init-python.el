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


;; 1. set 'elpy-python in vars.el
;; 2. in that python env, install the dependencies:
;;    pip install rope jedi flake8 importmagic autopep8 yapf
;;

(defvar x-default-venv
  (let ((py-path (concat user-emacs-directory "elpy/rpc-venv/bin/python")))
    (if (file-exists-p py-path)
        py-path
      nil)))

(if (and (not noninteractive) x-default-venv)
    (progn
      (setq elpy-rpc-python-command
            (or (vars-get 'elpy-python) x-default-venv))
      (elpy-enable))
  (progn ;; enable elpy-mode partially
    ;; (setq elpy-enabled-p t)
    ;; (add-hook 'python-mode-hook #'elpy-mode)
    (message "elpy-mode is not fully enabled.")))

(provide 'init-python)
