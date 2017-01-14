;; (defun new-file-snippet (key)
;;   (interactive)
;;   (if (= (buffer-size) 0)
;;       (progn
;;         (insert key)
;;         (call-interactively 'yas-expand))))

;; (add-hook 'org-mode-hook '(lambda () (new-file-snippet "capture")))
