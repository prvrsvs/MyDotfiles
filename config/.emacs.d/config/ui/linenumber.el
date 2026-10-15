;; Mostrar números de línea
(global-display-line-numbers-mode 1)

;; No mostrar números en buffers que no los necesitan
(dolist (mode '(term-mode-hook
                eshell-mode-hook
                shell-mode-hook
                vterm-mode-hook
                treemacs-mode-hook))
  (add-hook mode
            (lambda ()
              (display-line-numbers-mode -1))))

(provide 'linenumber)
