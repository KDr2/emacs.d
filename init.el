;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;append  load-path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/3rdparties")
(add-to-list 'load-path "~/.emacs.d/kdr2")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;=======kdr2-ext-settings===
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/kdr2/main.el")

;;custom-settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(canlock-password "eea8e2f6e38400fe57a3ad7190f1a31c797398b3")
 '(default-input-method "eim-py")
 '(dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.\\|\\.o$")
 '(ibuffer-formats (quote ((mark modified read-only " " (name 32 -1) " " (size 6 -1 :right) " " (mode 20 16 :right) " " filename) (mark " " (name 32 -1) " " filename))))
 '(line-spacing 0)
 '(org-export-html-style "<style type=\"text/css\">
<!--/*--><![CDATA[/*><!--*/
body {
     font-size: 12pt;
     margin-top: 5%;
     margin-bottom: 8%;
     background: #fff; color: #black;
     margin-left: 15%; margin-right: 15%;
}

h1 { 
   font-size: 18pt;
   font-weight: bold;
   color: #ea8400; 
   padding-top: 1em;
   text-align: left;
   border-bottom: 2px solid #aaa;
}

h2 {
   font-size: 16pt;
   padding-top: 1em;
   border-bottom: 1px solid #ccc;
}

h3 {
   font-size: 14pt; 
   padding-top: 0.5em;
   border-bottom: 1px solid #eee;
}

.todo, .deadline { color: red; }
.done { color: green; }
.tag {text-align: right; color: blue;}
.timestamp {padding-left: 2px; padding-right: 2px; color: black;}
background-color: #ccc; border: solid 1px #aaa;}
.content {background-color: #fff;}
h1.title { text-align: left; }
.target { background-color: lavender; }

.menu {
      color: #666;
}

.menu a:link { 
      color: #888;
}
.menu a:active { 
      color: #888;
}
.menu a:visited { 
      color: #888;
}

a:link { 
      color: #8b6508;
}
a:active { 
      color: #8b6508;
}
a:visited { 
      color: #8b6508;
}

img { align: center; }

pre {
	border: 1pt solid #aaaaaa;
	background-color: #cccccc;
	padding: 5pt;
	font-family: courier, monospace;
	font-size: 9pt;
}

table { border: 0px; border-collapse: collapse; }

td, th {
	vertical-align: top;
	border: 0px;
}
/*]]>*/-->
</style>")
 '(org-export-html-style-include-default nil)
 '(pde-load-path "~/.emacs.d/3rdparties/pde/")
 '(pde-perl-version "5.10.0")
 '(ruby-indent-tabs-mode t)
 '(safe-local-variable-values (quote ((folded-file . t) (encoding . utf-8))))
 '(template-default-alist nil)
 '(template-directory-list nil)
 '(template-header-regexp nil)
 '(template-query nil)
 '(term-default-bg-color "#11293b")
 '(term-default-fg-color "#f5deb3")
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(vline-global-mode nil))

(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:foreground "#61CE3C" :weight bold))))
 '(highlight-symbol-face ((t (:background "#468" :foreground "#00FF00" :underline t)))))
