;;; init-cnfonts.el --- fonts settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'cnfonts)

(cnfonts-mode 1)
;; (setq cnfonts-use-face-font-rescale t)
;; (setq cnfonts-use-system-type t)
;; (cnfonts--select-profile "profile1")

;; (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
;; (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)

(provide 'init-cnfonts)
