;(setq max-specpdl-size 5)
;(setq debug-on-error t)
;(set-frame-font "Liberation Mono-13")
;(set-frame-font "Source Code Pro-14")
;(set-frame-font "Anonymous Pro-14")
;;(setq gc-cons-threshold 20000000)     ; 20 MB  -- prelude defaults to 50 MB

;;The following attempts to dynamically adjust the width of the gutter
;;to properly display line numbers. (cargo culted from Gist).
;;(defadvice linum-update-window (around linum-dynamic activate)
;;  (let* ((w (length (number-to-string
;;                     (count-lines (point-min) (point-max)))))
;;         (linum-format (concat " %" (number-to-string w) "d ")))
;;    ad-do-it))

;;autocomplete
;;install using elpa
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140414.2324/dict")
;; (ac-config-default)
;; (global-auto-complete-mode t)
;; (ac-flyspell-workaround)
;;(global-company-mode t)  ;; prelude supplies this

;;smart-mode-line
;;install from melpa
;(require 'smart-mode-line)
;(setq sml/shorten-modes t)
;(setq sml/shorten-directory t)
;(setq sml/theme 'dark)
;(if after-init-time (sml/setup)
;  (add-hook 'after-init-hook 'sml/setup))


;;w3m
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
;;(global-set-key "\C-xm" 'browse-url-at-point)
;;(setq w3m-use-cookies t)


;; '(hl-line ((t (:inherit highlight :background "black" :underline nil))))
;; '(linum ((t (:background "brightblack" :foreground "black")))))

