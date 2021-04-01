;;; init-dired.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; dired setting

(require 'dired)
(require 'dired-x)
(global-set-key "\C-x\C-j" 'dired-jump)
(define-key dired-mode-map "b" 'dired-mark-extension)
(define-key dired-mode-map "c" 'dired-up-directory)
(define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
(define-key dired-mode-map "o" 'chunyu-dired-open-explorer)
(define-key dired-mode-map "r" 'dired-mark-files-regexp)
(define-key dired-mode-map "/" 'dired-mark-directories)
(define-key dired-mode-map "K" 'dired-kill-subdir)
(define-key dired-mode-map [(control ?/)] 'dired-undo)

(defun explorer-dired ()
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-exists-p file-name)
        (w32-shell-execute "open" file-name nil 1))))

(setq dired-listing-switches "-avl"  ;; parameters to ls
      dired-recursive-copies 'top
      dired-recursive-deletes 'top
      cvs-dired-use-hook 'always)

(provide 'init-dired)
