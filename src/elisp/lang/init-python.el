;;; init-python.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load python mode

(require 'init-elpa)

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


;;
;; 1. set 'elpy-python in vars.el;
;;    or create a venv at ~/.emacs/elpy/rpc-venv;
;;    or create a venv anywhere and set ENV ELPY_PYTHON to its executable.
;; 2. in that python env, install the dependencies:
;;    pip install black rope jedi flake8 importmagic autopep8 yapf
;;

(defvar x-default-venv
  (let ((dft-path (concat user-emacs-directory "elpy/rpc-venv/bin/python")))
    (or (vars-get 'elpy-python)
        (getenv "ELPY_PYTHON")
        (if (file-exists-p dft-path) dft-path nil))))

(if (and (not noninteractive) x-default-venv)
    (progn
      (setq elpy-rpc-python-command x-default-venv)
      (elpy-enable))
  (message "elpy-mode is not fully enabled."))

(provide 'init-python)
