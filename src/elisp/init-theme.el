;;; init-theme.el --- theme setting

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;(setq default-frame-alist `((font . ,(vars-get 'xfont))))

;;; UI Settings
(defun color-theme-and-fonts ()
  (add-to-list 'custom-theme-load-path "~/.emacs.d/src/elisp/themes")
  (if window-system
      (progn ;;x window
        (scroll-bar-mode -1)
        (tool-bar-mode -1)
        (load-theme 'adwaita t nil)
        (load-file "~/.emacs.d/src/elisp/themes/adwaita-custom.el")
        ;;(do-on-os "gnu/linux"
        (progn
          ;;(set-default-font "courier-14")
          ;;(set-default-font "courier new-12")
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
      ;;(load-theme 'wombat t nil)
      ;;(load-file "~/.emacs.d/src/elisp/themes/wombat-custom.el")
      (load-theme 'adwaita t nil)
      (load-file "~/.emacs.d/src/elisp/themes/adwaita-custom.el"))))

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


(provide 'init-theme)
