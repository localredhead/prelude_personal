(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(require 'server)
(unless (server-running-p)
  (server-start))
;(setenv "EDITOR" "emacsclient -nw")
(setq max-lisp-eval-depth 10000)

;;remove ^M symbols
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)
