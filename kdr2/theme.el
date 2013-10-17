;;; theme.el --- theme setting

;; Copyright (C) 2012 KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d
;; Version  : 0.7
;; Keywords : KDr2

;; This file is not part of GNU Emacs.
;;

;;(setq default-frame-alist `((font . ,(vars-get 'xfont))))

;;; UI Settings
(defun color-theme-and-fonts ()
  (add-to-list 'custom-theme-load-path "~/.emacs.d/kdr2")
  (if window-system
      (progn ;;x window
        (scroll-bar-mode -1)
        (tool-bar-mode -1)
        (load-theme 'r2d2 t nil)
        ;;(do-on-os "gnu/linux"
        (progn
          ;;(set-default-font "courier-14")
          ;;(set-default-font "courier new-10")
          ;;(set-default-font "monospace-11")
          ;;(set-default-font "monofur-10")
          ;;(set-default-font "Monaco-13")
          (set-default-font (vars-get 'xfont))
          (setq line-spacing 0)
          (dolist (charset '(kana han symbol cjk-misc bopomofo))
            (set-fontset-font (frame-parameter nil 'font)
                              charset
                              (font-spec :family "WenQuanYi Micro Hei")))
          (setq face-font-rescale-alist '(("monospace" . 1.0) ("WenQuanYi" . 1.23)))))
    (progn ;;no x
      (load-theme 'r2d2t t nil))))
(color-theme-and-fonts)

(defun x-new-frame-init (&optional frame)
  (interactive)
  (select-frame frame)
  (if window-system
      (progn
        (set-default-font (vars-get 'xfont))
        (setq line-spacing 0)
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "WenQuanYi Micro Hei")))
        (setq face-font-rescale-alist '(("monospace" . 1.0) ("WenQuanYi" . 1.23)))
        ;;(color-theme-and-fonts)
        )))
(add-hook 'after-make-frame-functions 'x-new-frame-init)
