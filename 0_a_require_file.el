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
                            flymake-solidity
                            solidity-mode
                            twittering-mode
                            tabbar
                            fixmee
                            pbcopy
                            eproject
                            perspective
                            vagrant
                            vagrant-tramp
                            htmlize
                            git
                            ego
                            elfeed
                            elfeed-org
                            elfeed-goodies
                            plantuml-mode
                            ox-jira
                            yafolding
                            annotate
                            ztree
                            dracula-theme
                            org-bookmark-heading
                            org-plus-contrib
                            bm))

(setq bm-marker 'bm-marker-right)
