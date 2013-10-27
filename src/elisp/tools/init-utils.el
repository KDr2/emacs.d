;;; init-utils.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; window-numbering
(require-package 'window-numbering)
(window-numbering-mode t)

;;; highlight-current-line mode settings
(require-package 'highlight-current-line)
;;(highlight-current-line-on t)

;;; vline mode settings
(require-package 'vline)
(global-set-key "\C-xt" 'vline-global-mode)

;;; undo-tree mode settings
(require-package 'undo-tree)
(global-undo-tree-mode)

;;; uniquify settings
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;; thumbs settings
(require 'thumbs)
(auto-image-file-mode t)

;;; w3m settings
;;(add-to-list 'load-path "~/.emacs.d/3rdparties/emacs-w3m")
(require-package 'w3m)
;;set w3m as the default browser of emacs
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(global-set-key "\C-xm" 'browse-url-at-point)

(provide 'init-utils)
