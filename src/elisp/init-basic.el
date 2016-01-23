;;; init-basic.el --- basic settings for KDr2's emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; patches
(unless (fboundp 'outline-hide-sublevels)
  (defmacro outline-hide-sublevels (&rest body) `(hide-sublevels ,@body)))

;;common settings:
(setq-default transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; no splash message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setq default-buffer-file-coding-system 'utf-8)

;; no visible-bell
(setq visible-bell nil)

;; show trailing white spaces
(setq show-trailing-whitespace t)

;; set title
(setq frame-title-format
      '("Emacs [ " (buffer-file-name "%f \]"
                               (dired-directory dired-directory "%f \]"))))
;; animate mouse
(mouse-avoidance-mode 'animate)

;; show paren pair
(show-paren-mode t)
;; (setq show-paren-style 'parentheses)
(setq show-paren-style 'expression)

;; use text-mode as default mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook
          '(lambda ()
             (setq require-final-newline nil)))

;; auto-fill
;;(setq default-fill-column 70)
(auto-fill-mode -1)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook '(lambda ()
                             (auto-fill-mode -1)))

;; set tab = 4 spaces
;;(setq default-tab-width 4)
;;(setq tab-width 4)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

;;narrow
(put 'narrow-to-region 'disabled nil)

(scroll-bar-mode -1)
(if (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
;; scroll margin
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)

;; kill-ring length
(setq kill-ring-max 200)

;; timestamp
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S K.T")

;; column number
(setq column-number-mode t)

;;'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; how to show mouse on tab
(setq x-stretch-cursor t)

;;(server-start)

;;calendar settings
(setq calendar-week-start-day 1) ;; first weekday

;; syntax highlight
(global-font-lock-mode t)

;; auto open compression files
(auto-compression-mode 1)

;; no blink
(blink-cursor-mode -1)

;; use icomplele mode
(icomplete-mode 1)

;; for X11 on MacOSX
(setq x-alt-keysym 'meta)

;;SET KEY
(global-set-key "\C-xk" 'kill-this-buffer)
;;(global-set-key "\C-xr" 'replace-string)

;; work dir
(setq default-directory (vars-get 'work-dir))

;; backup
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist (list (cons "."  (vars-get 'backup-dir))))
(setq backup-by-copying t)

(defun dtw-enable ()
  (interactive)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defun dtw-disable ()
  (interactive)
  (remove-hook 'before-save-hook 'delete-trailing-whitespace))

;; exec-path
(setq exec-path (concatenate 'list exec-path (vars-get 'exec-path)))
(setenv "PATH" (concatenate 'string
                            (getenv "PATH")
                            ":"
                            (mapconcat 'identity (vars-get 'exec-path) ":")))

(provide 'init-basic)
