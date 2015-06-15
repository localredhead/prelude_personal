(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(add-to-list 'load-path "~/.emacs.d/vendor")
(prelude-require-packages '(highlight-indentation
                            neotree
                            hlinum
                            smart-mode-line
                            multi-term
                            helm-cmd-t
                            rspec-mode
                            bundler
                            rsense
                            rbenv
                            rubocop
                            projectile-rails
                            robe
                            restclient
                            json-mode
                            handlebars-mode
                            js2-refactor
                            tern
                            company-tern
                            twittering-mode
                            tabbar
                            ecb
                            fixmee
                            pbcopy
                            eproject
                            perspective
                            vagrant
                            vagrant-tramp))



;; (prelude-require-package 'multi-term)
;; (prelude-require-packages '(nav god-mode))
;; (prelude-require-package 'helm-cmd-t)
;; (prelude-require-packages '(color-theme-solarized helm-ag))
;; (prelude-require-packages '(rspec-mode bundler rsense rbenv rubocop projectile-rails))
;; (prelude-require-package 'robe)
;; (prelude-require-packages '(restclient json-mode))
;; (prelude-require-packages '(handlebars-mode js2-mode js2-refactor tern company-tern))
;; (prelude-require-package 'twittering-mode)
;; (prelude-require-package 'tabbar)
;; (prelude-require-package 'ecb)
;; (prelude-require-package 'fixmee)
