;;; init-sdcv.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'chinese-yasdcv)
(global-set-key (kbd "C-c d") 'yasdcv-translate-at-point)

;; legacy sdvc-mode
;; (require 'sdcv-mode)
;; (global-set-key (kbd "C-c d") 'sdcv-search)

(provide 'init-sdcv)
