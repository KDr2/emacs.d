(require-package 'clojure-mode)
(require-package 'clojure-test-mode)
(require-package 'elein)
(require-package 'nrepl)
(require-package 'ac-nrepl)



;; Clojure Mode
(add-hook 'clojure-mode-hook 'paredit-mode)
(setq nrepl-hide-special-buffers t)

(provide 'init-clojure)
