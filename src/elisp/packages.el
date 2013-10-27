;;; packages.el --- elpa settings

;; Copyright (C) 2012 KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d
;; Version  : 0.7
;; Keywords : KDr2

;; This file is not part of GNU Emacs.
;;
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives
;;             '("ELPA" . "http://tromey.com/elpa/"))


(package-initialize)

;; Clojure Mode
(unless (package-installed-p 'clojure-mode)
  (package-refresh-contents)
  (package-install 'clojure-mode))
(add-hook 'clojure-mode-hook 'paredit-mode)
(when (not (package-installed-p 'nrepl))
  (package-install 'nrepl))
(setq nrepl-hide-special-buffers t)

;;magit
(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))
