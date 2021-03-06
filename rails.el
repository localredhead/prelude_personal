;;rsense
(setq rsense-home "/usr/local/bin/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))

;;rbenv - sorry if you use rvm!
(setq rbenv-executable "/usr/local/bin/rbenv")
(setq rbenv-show-active-ruby-in-modeline nil)
(global-rbenv-mode)
(rbenv-use-corresponding)

;;rspec
(setq rspec-use-opts-file-when-available nil)
(setq rspec-use-bundler-when-possible t);was nil
(setq rspec-use-rake-flag nil)
(setq rspec-use-zeus-when-possible t)

;;allows access to pry from rinari web server buffer
(defun pry-jack-in ()
  (interactive)
  (comint-mode)
  (setq buffer-read-only nil)
  (compilation-shell-minor-mode))

;;rubocop - thought this was part of prelude?
(add-hook 'ruby-mode-hook 'rubocop-mode)
(add-hook 'haml-mode-hook 'rubocop-mode)

;;projectile-rails
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; ROBE
;; provides alot of IDE functionality
(defun setup-robe ()
  (robe-mode 1)
  (robe-start))
(require 'robe)

;; ;; Un-comment to enable robe automatically.
;; ;; Caution: can be problematic like this.
;; ;; (needs work maybe?)
;; (add-hook 'ruby-mode-hook 'setup-robe)
;; (add-hook 'ruby-mode-hook (lambda () (lambda () (run-at-time 5 nil (setup-robe)))))

;;company robe
(eval-after-load 'company
  '(push 'company-robe company-backends))
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

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
