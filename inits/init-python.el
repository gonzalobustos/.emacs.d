(add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))

(provide 'init-python)