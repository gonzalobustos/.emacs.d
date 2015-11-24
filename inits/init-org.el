(setq 
  org-log-done t
  org-default-notes-file (expand-file-name "~/.notes.org")  
  org-support-shift-select t
  org-use-fast-todo-selection t
  org-inhibit-startup-visibility-stuff t
  org-reverse-note-order t
  initial-buffer-choice org-default-notes-file)

(setq org-capture-templates
  '(
    ("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
     "* TODO %?\n %i\n %a")
    ("n" "Note" entry (file+headline org-default-notes-file "Notes")
     "* %?\n%U\n%a\n" :clock-resume t)))

(setq org-todo-keywords
  '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "DELEGATED(l)" "|" "DONE(d)" "CANCELED(c)" "DEFERRED(f)")))

(setq org-todo-keyword-faces
  '(
    ("TODO" :background "#f2777a" :foreground "#2d2d2d" :weight regular :box (:line-width 2))
    ("STARTED" :background "#ffcc66" :foreground "#2d2d2d" :weight regular :box (:line-width 2))
    ("WAITING" :background "#6699cc" :foreground "#2d2d2d" :weight regular :box (:line-width 2))
    ("DELEGATED" :background "#cc99cc" :foreground "#2d2d2d" :weight regular :box (:line-width 2))
    ("DEFERRED" :background "#f99157" :foreground "#2d2d2d" :weight regular :box (:line-width 2))
    ("DONE" :background "#99cc99" :foreground "#2d2d2d" :weight regular :box (:line-width 2))
    ("CANCELED" :background "#999999" :foreground "#2d2d2d" :weight regular :box (:line-width 2))))

(setq 
  org-agenda-compact-blocks t
  org-agenda-sticky t
  org-agenda-start-on-weekday nil
  org-agenda-include-diary t)

 (setq 
  calendar-week-start-day 1
  calendar-day-name-array ["Domingo" "Lunes" "Martes" "Miércoles" "Jueves" "Viernes" "Sábado"]
  calendar-month-name-array ["Enero" "Febrero" "Marzo" "Abril" "Mayo" "Junio" "Julio" "Agosto" 
  "Septiembre" "Octubre" "Noviembre" "Diciembre"]
  general-holidays nil
  christian-holidays nil)

(setq other-holidays 
      '((holiday-fixed 1 1   "Año Nuevo")          
        (holiday-fixed 2 16  "Carnaval")
        (holiday-fixed 2 17  "Carnaval")
        (holiday-fixed 3 23  "Feriado Puente Turístico")
        (holiday-fixed 3 24  "Día Nacional de la Memoria por la Verdad y la Justicia") 
        (holiday-fixed 4 2   "Día del Veterano y de los Caídos en la Guerra de Malvinas") 
        (holiday-fixed 4 3   "Viernes Santo") 
        (holiday-fixed 5 1   "Dia del Trabajador") 
        (holiday-fixed 5 25  "Revolución de Mayo") 
        (holiday-fixed 6 20  "Paso a la inmortalidad del General Manuel Belgrano")
        (holiday-fixed 7 9   "Día de la Independencia") 
        (holiday-fixed 8 17  "Paso a la inmortalidad del General José de San Martín")
        (holiday-fixed 10 12 "Día del Respeto a la Diversidad Cultural")
        (holiday-fixed 11 27 "Día de la Soberanía Nacional (trasladado desde el 20/11)")
        (holiday-fixed 12 7  "Feriado Puente Turístico")
        (holiday-fixed 12 8  "Inmaculada Concepción de María") 
        (holiday-fixed 12 25 "Navidad")))

(provide 'init-org)
