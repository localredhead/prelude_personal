(require 'server)
(unless (server-running-p)
  (server-start))
;(setenv "EDITOR" "emacsclient -nw")
(setq max-lisp-eval-depth 10000)
(setq ecb-auto-compatibility-check nil)
;;Remove ^M symbols
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)
