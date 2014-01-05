(prelude-require-packages '(fixmee highlight-indentation auto-complete eproject smart-mode-line multi-term nav hlinum))
;(prelude-require-package 'nav)

(require 'server)
(unless (server-running-p)
  (server-start))
;(setenv "EDITOR" "emacsclient -nw")
;(setq max-lisp-eval-depth 10000) 
;(setq max-specpdl-size 5)
;(setq debug-on-error t)
;(set-frame-font "Liberation Mono-13")
;(set-frame-font "Source Code Pro-14")
;(set-frame-font "Anonymous Pro-14")
(setq gc-cons-threshold 20000000)     ; 20 MB
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
(setq ido-enable-flex-matching t)
(setq-default truncate-lines 1)
(blink-cursor-mode t)
(show-paren-mode t)
(global-font-lock-mode 1)
(fringe-mode -1)
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)		; column numbers in the mode line
(global-hl-line-mode 1)	  ; highlight current line
(global-linum-mode 1)     ; line numbers in the gutter

;; The following attempts to dynamically adjust the width of the gutter
;; to properly display line numbers. (cargo culted from Gist).
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

;;higlight current linenumber
(require 'hlinum)
(hlinum-activate)

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
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20131128.233/dict")
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

;;smart-mode-line
;;install from melpa
(require 'smart-mode-line)
(if after-init-time (sml/setup)
  (add-hook 'after-init-hook 'sml/setup))

;;install restclient from melpa
;;(require 'restclient)
