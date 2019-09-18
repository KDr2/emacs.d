;;; misc.el --- misc settings for KDr2's emacs configuration

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


;; copy current line
(defun copy-current-line()
  (interactive)
  (kill-ring-save
   (line-beginning-position)
   (line-end-position)))

;; save session
;; (load "desktop")
;; (desktop-save-mode t)

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
  (interactive "project name: ")
  (let ((ido-current-directory (concat "~/Work/opensrc/" project)))
    ;;(ido-find-file)
    (ido-file-internal ido-default-file-method nil ido-current-directory)))
(global-set-key (kbd "C-c o") 'ido-find-opensrc-file)
