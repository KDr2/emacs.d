
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
          ;;(set-default-font "courier new-14")
          ;;(set-default-font "monofur-16")
          (set-default-font "Monaco-13")
          (setq line-spacing 0)
          (set-fontset-font (frame-parameter nil 'font)
                            'han (font-spec :family "Heiti TC" :size 13))
          (set-fontset-font (frame-parameter nil 'font)
                            'cjk-misc (font-spec :family "Heiti TC" :size 13))
          (set-fontset-font (frame-parameter nil 'font)
                            'bopomofo (font-spec :family "Heiti TC" :size 13))
          (set-fontset-font (frame-parameter nil 'font)
                            'gb18030 (font-spec :family "Heiti TC" :size 13))))
    (progn ;;no x
      (load-theme 'r2d2t t nil))))
(color-theme-and-fonts)

