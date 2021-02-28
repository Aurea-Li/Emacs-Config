 ;; Installing MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Org Mode
(require 'org)
;; Make Org mode work with files ending in .org.
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen.
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
;; Hide structural markup elements in org-mode.
(setq org-hide-emphasis-markers t)
;; Set global bindings.
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
;; Set agenda files to be all .org files under directory
;; ~/Notes/Org-Mode recursively.
(setq org-agenda-files (directory-files-recursively "~/Notes/" "\.org$"))
;; Set agenda to be 12 hours instead of 24.
(setq org-agenda-timegrid-use-ampm 1)
;; Export whitespaces in org files.
(setq org-export-preserve-breaks "t")
;; Allow tab to work in embedded code blocks.
(setq org-src-tab-acts-natively t)
;; Allow images to be resized.
(setq org-image-actual-width nil)
;; Turn on visual-line-mode and adaptive-mode on for org-files
;; by default.
(visual-line-mode t)
(adaptive-wrap-prefix-mode t)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'adaptive-wrap-prefix-mode)

;; Org Capture Templates
(setq org-capture-templates '(
    ("b" "Book Entry" entry (file+olp+datetree 
			     "~/Notes/Media.org"
			     "Books" "Read") 
     "* %^{Title} by %^{Author} %^g \n  %?")
    ("l" "Life TODO" entry (file+olp
				"~/Notes/Life.org"
				"Todos")
     "* TODO %^{Title}")
    ("t" "Work TODO" entry (file+olp
				"~/Notes/Work.org"
				"General" "Todos")
    "* TODO %^{Title}")
))

;; Automatically load tangotango theme on startup.
(load-theme 'doom-one-light t)

;; Helm Config
;; Taken from https://tuhdo.github.io/helm-intro.html.
(require 'helm)
(require 'helm-config)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(helm-mode 1)

;; Overwrite highlighted region
(delete-selection-mode 1)
;; Custom Set
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "77113617a0642d74767295c4408e17da3bfd9aa80aaa2b4eeb34680f6172d71a" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" default))
 '(package-selected-packages '(org-gcal doom-themes adaptive-wrap)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "#fafafa" :foreground "#f0f0f0")))))
