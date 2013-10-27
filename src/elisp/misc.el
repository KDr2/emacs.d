;;; misc.el --- misc settings for KDr2's emacs configuration

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


;;copy当前行
(defun copy-current-line()
  (interactive)
  (kill-ring-save
   (line-beginning-position)
   (line-end-position)))

;;保存当前会话
(load "desktop")
(desktop-load-default)
;;(desktop-read)
(defun desktop-cd()
  (interactive)
  (desktop-change-dir "~/.emacs.d/desktop"))
(defun desktop-sv()
  (interactive)
  (desktop-save "~/.emacs.d/desktop")
  (message "desktop saved"))
(global-set-key (kbd "s-s") 'desktop-sv)
;;(global-set-key (kbd "s-o") 'desktop-cd)

(defun current-major-mode-name ()
  (interactive)
  (message (symbol-name major-mode)))
(defun all-minor-mode-name ()
  (interactive)
  (message "%s" minor-mode-list))

(if window-system
    (setenv "LS_COLORS" "di=32;0"))

(defun show-file-path ()
  (interactive)
  (message (buffer-file-name)))

(defun ido-find-opensrc-file (project)
  (interactive "sproject name: ")
  (let ((ido-current-directory (concat "~/Work/opensrc/" project)))
    ;;(ido-find-file)
    (ido-file-internal ido-default-file-method nil ido-current-directory)))
(global-set-key (kbd "C-c o") 'ido-find-opensrc-file)
