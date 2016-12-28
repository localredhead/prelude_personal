(setq user-full-name "Levi Strope")
(setq user-mail-address "levi.strope@gmail.com")

(require 'server)
(load "server")
(unless (server-running-p)
  (server-start))

; (setenv "EDITOR" "emacsclient -t")

(setq max-lisp-eval-depth 10000)

;;Remove ^M symbols
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-selection-value)
