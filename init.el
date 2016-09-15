(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode 0)
(set-frame-parameter nil 'alpha 90)
(setq ring-bell-function 'ignore)

(set-face-attribute 'default nil :family "Consolas for Powerline FixedD" :height 104)

(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

(show-paren-mode 1)
;;(global-whitespace-mode 1)
(setq scroll-conservatively 1) ;; スクロールを1行ずつに

(setq make-backup-files nil)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(defun package-install-with-refresh (package)
  (unless (assq package package-alist)
    (package-refresh-contents))
  (unless (package-installed-p package)
    (package-install package)))

(package-install-with-refresh 'evil)
(package-install-with-refresh 'evil-leader)
(package-install-with-refresh 'helm)
(package-install-with-refresh 'helm-ls-git)
(package-install-with-refresh 'nyan-mode)
(package-install-with-refresh 'color-theme-modern)
(package-install-with-refresh '2048-game)
(package-install-with-refresh 'eyebrowse)

(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(global-evil-leader-mode)

(require 'linum)
(global-linum-mode t)

(require 'helm)
(define-key global-map (kbd "M-x") 'helm-M-x)
(evil-leader/set-key "g" 'helm-grep-do-git-grep)

(require 'helm-ls-git)
(evil-leader/set-key "p" 'helm-ls-git-ls)

(require 'nyan-mode)
(nyan-mode 1)
(nyan-start-animation)

(load-theme 'cobalt t t)
(enable-theme 'cobalt)

(eyebrowse-mode t)

;; file
(setq-default tab-width 2 indent-tabs-mode nil)

;; js
(setq js-indent-level 2)

