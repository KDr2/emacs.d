;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KDr2's Emacs Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'color-theme)
(defun color-theme-kdr2 ()
  (interactive)
  (color-theme-install
   '(color-theme-kdr2
     ((background-color . "#101e2e")
      (background-mode . light)
      (border-color . "#555753");;"#1a1a1a")
      (cursor-color . "#b7282e")
      (foreground-color . "wheat3")
      (mouse-color . "black"))
     (fringe ((t (:background "#555753"))))
     ;;(fringe ((t (:background "#468"))))
     ;;(mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:background "#0d4519"))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-keyword-face ((t (:foreground "#729fcf"))))
     (font-lock-string-face ((t (:foreground "#ad7fa8"))))
     (font-lock-type-face ((t (:foreground "#8ae234"))))
     (font-lock-variable-name-face ((t (:foreground "#b66d6d"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     (modeline ((t (:background "Gray75" :foreground "Black"))))
     (modeline-buffer-id ((t (:background "Gray75" :foreground "blue4"))))
     (modeline-mousable ((t (:background "Gray75" :foreground "firebrick"))))
     (modeline-mousable-minor-mode ((t (:background "Gray75" :foreground "green4"))))
     ;;IDO
     (ido-only-match ((t (:foreground "green4"))))
     (ido-subdir ((t (:foreground "blue"))))
     (ido-first-match ((t (:foreground "green"))))
     ;;rst
     (rst-level-1-face ((t (:background "#3d3b4f" :foreground "#d7003a" :bold t))))
     (rst-level-2-face ((t (:background "#3d3b4f" :foreground "#b94047" :bold t))))
     (rst-level-3-face ((t (:background "#3d3b4f" :foreground "#a86965" :bold t))))
     (rst-level-4-face ((t (:background "#3d3b4f" :foreground "#006e54" :bold t))))
     (rst-level-5-face ((t (:background "#3d3b4f" :foreground "#00a381" :bold t))))
     (rst-level-6-face ((t (:background "#3d3b4f" :foreground "#6e7955" :bold t))))
     ;;git-emacs
     (git--mark-blob-face ((t (:foreground "#6e79f0" :bold t))))
     (git--unknown-face ((t (:foreground "#6e7955" :bold t))))
     )))
(provide 'color-theme-kdr2)


