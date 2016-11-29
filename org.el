(setq org-default-notes-file (concat org-directory "~/Projects/localredhead.github.io/moleskin/ledger.org"))

(define-key global-map "\C-cc" 'org-capture)

(defvar my/org-basic-task-template "* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>
%?

%i
" "Basic task data")

(setq org-capture-templates
      `(("t" "Tasks" entry
         (file+headline "~/Projects/localredhead.github.io/moleskin/ledger.org.gpg" "Inbox")
         ,my/org-basic-task-template)
        ("T" "Quick task" entry
         (file+headline "~/Projects/localredhead.github.io/moleskin/ledger.org.gpg" "Inbox")
         "* TODO %^{Task}\nSCHEDULED: %t\n"
         :immediate-finish t)
        ("i" "Interrupting task" entry
         (file+headline "~/Projects/localredhead.github.io/moleskin/ledger.org.gpg" "Inbox")
         "* STARTED %^{Task}"
         :clock-in :clock-resume)
        ("e" "Emacs idea" entry
         (file+headline "~/Projects/localredhead.github.io/moleskin/emacs.org" "Emacs")
         "* TODO %^{Task}"
         :immediate-finish t)
        ("J" "Business task" entry
         (file+headline "~/Projects/localredhead.github.io/moleskin/work.org.gpg" "Tasks")
         ,my/org-basic-task-template)
        ("z" "Business Journal Timed" entry
         (file+datetree "~/Projects/localredhead.github.io/moleskin/work.org.gpg")
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("j" "Business Journal" entry
         (file+datetree "~/Projects/localredhead.github.io/moleskin/work.org.gpg")
         "* %?\n%U\n")
        ("Q" "Quick note" item
         (file+headline "~/Projects/localredhead.github.io/moleskin/ledger.org.gpg" "Quick notes"))
        ("n" "Notes" entry
         (file+datetree "~/Projects/localredhead.github.io/moleskin/ledger.org.gpg")
         "* %?\n\n%i\n%U\n"
         )))

(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode)))

(require 'epa-file)
(epa-file-enable)

;; (require 'org-crypt)
;; (org-crypt-use-before-save-magic)
;; (setq org-tags-exclude-from-inheritance (quote ("crypt")))
;; ;; GPG key to use for encryption
;; ;; Either the Key ID or set to nil to use symmetric encryption.
;; (setq org-crypt-key nil)
