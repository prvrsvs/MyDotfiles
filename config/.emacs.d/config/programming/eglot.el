(use-package cape
  :ensure t
  :init
  ;; Añadir fuentes de autocompletado estándar
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

(setopt tab-always-indent 'complete)

;; eglot
(require 'eglot)

(add-to-list 'eglot-server-programs
             '(csharp-mode . ("roslyn-language-server" "--stdio")))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-ignored-server-capabilities :documentOnTypeFormattingProvider))

(setq eglot-send-changes-idle-time 1.0)
(setq flymake-no-changes-timeout 1.0)
(setq eglot-ignored-server-capabilities
      '(:hoverProvider
        :signatureHelpProvider
        :documentHighlightProvider
        :inlayHintProvider))
(add-hook 'csharp-mode-hook #'eglot-ensure)

(provide 'eglot)
