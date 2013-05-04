;(set-frame-font "Liberation Mono-13")
(set-frame-font "Source Code Pro-13")
;(set-frame-font "Anonymous Pro-14")
(setq utf-translate-cjk-mode nil)     ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)  	  ; force everything to UTF-8
(setq locale-coding-system 'utf-8)  	; so all character input is valid.
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)		; column numbers in the mode line
(scroll-bar-mode -1)
(global-hl-line-mode)			; highlight current line
(highlight-changes-mode t); highlight changes
(global-linum-mode 1)			; add line numbers on the left
(global-visual-line-mode 1)
(setq-default tab-width 2)
(toggle-frame-maximized)
(setq ring-bell-function 'ignore)

;;autocomplete
;;install using elpa
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20121203.832/dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(global-auto-complete-mode t)

;; eproject for usage in build-ctags helper.
;; install from melpa
(require 'eproject)

;;Helm Cmd T
;;install from melpa
(require 'helm-cmd-t)
(global-set-key (kbd "M-t") 'helm-cmd-t)

;;git gutter
;;install from melpa
;; (require 'git-gutter-fringe)
;; (setq git-gutter:update-threshold 2)
;; (setq git-gutter:update-hooks '(after-save-hook after-revert-hook))
;; (global-git-gutter-mode t)
;; (setq git-gutter-fr:side 'right-fringe)

;;diff-hl
;;install from melpa
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

;; Makes scrolling smoother.
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;;Navigate between emacs window panes.
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)

;;ecb
;;install from elpa
(require 'ecb)
(setq my-projects '("~/Projects"))
(setq ecb-source-path my-projects)
(setq stack-trace-on-error t)
(ecb-byte-compile)
(setq ecb-tip-of-the-day nil)
(setq ecb-layout-name "left7")   ; set directories buffer to display sources.
(ecb-activate)

;;; The following semantic references are needed
;;; to solve an issue with ECB.
(require 'semantic)
(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)

;;EDE and Semantic
;;bundled with emacs
(semantic-mode 1)
(global-ede-mode t)

;;Ido
;;bundled with emacs
(ido-mode 1)

;;ErgoEmacs
;; easy keys to split window. Key based on ErgoEmacs keybinding
;(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-4") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane
(global-set-key (kbd "M-0") 'delete-window) ; close current pane
(global-set-key (kbd "M-1") 'delete-other-windows)

(defalias 'list-buffers 'ibuffer) ;use ibuffer instead of list-buffer

;;osx specific stuff
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper o)] 'find-file)
(global-set-key [(hyper f)] 'isearch-forward)
(global-set-key [(hyper g)] 'isearch-repeat-)
(global-set-key [(hyper .)] 'keyboard-quit)
(global-set-key [(hyper q)] 'save-buffers-kill-emacs)
(global-set-key [(hyper z)] 'undo)
(global-set-key [(hyper shift z)] 'redo)
