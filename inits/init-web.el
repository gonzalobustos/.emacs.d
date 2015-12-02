(require 'web-mode)
(require 'smartparens)
(require 'smartparens-html)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(setq web-mode-enable-auto-pairing nil)
(setq web-mode-markup-indent-offset 2)
(setq css-indent-offset 2)


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

(provide 'init-web)