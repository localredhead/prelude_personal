;;autocomplete
;;install using elpa
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20121203.832/dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(global-auto-complete-mode t)

;;restclient for testing api's
(require 'restclient)

;; eproject for usage in build-ctags helper.
;; install from melpa
(require 'eproject)

;;Helm Cmd T
;;install from melpa
(require 'helm-cmd-t)
(global-set-key (kbd "M-t") 'helm-cmd-t)
