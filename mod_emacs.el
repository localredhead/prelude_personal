;(set-frame-font "Liberation Mono-13")
;(set-frame-font "Source Code Pro-13")
;(set-frame-font "Anonymous Pro-14")
(setq utf-translate-cjk-mode nil)     ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)  	  ; force everything to UTF-8
(setq locale-coding-system 'utf-8)  	; so all character input is valid.
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default tab-width 2)
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)
(semantic-mode 1)
(global-ede-mode t)
;(ido-mode 1) ;prelude packages this
(setq ido-enable-flex-matching t)
(setq-default truncate-lines 1)
(blink-cursor-mode t)
(show-paren-mode t)
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)		; column numbers in the mode line
(global-hl-line-mode)			; highlight current line
;(global-linum-mode 1)			; add line numbers on the left
(global-font-lock-mode 1)
;(setq linum-format (propertize (format "\u0020%%%dd\u0020" (length (number-to-string (count-lines (point-min) (point-max)))))))
;(setq linum-format (propertize (format " %%%dd  " (length (number-to-string (count-lines (point-min) (point-max)))))))
;(setq linum-format 'dynamic)
;(setq linum-format "%4d\u2502 ")

;;fixmee mode
;;install from melpa
(require 'fixmee)
(global-fixmee-mode 1)

;;highlight indentation
;;install from melpa
(require 'highlight-indentation)

;;autocomplete
;;install using elpa
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20121203.832/dict")
(ac-config-default)
(global-auto-complete-mode t)
(ac-flyspell-workaround)

;;for GUI only
(if (display-graphic-p)
    (progn (scroll-bar-mode -1)
           (highlight-changes-mode t)
           ;(toggle-frame-maximized)
))

;; Makes scrolling smoother.
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; eproject for usage in build-ctags helper.
;; need to re-install eproject for new emacs install
;; install from melpa
(require 'eproject)

;;remove ^M symbols
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)
