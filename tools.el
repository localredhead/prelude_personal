(setq magit-last-seen-setup-instructions "1.4.0")

(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)

;; (should probably use iTerm2 unless you want to install MouseTerm for Terminal.app)
;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda () (interactive) (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

;; Fix ansi color codes
;; http://stackoverflow.com/questions/3072648/cucumbers-ansi-colors-messing-up-emacs-compilation-buffer
;; http://stackoverflow.com/questions/5819719/emacs-shell-command-output-not-showing-ansi-colors-but-the-code
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

;; Set Tags in root of rails dirs
;; for ubuntu: ctags-exuberant -a -e -f TAGS --tag-relative -R app lib spec config bin vendor
;; for osx: *compile ctags from source:  export CFLAGS=-O0 ;https://trac.macports.org/ticket/31256
;;     *Also make sure you are not compiling with llvm
;;      export PATH="/usr/local/bin:$PATH"  (after brew install ctags-excuberant)
;; generate tags for ruby gems using bundler(this is the holy grail of ctags generation)
;;    bundle show --paths | xargs  ctags-exuberant -a -e -f TAGS --tag-relative -R app lib spec config bin vendor
;;
;; (you may need to delete osx ctags installation unless you use brew link --overwrite ctags)
;;
;; *for brew install: (export CFLAGS=-O0 && brew install ctags && brew link --overwrite ctags)
;; (defun build-ruby-ctags ()
;;   (interactive)
;;   (message "building project tags")
;;   (let ((root (eproject-root)))
;;     (shell-command (concat "bundle show --paths | xargs  ctags -a -e -f TAGS --tag-relative -R app lib spec config bin")))
;;   (visit-project-tags)
;;   (message "tags built successfully"))
;; (setq tags-case-fold-search t)
;; (setq tags-revert-without-query 1) ;to avoid being asked to load the file.
;; (defun visit-project-tags ()
;;   (interactive)
;;   (let ((tags-file (concat (eproject-root) "TAGS")))
;;     (visit-tags-table tags-file)
;;     (message (concat "Loaded " tags-file))))

;; Turn off truncate line mode for inf-ruby processes, SQL buffers, except for when highlight-indentation is in scope
;; There is a problem with C-e inside inf-ruby processes and it crashes the emacs process.  To avoid it, let the lines wrap.
;; Let SQL buffer wrap and turn off line numbers / line highlight
(add-hook 'sql-interactive-mode-hook (lambda () (visual-line-mode 1)))
(add-hook 'inf-ruby-mode-hook (lambda () (visual-line-mode 1)))
(add-hook 'highlight-indentation-mode-hook (lambda () (setq truncate-lines t)))
(add-hook 'inf-ruby-mode-hook (lambda () (company-mode)))
;; Deprecating the following snippets in favor of implementations above.
;; =====================================================================
;; truncate lines for SQL buffers
;; (add-hook 'sql-interactive-mode-hook
;;           (lambda ()
;;             (toggle-truncate-lines t)))
;;
;; (add-hook 'highlight-indentation-mode-hook (lambda () (toggle-truncate-lines)))
