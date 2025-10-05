
;; Treemacs: explorador de archivos
(use-package treemacs
  :ensure t
  :bind
  (("C-x t t" . treemacs)) ; atajo para abrir/cerrar
  :config
  (setq treemacs-is-never-other-window t))

