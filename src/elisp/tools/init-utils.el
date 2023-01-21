;;; init-utils.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; window-numbering
(require-package 'window-numbering)
(window-numbering-mode t)

;;; hl-line
(global-hl-line-mode)

;;; undo-tree mode settings
(require-package 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history nil)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

;; bm.el
(require-package 'bm)

;;; uniquify settings
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;; thumbs settings
(require 'thumbs)
(auto-image-file-mode t)

;;; w3m settings
;; (add-non-elpa-load-path "/emacs-w3m")
;; (require-package 'w3m)
;;set w3m as the default browser of emacs
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(global-set-key "\C-xm" 'browse-url-at-point)

;;; htmlize
(require-package 'htmlize)

;; show line number
(if (version< emacs-version "26")
    (global-linum-mode t) ; linum-mode
  (global-display-line-numbers-mode t))

(provide 'init-utils)
