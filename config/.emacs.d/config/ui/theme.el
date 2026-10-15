;;-------------------- batpuccin --------------------
(use-package batppuccin
  :vc (:url "https://github.com/bbatsov/batppuccin-emacs" :rev :newest)
  :config
  (load-theme 'batppuccin-mocha t))

;; Italic color gris en comentarios
(custom-set-faces
 '(font-lock-comment-face
   ((t (:slant italic :foreground "gray50")))))


(provide 'theme)
