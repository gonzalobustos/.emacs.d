(require 'js2-mode)
(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\.erb" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(defconst preferred-javascript-indent-level 2)

(setq-default js2-basic-offset 2
              js2-bounce-indent-p nil)

(setq-default js-indent-level preferred-javascript-indent-level)

(with-eval-after-load "js2-mode"
  (setq-default js2-mode-show-parse-errors nil
                js2-mode-show-strict-warnings nil)
  (autoload 'flycheck-get-checker-for-buffer "flycheck")
  (defun sanityinc/disable-js2-checks-if-flycheck-active ()
    (unless (flycheck-get-checker-for-buffer)
      (set (make-local-variable 'js2-mode-show-parse-errors) t)
      (set (make-local-variable 'js2-mode-show-strict-warnings) t)))
  (add-hook 'js2-mode-hook 'sanityinc/disable-js2-checks-if-flycheck-active)

  (add-hook 'js2-mode-hook (lambda () (setq mode-name "JS2"))))

(with-eval-after-load "coffee-mode"
  (setq coffee-tab-width preferred-javascript-indent-level))

(when (fboundp 'coffee-mode)
  (add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . coffee-mode)))

(provide 'init-javascript)