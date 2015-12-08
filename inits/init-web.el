(require 'web-mode)
(require 'smartparens)
(require 'smartparens-html)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(setq
  web-mode-enable-auto-pairing nil
  web-mode-markup-indent-offset 2
  web-mode-css-indent-offset 2
  web-mode-code-indent-offset 2)

(sp-with-modes '(web-mode)
  (sp-local-pair "%" "%"
   :unless '(sp-in-string-p)
   :post-handlers '(((lambda (&rest _ignored)
     (just-one-space)
     (save-excursion (insert " ")))
   "SPC" "=" "#")))
  (sp-local-pair "<% "  " %>" :insert "C-c %")
  (sp-local-pair "<%= " " %>" :insert "C-c =")
  (sp-local-pair "<%# " " %>" :insert "C-c #")
  (sp-local-tag "%" "<% "  " %>")
  (sp-local-tag "=" "<%= " " %>")
  (sp-local-tag "#" "<%# " " %>"))

(setq 
  web-mode-enable-auto-pairing nil
  web-mode-markup-indent-offset 2
  css-indent-offset 2
  web-mode-code-indent-offset 2
  jsx-indent-level 2)

(provide 'init-web)
