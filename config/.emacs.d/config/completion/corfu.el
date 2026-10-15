;;-------------------- Corfu --------------------
;; 1. Motor de filtrado (imprescindible para Eglot + Corfu)
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; 2. Configuración de Corfu
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)                 ; Mostrar sugerencias automáticamente
  (corfu-auto-delay 0.1)         ; Retraso mínimo al escribir
  (corfu-auto-prefix 1)          ; Mostrar sugerencias desde la 1ª letra
  (corfu-cycle t)                ; Permitir navegar cíclicamente con Tab/Arrow
  :config
  (global-corfu-mode))           ; Carga el modo global una vez instanciado corfu

;; corfu para terminal
(use-package corfu-terminal
  :ensure t
  :config
  (corfu-terminal-mode +1))

(provide 'corfu)
