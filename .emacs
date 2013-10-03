(setq case-fold-search t)
(c-set-offset 'arglist-intro '+)
(c-set-offset 'arglist-close '0)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(global-set-key (kbd "C-x C-_") 'evil-mode)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; Ensure packages
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(better-defaults evil paredit nrepl)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
