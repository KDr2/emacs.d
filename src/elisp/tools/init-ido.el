;; init-ido.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; ido mode settings
(require 'ido)

(ido-mode t)
(setq ido-ignore-buffers
      '("\\` " "^\*Mess" "^\*Help" "^\*Back" "^\*Completion" "^\*Ido"))


(provide 'init-ido)
