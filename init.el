(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode 0)
(set-frame-parameter nil 'alpha 90)
(setq ring-bell-function 'ignore)

(set-face-attribute 'default nil :family "Consolas" :height 104)

(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

(setq-default show-trailing-whitespace t)

(show-paren-mode 1)
;;(global-whitespace-mode 1)
(electric-pair-mode 1)
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
(package-install-with-refresh 'rainbow-mode) ;; cssのカラーコードなどに色を付ける
(package-install-with-refresh 'web-mode)
(package-install-with-refresh 'emmet-mode)
(package-install-with-refresh 'sublime-themes)
(package-install-with-refresh 'powerline)

(setq evil-want-C-u-scroll t)

;; evil
(setq evil-shift-width 2)

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

(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'powerline)
(powerline-default-theme)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'granger t)

(eyebrowse-mode t)

(setq linum-format " %d")

;; file
(setq-default tab-width 2 indent-tabs-mode nil)

;; js
(setq js-indent-level 2)

;; css
(defun brace-ret-brace ()
  (interactive)
  (insert "{") (newline-and-indent)
  (newline-and-indent)
  (insert "}") (indent-for-tab-command)
  (newline-and-indent) (newline-and-indent)
  (previous-line) (previous-line) (previous-line)
  (indent-for-tab-command)
  )
(add-hook 'css-mode-hook
          (lambda ()
            (setq css-indent-offset 2)
            (rainbow-mode)
            ))


(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-code-indent-offset 2)
            (setq web-mode-css-indent-offset 2)
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-style-padding 0)
            (setq web-mode-script-padding 0)
            (setq web-mode-tag-auto-close-style 2)))
