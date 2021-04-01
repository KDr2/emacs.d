;;; init-theme.el --- theme setting

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;(setq default-frame-alist `((font . ,(vars-get 'xfont))))

(defvar x-default-font (case system-type
                         (("gnu/linux") "monospace-11")
                         (otherwise "Consolas-11")))
(defvar x-default-font-han (case system-type
                             (("gnu/linux") "WenQuanYi Micro Hei")
                             (("windows-nt" "cygwin" "darwin") "Simsun")
                             (otherwise "Simsun")))

(defun setup-x-fonts ()
  (set-frame-font (vars-get 'xfont x-default-font))
  (setq line-spacing 0)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family x-default-font-han)))
  (setq face-font-rescale-alist '(("monospace" . 1.0) ("WenQuanYi" . 1.23))))

;;; UI Settings
(defun color-theme-and-fonts ()
  (add-to-list 'custom-theme-load-path "~/.emacs.d/src/elisp/themes")
  (setq custom--inhibit-theme-enable nil)
  (load-theme 'wombat t nil)
  (load-file "~/.emacs.d/src/elisp/themes/wombat-custom.el")
  (when window-system ;; x window
    (scroll-bar-mode -1)
    (tool-bar-mode -1)
    (setup-x-fonts)))

(color-theme-and-fonts)

(defun x-new-frame-init (&optional frame)
  (interactive)
  (select-frame frame)
  (setup-x-fonts))

(add-hook 'after-make-frame-functions 'x-new-frame-init)


(provide 'init-theme)
