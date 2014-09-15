(prelude-require-packages '(rspec-mode bundler rsense rbenv rubocop handlebars-mode projectile-rails js2-mode js2-refactor tern company-tern))
(prelude-require-package 'robe)
;;npm install tern jsxhint jshint

(add-to-list 'load-path "~/.emacs.d/vendor")

;;rsense
(setq rsense-home "/usr/local/bin/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))

;;rbenv
(setq rbenv-executable "/usr/local/bin/rbenv")
(setq rbenv-show-active-ruby-in-modeline nil)
(global-rbenv-mode)
(rbenv-use-global)

; Set Tags in root of rails dirs
; for ubuntu: ctags-exuberant -a -e -f TAGS --tag-relative -R app lib spec config bin vendor
; for osx: *compile ctags from source:  export CFLAGS=-O0 ;https://trac.macports.org/ticket/31256
                                         ;Also make sure you are not compiling with llvm
;      export PATH="/usr/local/bin:$PATH"  (after brew install ctags-excuberant)
; generate tags for ruby gems using bundler(this is the holy grail of ctags generation)
;    bundle show --paths | xargs  ctags-exuberant -a -e -f TAGS --tag-relative -R app lib spec config bin vendor
; (you may need to delete osx ctags)
; (try just ctags on osx.)
(defun build-ruby-ctags ()
  (interactive)
  (message "building project tags")
  (let ((root (eproject-root)))
    (shell-command (concat "bundle show --paths | xargs  ctags -a -e -f TAGS --tag-relative -R app lib spec config bin")))
  (visit-project-tags)
  (message "tags built successfully"))
(setq tags-case-fold-search t)
(setq tags-revert-without-query 1) ;to avoid being asked to load the file.
(defun visit-project-tags ()
  (interactive)
  (let ((tags-file (concat (eproject-root) "TAGS")))
    (visit-tags-table tags-file)
    (message (concat "Loaded " tags-file))))

;;rspec
(setq rspec-use-opts-file-when-available nil)
(setq rspec-use-bundler-when-possible t);was nil
(setq rspec-use-rake-flag nil)
(setq rspec-use-zeus-when-possible t)

;;Turn off truncate line mode for inf-ruby processes.
;;There is a problem with C-e inside inf-ruby processes and it crashes
;;the emacs process.  To avoid it, let the lines wrap.
(add-hook 'inf-ruby-mode-hook (lambda () (visual-line-mode 1)))

;;allows access to pry from rinari web server buffer
(defun pry-jack-in ()
  (interactive)
  (comint-mode)
  (setq buffer-read-only nil)
  (compilation-shell-minor-mode))

;;rubocop - thought this was part of prelude?
(add-hook 'ruby-mode-hook 'rubocop-mode)
(add-hook 'haml-mode-hook 'rubocop-mode)

;;handlebars
(autoload 'handlebars-mode "handlebars-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . handlebars-mode))
(add-to-list 'auto-mode-alist '("\.handlebars\.erb$" . handlebars-mode))

;;web mode
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            ;; enable flycheck
            (flycheck-select-checker 'jsxhint-checker)
            (flycheck-mode)))

;;js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode) ;incase JS-mode is loaded first, fallback to js2-minor-mode
;(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;;highlight indentation
(add-hook 'ruby-mode-hook 'highlight-indentation-mode)
(add-hook 'js2-mode-hook 'highlight-indentation-mode)
(add-hook 'js-mode-hook 'highlight-indentation-mode)  ;js mode fallback if js2-mode isn't enabled
(add-hook 'haml-mode-hook 'highlight-indentation-mode)
(add-hook 'slim-mode-hook 'highlight-indentation-mode)
(add-hook 'handlebars-mode-hook 'highlight-indentation-mode)
(add-hook 'web-mode-hook 'highlight-indentation-mode)
(add-hook 'scss-mode-hook 'highlight-indentation-mode)

;;jsxhint
(flycheck-define-checker jsxhint-checker
  "JSXHint syntax checker"
  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))

;;projectile-rails
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;;enable tern
;(autoload 'tern-mode "tern.el" nil t)
(add-hook 'web-mode-hook (lambda () (tern-mode t)))
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;;refresh tern
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

;;robe - provides alot of IDE functionality
(defun setup-robe ()
  (robe-mode 1)
  (robe-start))
(require 'robe)
;(add-hook 'ruby-mode-hook 'setup-robe)
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (lambda () (run-at-time 5 nil (setup-robe)))))

;;company robe / tern
(push 'company-robe company-backends)
(push 'company-tern company-backends)


;;;;;  Deprecating the following
;===========================================================
;; (prelude-require-package 'rhtml-mode)
;; (prelude-require-package 'jsx-mode)

;;jsx mode
;;deprecation reason:  web-mode is better for React.js work w/ jsx files.
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
;; (autoload 'jsx-mode "jsx-mode" "JSX mode" t)
;; (add-hook 'jsx-mode-hook 'highlight-indentation-mode)

;;RHTML mode  ;todo swap this for web mode
;; (autoload 'rhtml-mode "rhtml-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
;; (add-hook 'rhtml-mode '(lambda () (define-key rhtml-mode-map (kbd "M-s") 'save-buffer)))
;; (add-hook 'rhtml-mode-hook 'highlight-indentation-mode)
