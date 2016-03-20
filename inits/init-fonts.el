(require 'cl)

(defun font-candidate (&rest fonts)
  "Return existing font which first match."
  (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(set-face-attribute 'default nil :font (font-candidate 
  '"DejaVu Sans Mono-10.5:weight=normal" 
   "Droid Sans Mono-10.5:weight=normal"
   "Source Code Pro-11:weight=normal"
   "Consolas-10.5:weight=normal"
   "Monaco-10.5:weight=normal"
   "Inconsolata-10.5:weight=normal"))

(set-face-attribute 'mode-line          nil :height 100 :box nil)
(set-face-attribute 'minibuffer-prompt  nil :height 100) 

(provide 'init-fonts)