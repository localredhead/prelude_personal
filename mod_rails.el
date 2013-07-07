;;rsense
;;install using package manager.
(setq rsense-home "/usr/local/bin/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;;rdebug
;;download and unzip into /vendor
;;if on OSX, remove default emacs in /usr/bin and replace with emacs from homebrew
;; ./configure && make && sudo make install 
;; ---or http://stackoverflow.com/questions/1359333/how-do-i-use-ruby-debug-inside-emacs (last post)
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/ruby-debug-extra-0.10.4/emacs") 
(require 'rdebug)
(setq rdebug-short-key-mode t)
(global-set-key "\C-c\C-d" 'rdebug)
(autoload 'rdebug "rdebug" "ruby-debug interface" t)  

;;; rhtml-mode
;; get from https://github.com/eschulte/rhtml.git
(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook 
          (lambda () (rinari-launch)) )

;;rinari
(defun rinari-ruby-mode-hook ()
  (require 'rinari)
  (rinari-minor-mode))
(add-hook 'ruby-mode-hook 'rinari-ruby-mode-hook)
(setq rinari-tags-file-name "TAGS")

; Set Tags in root of rails dirs
; for ubuntu: ctags-exuberant -a -e -f TAGS --tag-relative -R app lib spec config bin vendor 
; for osx: *compile ctags from source:  export CFLAGS=-O0 ;https://trac.macports.org/ticket/31256 
                                        ;Also make sure you are not compiling with llvm
;      export PATH="/usr/local/bin:$PATH"  (after brew install ctags-excuberant)
; generate tags for ruby gems using bundler(this is the holy grail of ctags generation) 
;    bundle show --paths | xargs  ctags-exuberant -a -e -f TAGS --tag-relative -R app lib spec config bin vendor 
; (you may need to delete osx ctags)
; (try just ctags on osx.)
(defun build-ctags ()
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


;;emacs-rails
;;install from remvee's github
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/rails-minor-mode"))
(require 'rails)

;;emacs-spork
;;install from github
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/emacs-spork"))
(require 'emacs-spork)
(setq es-use-tmux-pane nil)
(setq es-use-emacs-buffer t)

;;rspec
(require 'rspec-mode)
(setq rspec-use-rvm t)
(setq rspec-use-opts-file-when-available nil)
(setq rspec-use-bundler-when-possible t);was nil
(setq rspec-use-rake-flag nil)

;;rvm
(require 'rvm)
;(rvm-use-default)
(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))  ;make sure you have a .rvmrc file for the project! run rvm --rvmrc --create ruby@gemset

;;bundler
;;install from melpa
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
(add-hook 'rhtml-mode-hook 'highlight-indentation-mode)

;;allows access to pry from rinari web server buffer
(defun rinari-pry-jack-in ()
  (interactive)
  (comint-mode)
  (setq buffer-read-only nil)
  (compilation-shell-minor-mode))

