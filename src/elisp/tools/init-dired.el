;;; init-dired.el

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
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

(setq dired-listing-switches "-avl"  ;; ls 文件列表参数
      dired-recursive-copies 'top    ;; 复制目录时，递归复制所有字目录
      dired-recursive-deletes 'top   ;; 删除目录时，递归删除所有字目录
      cvs-dired-use-hook 'always) ;; 浏览 CVS 时，自动打开 pcl-cvs 界面

(provide 'init-dired)
