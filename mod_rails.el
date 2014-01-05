(prelude-require-packages '(rspec-mode bundler rsense rhtml-mode rbenv robe))
(prelude-require-package 'rhtml-mode)

(add-to-list 'load-path "~/.emacs.d/vendor")

;;rsense
(setq rsense-home "/usr/local/bin/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;;rbenv
(setq rbenv-executable "/usr/local/bin/rbenv")
(setq rbenv-show-active-ruby-in-modeline nil)
(global-rbenv-mode)
(rbenv-use-global)

;;RHTML mode  ;todo swap this for web mode
(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda () (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

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
(require 'rspec-mode)
(setq rspec-use-opts-file-when-available nil)
(setq rspec-use-bundler-when-possible t);was nil
(setq rspec-use-rake-flag nil)
(setq rspec-use-zeus-when-possible t)

;;bundler
(require 'bundler)

;;Turn off truncate line mode for inf-ruby processes.
;;There is a problem with C-e inside inf-ruby processes and it crashes
;;the emacs process.  To avoid it, let the lines wrap.
(add-hook 'inf-ruby-mode-hook (lambda () (visual-line-mode 1)))

;;Let SQL buffer wrap and turn off line numbers / line highlight
(add-hook 'sql-interactive-mode-hook (lambda () (visual-line-mode 1)))

;;highlight indentation
(add-hook 'ruby-mode-hook 'highlight-indentation-mode)
(add-hook 'js2-mode-hook 'highlight-indentation-mode)
;; (add-hook 'rhtml-mode-hook 'highlight-indentation-mode)

;;allows access to pry from rinari web server buffer
(defun pry-jack-in ()
  (interactive)
  (comint-mode)
  (setq buffer-read-only nil)
  (compilation-shell-minor-mode))

;;robe - provides alot of IDE functionality
(defun setup-robe ()
  (robe-mode 1)
  (robe-start))
(require 'robe)
(add-hook 'ruby-mode-hook 'setup-robe)
(add-hook 'robe-mode-hook 'robe-ac-setup)
