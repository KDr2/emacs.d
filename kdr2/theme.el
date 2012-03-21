
(load-file "~/.emacs.d/kdr2/color-theme-kdr2.el")
;;; UI Settings
(defun color-theme-and-fonts ()
  (if window-system
      (progn ;;x window
        ;; 不要 tool-bar 和 scroll-bar。
        (scroll-bar-mode -1)
        (tool-bar-mode -1)
        (color-theme-initialize)
        (color-theme-kdr2)
        (set-face-background 'highlight-current-line-face "#468")
        (set-face-background 'vline "#468")
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
                            'gb18030 (font-spec :family "Heiti TC" :size 13))
          (custom-set-variables
           '(term-default-bg-color "#11293b") ;;"#2f4f4f")
           '(term-default-fg-color "#f5deb3"))))
    (progn ;;no x
      ;;(color-theme-charcoal-black)
      (set-face-background 'vline "white")
      (set-face-background 'highlight-current-line-face "white")
      )))
(color-theme-and-fonts)

