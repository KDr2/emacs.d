;;; init-lang.el --- load modes about programming languages

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; markdown mode
(require 'init-md)

;; yaml mode
(require 'init-yaml)

;; Lua mode
(require 'init-lua)

;; Javascript mode
(require 'init-javascript)

;; Python mode
(require 'init-python)

;; c cpp asm makefile ...
(require 'init-c-cpp)

;; racket
(require 'init-racket)

;; paredit mode
(require 'init-paredit)

;; geiser mode
(require 'init-geiser)

;; graphviz
(require 'init-graphviz)

;; web-mode
(require 'init-web)

;;;;;;;;;;;;;;;;;;;
;;; extra modes ;;;
;;;;;;;;;;;;;;;;;;;

;; julia-mode
(if-lang 'julia (require 'init-julia))

;; slime mode
(if-lang 'slime (require 'init-slime))

;; system-tap mode
(if-lang 'stap (require 'init-stap))

;; Go Settings
(if-lang 'go (require 'init-go))

;; Hy mode
(if-lang 'hy (require 'init-hy))

;; PHP mode
(if-lang 'php (require 'init-php))

;; CUDA mode
(if-lang 'cuda (require 'init-cuda))

;; Erlang mode
(if-lang 'erlang (require 'init-erlang))

;; clojure mode
(if-lang 'clojure (require 'init-clojure))

;; scala mode
(if-lang 'scala (require 'init-scala))

;; Ocaml/Tuareg mode
(if-lang 'ocaml (require 'init-ocaml))

;; Ruby mode
(if-lang 'ruby (require 'init-ruby))

(if-lang 'rust (require 'init-rust))

;; Auctex mode
(if-lang 'auctex (require 'init-auctex))

;; R/ESS Settings
(if-lang 'ess (require 'init-ess))

(provide 'init-lang)
