;;; init-rust.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load Rust Mode

(require 'init-elpa)

;; Workaround to avoid issue-520 of rust-mode:
;; - https://github.com/rust-lang/rust-mode/issues/520
;; - https://github.com/rust-lang/rust-mode/pull/521
(when (version< emacs-version "29.1")
  (provide 'treesit)
  (provide 'rust-ts-mode))

(require-package 'rust-mode)

(provide 'init-rust)
