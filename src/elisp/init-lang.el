;;; init-lang.el --- load modes about programming languages

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


(add-to-list 'load-path
             (concatenate 'string user-emacs-directory "src/elisp/lang"))

(defmacro if-lang (feature &rest body)
  `(if (memq ,feature (vars-get 'lang-extra-modes))
       (progn ,@body)))

;; markdown mode
(require 'init-md)

;; yaml mode
(require 'init-yaml)

;; system-tap mode
(require 'init-stap)

;; Lua mode
(require 'init-lua)

;; Javascript mode
(require 'init-javascript)

;; Python mode
(require 'init-python)

;; PHP mode
(require 'init-php)

;; mmm mode ;; I use web-mode now
;; (require 'init-mmm)

;; asm/gas mode
(require 'init-as)

;; c cpp asm makefile ...
(require 'init-c-cpp)

;; Erlang mode
(require 'init-erlang)

;; paredit mode
(require 'init-paredit)

;; clojure mode
(require 'init-clojure)

;; scala mode
(require 'init-scala)

;; slime mode
(require 'init-slime)

;; graphviz
(require 'init-graphviz)

;; web-mode
(require 'init-web)

;;; extra modes

;; Ocaml/Tuareg mode
(if-lang 'ocaml
         (require 'init-ocaml))

;; Ruby mode
(if-lang 'ruby
         (require 'init-ruby))

;; Auctex mode
(if-lang 'auctex
         (require 'init-auctex))

;; R/ESS Settings
(if-lang 'ess
         (require 'init-ess))

;; julia-mode
(if-lang 'julia
         (require 'init-julia))


;; Perl and PDE Mode Settings
(if-lang 'pde (require 'init-pde))

;; Go Settings
(if-lang 'go
         (require 'init-go))

(provide 'init-lang)
