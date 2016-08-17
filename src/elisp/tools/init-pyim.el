;;; init-pyim.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; pyim setting

(require-package 'chinese-pyim)

(require 'chinese-pyim)

(setq default-input-method "chinese-pyim")

;; download dict from http://tumashu.github.io/chinese-pyim-bigdict/pyim-bigdict.pyim
(setq pyim-dicts
      `((:name "defaut"
               :file ,(concat user-emacs-directory "non-elpa/pyim-dicts/pyim-bigdict.pyim")
               :coding utf-8-unix)))

(setq pyim-use-tooltip t)

(global-set-key (kbd "C-;") 'pyim-toggle-full-width-punctuation)

(provide 'init-pyim)
