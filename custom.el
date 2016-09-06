(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-auto-save t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(auto-save-default nil)
 '(auto-save-file-name-transforms
   (quote
    ((".*" "/var/folders/nr/w1wqbdbd3lzf7t0rxs0py36m0000gn/T/" t))))
 '(auto-save-interval 20)
 '(auto-save-list-file-prefix nil)
 '(auto-save-timeout 1)
 '(background-color "#ffffd7")
 '(background-mode light)
 '(blink-cursor-mode nil)
 '(c-basic-indent 2)
 '(column-number-mode t)
 '(cursor-color "#626262")
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "282606e51ef2811142af5068bd6694b7cf643b27d63666868bc97d04422318c1" "90edd91338ebfdfcd52ecd4025f1c7f731aced4c9c49ed28cfbebb3a3654840b" "f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(diff-hl-margin-mode t)
 '(diff-hl-side (quote right))
 '(expand-region-preferred-python-mode (quote fgallina-python))
 '(fci-rule-color "#383838")
 '(flycheck-rubocop-lint-only t)
 '(font-use-system-font t)
 '(foreground-color "#626262")
 '(fringe-mode -1 nil (fringe))
 '(global-ede-mode t)
 '(global-font-lock-mode 1)
 '(global-hl-line-mode t)
 '(global-linum-mode nil)
 '(global-semantic-idle-local-symbol-highlight-mode t nil (semantic/idle))
 '(gnus-treat-from-gravatar (quote head))
 '(gnus-treat-mail-gravatar (quote head))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "resources/public/js/dev")))
 '(helm-ag-fuzzy-match t)
 '(helm-ag-ignore-patterns nil)
 '(helm-ag-insert-at-point (quote symbol))
 '(helm-ag-use-grep-ignore-list t)
 '(helm-buffer-max-length 60)
 '(helm-candidate-number-limit 500)
 '(helm-do-grep-preselect-candidate t)
 '(helm-ff-candidate-number-limit 500)
 '(helm-grep-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo")))
 '(highlight-changes-face-list
   (quote
    (highlight-changes-1 highlight-changes-2 highlight-changes-3 highlight-changes-4 highlight-changes-5 highlight-changes-6 highlight-changes-7)))
 '(highlight-indentation-offset 2)
 '(ido-default-file-method (quote selected-window))
 '(indent-guide-char ":")
 '(indent-guide-global-mode nil)
 '(indent-guide-recursive nil)
 '(indent-tabs-mode nil)
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(javascript-indent-level 2)
 '(js-indent-level 2)
 '(lisp-mode-hook
   (quote
    (#[nil "\300\301!\207"
           [run-hooks prelude-lisp-coding-hook]
           2]
     slime-lisp-mode-hook highlight-indentation-mode)))
 '(locale-coding-system (quote utf-8) t)
 '(mail-source-delete-incoming nil)
 '(mode-line-default-help-echo nil)
 '(mode-line-format
   (quote
    ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification sml/pos-id-separator mode-line-position smartrep-mode-line-string
     (vc-mode vc-mode)
     sml/pre-modes-separator mode-line-misc-info mode-line-end-spaces)))
 '(mode-line-in-non-selected-windows t)
 '(nav-width 30)
 '(nnimap-request-articles-find-limit 100)
 '(ns-pop-up-frames nil)
 '(nxml-attribute-indent 2)
 '(nxml-child-indent 2)
 '(package-selected-packages
   (quote
    (slime cider zop-to-char zenburn-theme yari yaml-mode web-mode volatile-highlights vkill vagrant-tramp vagrant undo-tree twittering-mode tabbar spinner smex smartparens smart-mode-line scss-mode ruby-tools rubocop rspec-mode rsense robe restclient rbenv rainbow-mode rainbow-delimiters queue projectile-rails php-mode perspective pbcopy ov operate-on-number neotree multi-term move-text magit key-chord json-mode js2-refactor ido-ubiquitous hlinum highlight-indentation helm-projectile helm-descbinds helm-cmd-t helm-ag handlebars-mode haml-mode guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine git-rebase-mode git-commit-mode gist geiser flycheck flx-ido fixmee expand-region exec-path-from-shell eproject elisp-slime-nav easy-kill discover-my-major diminish diff-hl company-tern color-theme-sanityinc-solarized coffee-mode clojure-mode bundler browse-kill-ring anzu ace-window)))
 '(prefer-coding-system (quote utf-8))
 '(projectile-global-mode t)
 '(projectile-switch-project-action (quote projectile-dired))
 '(rbenv-show-active-ruby-in-modeline t)
 '(redisplay-dont-pause t t)
 '(ring-bell-function (quote ignore) t)
 '(rspec-use-bundler-when-possible nil t)
 '(rspec-use-zeus-when-possible nil t)
 '(ruby-insert-encoding-magic-comment nil)
 '(scroll-conservatively 10000)
 '(scroll-margin 1)
 '(scroll-preserve-screen-position 1)
 '(scroll-step 1)
 '(semantic-mode 1)
 '(semantic-stickyfunc-indent-string " ")
 '(set-default-coding-systems (quote utf-8))
 '(set-language-environment (quote utf-8))
 '(set-selection-coding-system (quote utf-8))
 '(set-terminal-coding-system (quote utf-8))
 '(setq-default t t)
 '(show-paren-delay 0.05)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(show-paren-when-point-in-periphery nil)
 '(show-paren-when-point-inside-paren t)
 '(size-indication-mode t)
 '(sml/use-projectile-p (quote before-prefixes))
 '(sml/vc-mode-show-backend t)
 '(sp-autoescape-string-quote nil)
 '(sp-autoinsert-if-followed-by-same 1)
 '(sp-autoskip-closing-pair (quote always))
 '(sp-show-pair-delay 0.125)
 '(sp-show-pair-from-inside t)
 '(standard-indent 2)
 '(tab-always-indent (quote complete))
 '(tab-width 2)
 '(tabbar-background-color "#8FB28F")
 '(tabbar-mode t nil (tabbar))
 '(tabbar-separator (quote ("|")))
 '(tool-bar-mode nil)
 '(tramp-default-host "Levis-MacBook-Pro-3.local")
 '(tramp-default-method "ssh")
 '(tramp-encoding-shell "bash")
 '(tramp-remote-process-environment
   (quote
    ("TMOUT=0" "LC_CTYPE=''" "TERM=dumb" "INSIDE_EMACS='25.0.50.1,tramp:2.2.13-pre'" "CDPATH=" "HISTORY=" "MAIL=" "MAILCHECK=" "MAILPATH=" "PAGER=cat" "autocorrect=" "correct=" "RBENV_VERSION=2.1.6")))
 '(tramp-terminal-type "vt100")
 '(url-proxy-services (quote (("https" . "127.0.0.1:8888"))))
 '(utf-translate-cjk-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(volatile-highlights-mode t)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-indentation t)
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-current-column-highlight nil)
 '(web-mode-enable-current-element-highlight nil)
 '(web-mode-enable-element-content-fontification nil)
 '(web-mode-enable-element-tag-fontification nil)
 '(web-mode-enable-engine-detection t)
 '(web-mode-enable-heredoc-fontification nil)
 '(web-mode-enable-html-entities-fontification nil)
 '(web-mode-enable-inlays t)
 '(web-mode-enable-part-face nil)
 '(web-mode-enable-sql-detection t)
 '(web-mode-enable-whitespace-fontification nil)
 '(web-mode-indent-style 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 0)
 '(yas-global-mode t nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Ubuntu Mono"))))
 '(cursor ((t (:background "Magenta" :foreground "Blue"))))
 '(flycheck-error-list-highlight ((t (:inherit default))))
 '(highlight-indentation-current-column-face ((t (:background "gray20"))))
 '(highlight-indentation-face ((t (:background "gray20"))))
 '(hl-line ((t (:stipple nil :background "#383838"))))
 '(indent-guide-face ((t (:foreground "disabledControlTextColor"))))
 '(linum ((t (:background "black" :foreground "cyan"))))
 '(linum-highlight-face ((t (:background "cyan" :foreground "black"))))
 '(magit-section-title ((t (:background "brightblack" :foreground "#F0DFAF" :weight bold))))
 '(mode-line ((t (:background "#5F7F5F" :foreground "gray60" :inverse-video nil :box (:line-width -1 :style released-button)))))
 '(mode-line-highlight ((t (:box (:line-width 2 :color "#E0CF9F" :style released-button)))))
 '(mode-line-inactive ((t (:background "#4F4F4F" :foreground "#E0CF9F" :inverse-video nil :box (:line-width -1 :style released-button)))))
 '(region ((t (:background "dark slate gray"))))
 '(show-paren-match ((t (:background "#5F7F5F" :weight bold))))
 '(sp-show-pair-match-face ((t (:background "#5F7F5F" :weight bold))))
 '(tabbar-default ((t (:inherit variable-pitch :background "#DCDCCC" :foreground "#8FB28F" :height 0.8 :family "Courier Primal"))))
 '(tabbar-modified ((t (:background "#DFAF8F" :foreground "Red"))))
 '(tabbar-selected ((t (:background "#8FB28F" :foreground "#8C5353" :box (:line-width -1 :style pressed-button)))))
 '(tabbar-separator ((t (:background "#3F3F3F" :foreground "#AC7373"))))
 '(tabbar-unselected ((t (:background "#3F3F3F" :foreground "#4C7073" :box (:line-width -1 :style released-button))))))
