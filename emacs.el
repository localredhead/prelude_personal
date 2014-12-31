(prelude-require-packages '(highlight-indentation nav hlinum powerline smart-mode-line sml-mode))

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(require 'server)
(unless (server-running-p)
  (server-start))
;(setenv "EDITOR" "emacsclient -nw")
(setq max-lisp-eval-depth 10000)

;;higlight current linenumber
(hlinum-activate)

;;remove ^M symbols
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)

;;powerline and smart-mode-line combined.
(require 'powerline)
(powerline-center-theme)
(sml/setup)  ;; this causes issues.  execute by hand and restart for random load issues
