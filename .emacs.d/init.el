;;; package -- Summary:
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;; Commentary:
;;; author: frol
;;; github: https://github.com/frolmr

;;; Editor configs:
(fset 'yse-or-no-p 'y-or-n-p)

(defvar save-place-file)
(setq save-place-file (concat user-emacs-directory "saveplace.el"))
(setq-default save-place t)

(load-theme 'gruvbox t)
(set-frame-font "Source Code Pro for Powerline-13")
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(indent-guide-global-mode)

(require 'pallet)
(pallet-mode t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(show-paren-mode t)

(defvar linum-relative-current-symbol)
(linum-relative-global-mode 1)
(setq linum-relative-current-symbol "->")

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(setq inhibit-startup-message t)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(defvar bm-highlight-style)
(defvar bm-cycle-all-buffers)
(setq bm-highlight-style 'bm-highlight-only-fringe)
(setq bm-cycle-all-buffers t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq flycheck-elixir-credo-strict t)

;;; Mode configs:
(ac-config-default)

(require 'smartparens-config)
(smartparens-global-mode)

(require 'spaceline-config)
(spaceline-all-the-icons-theme)

(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-mode t)

(defvar ido-enable-flex-matching)
(defvar ido-everywhere)
(defvar ido-use-faces)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(flx-ido-mode 1)
(setq ido-use-faces nil)

(defvar projectile-completion-system)
(projectile-mode)
(defvar ivy-re-builders-alist)
(defvar ivy-initial-inputs-alist)
(ivy-mode)
(setq projectile-completion-system 'ivy)
(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))
(setq ivy-initial-inputs-alist nil)

(global-hl-line-mode)
(global-font-lock-mode 1)
(global-flycheck-mode)
(dimmer-mode)
(dumb-jump-mode)

;; (evilnc-default-hotkeys)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((projects . 5)
                        (recents  . 10)
                        (bookmarks . 5)
                        (agenda . 5)
                        (registers . 5)))

(defvar rspec-use-rvm)
(setq rspec-use-rvm t)

(defvar enh-ruby-add-encoding-comment-on-save)
(setq enh-ruby-add-encoding-comment-on-save nil)

;;; Keybindings:
(global-set-key (kbd "C-c i") 'find-user-init-file)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-c c") 'projectile-rails-console)

(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
(global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
(global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
(global-set-key (kbd "C-x 0") 'switch-window-then-delete)
(global-set-key (kbd "C-x 4 d") 'switch-window-then-dired)
(global-set-key (kbd "C-x 4 f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 m") 'switch-window-then-compose-mail)
(global-set-key (kbd "C-x 4 r") 'switch-window-then-find-file-read-only)
(global-set-key (kbd "C-x 4 C-f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 C-o") 'switch-window-then-display-buffer)
(global-set-key (kbd "C-x 4 0") 'switch-window-then-kill-buffer)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(evil-define-key 'normal prog-mode-map (kbd "m m") 'bm-toggle)
(evil-define-key 'normal prog-mode-map (kbd "m n") 'bm-next)
(evil-define-key 'normal prog-mode-map (kbd "m p") 'bm-previous)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'evil-leader)
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "k" 'kill-buffer)

(eval-after-load 'flycheck
  '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)

;;; Hooks:
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'idle-highlight-mode)
(add-hook 'prog-mode-hook #'whitespace-cleanup-mode)
(add-hook 'prog-mode-hook #'diff-hl-mode)
(add-hook 'prog-mode-hook #'counsel-projectile-mode)
(add-hook 'prog-mode-hook #'font-lock-comment-annotations)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)
(add-hook 'enh-ruby-mode-hook 'rvm-activate-corresponding-ruby)
(add-hook 'enh-ruby-mode-hook 'auto-complete-mode)
(add-hook 'enh-ruby-mode-hook 'projectile-rails-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(add-hook 'robe-mode-hook 'ac-robe-setup)

(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))

;;; Code:
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.

This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|NOTE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun run-server ()
  "Run the Emacs server if it is not running."
  (require 'server)
  (unless (server-running-p)
    (server-start)))

(run-server)

(defun copy-shell-environment-variables ()
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(copy-shell-environment-variables)

(setenv "VISUAL" "emacsclient")
(setenv "EDITOR" (getenv "VISUAL"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dired-sidebar projectile use-package smex smartparens magit linum-relative idle-highlight-mode gruvbox-theme flycheck-cask flx-ido expand-region exec-path-from-shell evil auto-complete ace-jump-mode)))
 '(zoom-mode t nil (zoom))
 '(zoom-size (quote (0.618 . 0.618))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init)
;;; init.el ends here
