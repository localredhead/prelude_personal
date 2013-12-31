(prelude-require-packages '(nav))
;(prelude-require-package 'helm-cmd-t)

;(ac-set-trigger-key "TAB")
;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;;Helm Cmd T
;;install from melpa
;(require 'helm-cmd-t)
(global-set-key (kbd "M-t") 'helm-prelude)

;(global-set-key [remap find-tag] 'helm-etags-select)

(defalias 'list-buffers 'ibuffer) ;use ibuffer instead of list-buffer

(require 'nav)
(key-chord-define-global "nj" 'nav-toggle)

(require 'multi-term)
(key-chord-define-global "td" 'multi-term-dedicated-toggle)

;; (global-set-key (kbd "M-3") 'split-window-horizontally)
;; (global-set-key (kbd "M-4") 'split-window-vertically) ; split pane top/bottom
;; (global-set-key (kbd "M-s") 'other-window) ; cursor to other pane
;; (global-set-key (kbd "M-0") 'delete-window) ; close current pane
;; (global-set-key (kbd "M-1") 'delete-other-windows)

;;Navigate between emacs window panes.
;; (global-set-key (kbd "M-<up>") 'windmove-up)
;; (global-set-key (kbd "M-<down>") 'windmove-down)
;; (global-set-key (kbd "M-<right>") 'windmove-right)
;; (global-set-key (kbd "M-<left>") 'windmove-left)
