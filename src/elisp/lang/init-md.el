;;; init-markdown.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; Markdown Mode Settings

(require 'init-elpa)

(require-package 'markdown-mode)

(autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'init-md)
