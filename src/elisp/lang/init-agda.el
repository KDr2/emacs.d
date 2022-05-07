;;; init-agda.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load agda mode

(let* ((coding-system-for-read 'utf-8)
       (agda-mode-path (or (vars-get 'agda-dir)
                           (concat (getenv "HOME") "/.cabal/bin")))
       (agda-mode-exe (concat agda-mode-path "/agda-mode")))
  (if (file-exists-p agda-mode-exe)
      (load-file (shell-command-to-string (concat agda-mode-exe " locate")))))

(provide 'init-agda)
