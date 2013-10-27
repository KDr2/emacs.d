;;; init-lua.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; Lua Mode Settings

(require-package 'lua-mode)

(setq lua-indent-level 4)
(add-to-list 'auto-mode-alist '("\\.lua?\\'" . lua-mode))
(add-hook 'lua-mode-hook
          (lambda ()
            (modify-syntax-entry ?. "." (syntax-table))))

(provide 'init-lua)
