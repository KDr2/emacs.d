;;; init-rust.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load Rust Mode

(require 'init-elpa)

(if (version< emacs-version "29.1")
    (progn
      ;; TODO: rust-mode now requries tree-sitter, which can't be
      ;; loaded in Emacs 28

      ;; (require-package 'tree-sitter)
      ;; (require-package 'tree-sitter-langs)
      (setq rust-mode-treesitter-derive nil))
  (require-package 'rust-mode))


(provide 'init-rust)
