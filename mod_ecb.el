;;ecb
;;install from elpa
;; (require 'ecb)
;; (setq my-projects '("~/Projects"))
;; (setq ecb-source-path my-projects)
;; (setq stack-trace-on-error t)
;; (ecb-byte-compile)
;; (setq ecb-tip-of-the-day nil)
;; (setq ecb-layout-name "left7")   ; set directories buffer to display sources.
;; (ecb-activate)

;;; The following semantic references are needed
;;; to solve an issue with ECB.
(require 'semantic)
(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)
