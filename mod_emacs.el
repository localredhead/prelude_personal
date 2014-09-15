(prelude-require-packages '(fixmee highlight-indentation eproject smart-mode-line nav hlinum restclient twittering-mode powerline))
(prelude-require-package 'ecb)

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(require 'server)
(unless (server-running-p)
  (server-start))
;(setenv "EDITOR" "emacsclient -nw")
(setq max-lisp-eval-depth 10000)

(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)

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

;;for GUI only
(if (display-graphic-p)
    (progn (scroll-bar-mode -1)
           (highlight-changes-mode t)
           ;(toggle-frame-maximized)
))

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

(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; ecb deactivate hook
(add-hook 'ecb-deactivate-hook '(lambda () (ecb-disable-advices 'ecb-winman-not-supported-function-advices t)))

;;truncate lines for SQL buffers
;; (add-hook 'sql-interactive-mode-hook
;;           (lambda ()
;;             (toggle-truncate-lines t)))

;;Let SQL buffer wrap and turn off line numbers / line highlight
(add-hook 'sql-interactive-mode-hook (lambda () (visual-line-mode 1)))

;;autoload anything that ends in .restclient
(add-to-list 'auto-mode-alist '("\\.restclient\\'" . restclient-mode))
