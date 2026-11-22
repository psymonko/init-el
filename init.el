(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)

(defun my-c-mode-style-hook ()
  (c-set-style "stroustrup")
  (setq c-basic-offset 2))

(set-face-attribute 'default nil :font "Cascadia Code" :height 100)
(load-theme 'tango-dark)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((projects . 10)
			  (recents . 5))))
  
(column-number-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq compilation-scroll-output t)

(fido-vertical-mode 1)

(org-babel-do-load-languages
 'org-bable-load-languages
 '((C . t)))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package dape)
(use-package corfu
  :ensure t)

(setopt eglot-ignored-server-capabilities (list :documentOnTypeFormattingProvider))
(setq-default eglot-workspace-configuration
	      '((:gopls .
			((staticcheck . t)
			 (matcher . "CaseSensitive")))))

(add-hook 'c-mode-common-hook #'my-c-mode-style-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


