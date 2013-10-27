
(add-to-list 'load-path
             (concatenate 'string user-emacs-directory "src/elisp/lang"))

;; clojure mode
(require 'init-clojure)

;; c cpp asm makefile ...
(require 'init-c-cpp)

;; Erlang mode
(require 'init-erlang)

(provide 'init-lang)
