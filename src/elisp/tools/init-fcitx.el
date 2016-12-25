;;; init-fcitx.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; hightlight-symbol settings

(require 'init-elpa)

(require-package 'fcitx)

(fcitx-aggressive-setup)
(setq fcitx-use-dbus t)

(provide 'init-fcitx)
