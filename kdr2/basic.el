;;; basic.el --- basic settings for KDr2's emacs

;; Copyright (C) 2012 KDr2 

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d
;; Version  : 0.7
;; Keywords : KDr2

;; This file is not part of GNU Emacs.
;;


;;common settings:
(setq-default transient-mark-mode t)
(setq x-select-enable-clipboard t)
;;禁用启动信息
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setq default-buffer-file-coding-system 'utf-8)

;;关闭烦人的出错时的提示声
(setq visible-bell nil)
;;把title设置为“文件名"
(setq frame-title-format
      '("[ " (buffer-file-name "%f \]"
                               (dired-directory dired-directory "%b \]"))))
;;光标靠近鼠标的时候，让鼠标自动让开，别挡住视线
(mouse-avoidance-mode 'animate)
;;下面的这个设置可以让光标指到某个括号的时候显示与它匹配的括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;设置缺省模式是text，而不是基本模式
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook
          '(lambda ()
             (setq require-final-newline nil)))
;;(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;设置tab为4个空格的宽度，而不是原来的2
;;(setq default-tab-width 4)
;;(setq tab-width 4)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

;;narrow
(put 'narrow-to-region 'disabled nil)

;;防止页面滚动时跳动
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
;;设置kill-ring-max为200，以防不测：）
(setq kill-ring-max 200)
;; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的
;; foobar<?> 形式。
(setq uniquify-buffer-name-style 'forward)

;; 设置时间戳，标识出最后一次保存文件的时间。
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S K.T")

;;显示列号
(setq column-number-mode t)

;;设置默认的列数
;;(setq default-fill-column 70)

;;'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; 如果设置为 t，光标在 TAB 字符上会显示为一个大方块 :)。
(setq x-stretch-cursor nil)

;;(server-start)

;;calendar settings
(setq calendar-week-start-day 1) ;; first weebday

;;开启语法高亮。
(global-font-lock-mode t)

;;打开压缩文件时自动解压缩。
(auto-compression-mode 1)

;;光标不要闪烁。
(blink-cursor-mode -1)

;;高亮显示匹配的括号。
(show-paren-mode 1)

;;给出用 M-x foo-bar-COMMAND 输入命令的提示。
(icomplete-mode 1)


;;SET KEY
(global-set-key "\C-xk" 'kill-this-buffer)
;;(global-set-key "\C-xr" 'replace-string)

;;设置默认工作目录
(setq default-directory (vars-get 'work-dir))

;; 所有的备份文件转移到~/.backup/emacs/目录下
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist (list (cons "."  (vars-get 'backup-dir))))
(setq backup-by-copying t)
;;不产生备份文件
;;(setq make-backup-files nil)


