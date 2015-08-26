;; 3rd party deps can be installed with npm.
;; npm install tern jsxhint jshint
;; ** muy importante!

;; handlebars
(autoload 'handlebars-mode "handlebars-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . handlebars-mode))
(add-to-list 'auto-mode-alist '("\.handlebars\.erb$" . handlebars-mode))

;; web mode
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.dhtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(require 'flycheck)
;; jsxhint
(flycheck-define-checker jsxhint-checker
  "JSXHint syntax checker"
  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))
(add-hook 'web-mode-hook (lambda () ;; enable jsxhint/flycheck
                           (when (equal web-mode-content-type "jsx")
                             (flycheck-select-checker 'jsxhint-checker)
                             (flycheck-mode))))
;; (add-to-list 'flycheck-checkers 'jsxhint-checker)

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode) ;; incase JS-mode is loaded first, fallback to js2-minor-mode !!
;(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;; TERN
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'web-mode-hook (lambda () (tern-mode t)))
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'tern
  '(progn
     (require 'company-tern)
     (push 'company-tern company-backends)))

;; company tern
(require 'company)
(push 'company-tern company-backends)
(add-to-list 'company-backends 'company-tern)

;; refresh tern if needed.
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

;;highlight indentation
(add-hook 'ruby-mode-hook 'highlight-indentation-mode)
(add-hook 'js2-mode-hook 'highlight-indentation-mode)
(add-hook 'js-mode-hook 'highlight-indentation-mode)  ;js mode fallback if js2-mode isn't enabled
(add-hook 'haml-mode-hook 'highlight-indentation-mode)
(add-hook 'slim-mode-hook 'highlight-indentation-mode)
(add-hook 'handlebars-mode-hook 'highlight-indentation-mode)
(add-hook 'web-mode-hook 'highlight-indentation-mode)
(add-hook 'scss-mode-hook 'highlight-indentation-mode)
(add-hook 'php-mode-hook 'highlight-indentation-mode)
