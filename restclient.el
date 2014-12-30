(prelude-require-packages '(restclient json-mode))

;;autoload anything that ends in .restclient
(add-to-list 'auto-mode-alist '("\\.restclient\\'" . restclient-mode))

;;restclient response buffer is called *HTTP Response*
(defun fix-restclient ()
  (js2-mode 0)
  (js-mode 0)
  (javascript-mode 0)
  (json-mode 1))

(add-to-list 'auto-mode-alist '("^\\*HTTP Response\\*$" . 'fix-restclient))
