(prelude-require-packages '(color-theme-solarized helm-ag))
(disable-theme 'zenburn)
(setq prelude-whitespace nil)
(setq prelude-guru nil)
(load-theme 'solarized-dark t)
;(load-theme 'cyberpunk t)

;; Solarized settings
(setq solarized-broken-srgb t)

;;color themes to try
;https://github.com/bruce/emacs-spacegray-theme
;https://github.com/osener/emacs-afternoon-theme/
;https://github.com/ChrisKempson/Tomorrow-Theme
;https://github.com/chriskempson/base16
;(setq flx-ido-threshhold 1000)
;;(flx-ido-mode -1)         ;;turn threshold off if this is enabled
(setq projectile-enable-caching t)
;;(setq projectile-global-mode t)  ;; provided by prelude
(setq company-begin-commands '(self-insert-command))
(setq aw-scope 'frame)
