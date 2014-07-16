(prelude-require-packages '(fixmee highlight-indentation eproject smart-mode-line nav hlinum restclient twittering-mode powerline))
(prelude-require-package 'ecb)

(require 'server)
(unless (server-running-p)
  (server-start))
;(setenv "EDITOR" "emacsclient -nw")
(setq max-lisp-eval-depth 10000)
;(setq max-specpdl-size 5)
;(setq debug-on-error t)
;(set-frame-font "Liberation Mono-13")
;(set-frame-font "Source Code Pro-14")
;(set-frame-font "Anonymous Pro-14")
;;(setq gc-cons-threshold 20000000)     ; 20 MB  -- prelude defaults to 50 MB
(setq utf-translate-cjk-mode nil)     ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)  	  ; force everything to UTF-8
(setq locale-coding-system 'utf-8)  	; so all character input is valid.
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)  ;prelude already provides -- redundant
(setq javascript-indent-level 2)
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(semantic-mode 1)
(global-ede-mode t)
;(setq ido-enable-flex-matching t)
(setq-default truncate-lines 1)
(blink-cursor-mode t)
(show-paren-mode t)
(global-font-lock-mode 1)
(fringe-mode -1)
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)		; column numbers in the mode line
(global-hl-line-mode 1)	  ; highlight current line
(global-linum-mode 1)     ; line numbers in the gutter
(setq ns-pop-up-frames nil)
;;The following attempts to dynamically adjust the width of the gutter
;;to properly display line numbers. (cargo culted from Gist).
;;(defadvice linum-update-window (around linum-dynamic activate)
;;  (let* ((w (length (number-to-string
;;                     (count-lines (point-min) (point-max)))))
;;         (linum-format (concat " %" (number-to-string w) "d ")))
;;    ad-do-it))

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
;; ;uncomment for solarized
(set-face-background 'highlight-indentation-face "#000000")
(set-face-background 'highlight-indentation-current-column-face "#000000")

;;autocomplete
;;install using elpa
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140414.2324/dict")
;; (ac-config-default)
;; (global-auto-complete-mode t)
;; (ac-flyspell-workaround)
;;(global-company-mode t)  ;; prelude supplies this

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

;; (should probably use iTerm2 unless you want to install MouseTerm for Terminal.app)
;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda () (interactive) (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

;; eproject for usage in build-ctags helper.
;; need to re-install eproject for new emacs install
;; install from melpa
(require 'eproject)

;;remove ^M symbols
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)

;;powerline
(require 'powerline)
(powerline-center-theme)

;;smart-mode-line
;;install from melpa
;(require 'smart-mode-line)
;(setq sml/shorten-modes t)
;(setq sml/shorten-directory t)
;(setq sml/theme 'dark)
;(if after-init-time (sml/setup)
;  (add-hook 'after-init-hook 'sml/setup))

;;install restclient from melpa
(require 'restclient)

;;twittering mode
(setq twittering-use-master-password t)

;;Fix ansi color codes
;http://stackoverflow.com/questions/3072648/cucumbers-ansi-colors-messing-up-emacs-compilation-buffer
;http://stackoverflow.com/questions/5819719/emacs-shell-command-output-not-showing-ansi-colors-but-the-code
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(defadvice display-message-or-buffer (before ansi-color activate)
  "Process ANSI color codes in shell output."
  (let ((buf (ad-get-arg 0)))
    (and (bufferp buf)
         (string= (buffer-name buf) "*Shell Command Output*")
         (with-current-buffer buf
           (ansi-color-apply-on-region (point-min) (point-max))))))

;;Fix ansi colors for compilation buffer
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;;w3m
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
;;(global-set-key "\C-xm" 'browse-url-at-point)
;;(setq w3m-use-cookies t)


;; '(hl-line ((t (:inherit highlight :background "black" :underline nil))))
;; '(linum ((t (:background "brightblack" :foreground "black")))))


;;(require 'multi-term)
;;(setq multi-term-program "/bin/bash")
