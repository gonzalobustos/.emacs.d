(require 'cl)
(require 'smooth-scroll)
(require 'tabbar)

(tool-bar-mode -1)

(setq 
	smooth-scroll-mode t
	smooth-scroll/vscroll-step-size 3
  tabbar-cycle-scope 'tabs
  tabbar-use-images nil)

(set-face-attribute
 'tabbar-default nil
 :background "#515151"
 :foreground "#B88DB8"
 :box '(:line-width 1 :color "#515151" :style nil)
 :height 90)

(set-face-attribute
 'tabbar-unselected nil
 :background "#515151"
 :foreground "#B88DB8"
 :box '(:line-width 5 :color "#515151" :style nil))

(set-face-attribute
 'tabbar-selected nil
 :background "#393939"
 :foreground "#CCCCCC"
 :box '(:line-width 5 :color "#393939" :style nil))

(set-face-attribute
 'tabbar-button nil
 :background "#515151"
 :foreground "white"
 :box '(:line-width 1 :color "#515151" :style nil))

(set-face-attribute
 'tabbar-highlight nil
 :underline nil)

(set-face-attribute
 'tabbar-separator nil
 :background "#515151")

(custom-set-variables
 '(tabbar-buffer-home-button (quote ((" [+] ") " [-] ")))
 '(tabbar-home-button (quote (("[o]") "[x]")))
 '(tabbar-mode t nil (tabbar))
 '(tabbar-scroll-left-button (quote ((" << ") "")))
 '(tabbar-scroll-right-button (quote ((" >> ") "")))
 '(tabbar-separator (quote (0.5)))
 '(tabbar-use-images nil))

;; Change padding of the tabs
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

(setq custom-group-by-project nil)
;; what's going on with tabbar and flycheck?
(defun custom-tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
   (cond
    ;; Flycheck causes a buffer to temporarily become "Process" group, do not want
    ;; ((or (get-buffer-process (current-buffer))
    ;;      ;; Check if the major mode derives from `comint-mode' or
    ;;      ;; `compilation-mode'.
    ;;      (tabbar-buffer-mode-derived-p
    ;;       major-mode '(comint-mode compilation-mode)))
    ;;  "Process"
    ;;  )
    ((member (buffer-name)
             '("*scratch*" "*Messages*"))
     "Common"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    ((memq major-mode
           '(help-mode apropos-mode Info-mode Man-mode))
     "Help"
     )
    ((memq major-mode
           '(rmail-mode
             rmail-edit-mode vm-summary-mode vm-mode mail-mode
             mh-letter-mode mh-show-mode mh-folder-mode
             gnus-summary-mode message-mode gnus-group-mode
             gnus-article-mode score-mode gnus-browse-killed-mode))
     "Mail"
     )
    (t
     ;; Return `mode-name' if not blank, `major-mode' otherwise.
     (let ((group
            (if (and (stringp mode-name)
                     ;; Take care of preserving the match-data because this
                     ;; function is called when updating the header line.
                     (save-match-data (string-match "[^ ]" mode-name)))
                mode-name
              (symbol-name major-mode))))
       (if (projectile-project-p)
           (if custom-group-by-project
               (projectile-project-name)
             (format "%s:%s" (projectile-project-name) group))
         group))
     ))))

(defun custom-cached (func)
  "Turn a function into a cache dict."
  (lexical-let ((table (make-hash-table :test 'equal))
                (f func))
    (lambda (key)
      (let ((value (gethash key table)))
        (if value
            value
          (puthash key (funcall f) table))))))

;; evaluate again to clear cache
(setq cached-ppn (custom-cached 'custom-tabbar-buffer-groups))

(defun custom-tabbar-groups-by-project ()
  (funcall cached-ppn (buffer-name)))

(setq tabbar-buffer-groups-function 'custom-tabbar-groups-by-project)

(defun custom-toggle-group-by-project ()
  (interactive)
  (setq custom-group-by-project (not custom-group-by-project))
  (message "Grouping by project alone: %s"
           (if custom-group-by-project "enabled" "disabled"))
  (setq cached-ppn (custom-cached 'custom-tabbar-buffer-groups)))

(provide 'init-gui)
