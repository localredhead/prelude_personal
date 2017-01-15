(setq org-default-notes-file (concat org-directory "/remember.org.gpg"))
(setq org-startup-with-inline-images t)
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 9))))
(setq org-completion-use-ido t)

(define-key global-map "\C-cc" 'org-capture)

(defvar log-todo-template "* TODO %^{Task} \nSCHEDULED: %T\n
%^G
%a

%?

%i")

(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh         . t)
   (js         . t)
   (emacs-lisp . t)
   (perl       . t)
   (scala      . t)
   (clojure    . t)
   (python     . t)
   (ruby       . t)
   (dot        . t)
   (css        . t)
   (plantuml   . t)))

;; (setq org-capture-templates '(("n" "Quick note" entry
;;                                (file+datetree org-default-notes-file)
;;                                "%? %U"
;;                                :prepend t)

;;                               ("t" "TODO" entry
;;                                (file+datetree org-default-notes-file)
;;                                ,log-todo-template
;;                                :prepend t
;;                                :emptylines 1
;;                                :immediate-finish t)

;;                               ("d" "Daily Task" checkitem
;;                                (file+datetree org-default-notes-file)
;;                                "%?"
;;                                :prepend t)

;;                               ("j" "Journal" entry
;;                                (file+datetree "ledger.org.gpg" "Journal")
;;                                "* %? %U"
;;                                :unnarrowed f)
;;                               ))
