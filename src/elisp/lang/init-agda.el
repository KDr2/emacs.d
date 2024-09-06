;;; init-agda.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load agda mode

(let* ((coding-system-for-read 'utf-8)
       (agda-mode-dir (or (vars-get 'agda-dir)
                           (concat (getenv "HOME") "/.cabal/bin")))
       (agda-mode-exe (or (vars-get 'agda-mode-exe) "agda-mode-2.8.0"))
       (agda-mode-path (concat agda-mode-dir "/" agda-mode-exe)))
  (if (file-exists-p agda-mode-path)
      (load-file (shell-command-to-string (concat agda-mode-path " locate")))))

(provide 'init-agda)
