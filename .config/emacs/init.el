;; [ EMACS CONFIGURATION ]
;; (menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

;; Fonts
(set-face-attribute 'default nil
                    :font "JetBrains Mono"
                    :height 110
                    :weight 'medium)
(set-face-attribute 'variable-pitch nil
                    :font "JetBrains Mono"
                    :height 110
                    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
                    :font "JetBrains Mono"
                    :height 110
                    :weight 'medium)

;; [ STRAIGHT ]
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; [ EVIL ]
(straight-use-package 'evil)
(require 'evil)
(evil-mode 1)

;; [ ORG-TEMPO ]
(require 'org-tempo)

;; [ ORG-ROAM ]
(straight-use-package 'org-roam)

;; [ TOC-ORG ]
(straight-use-package 'toc-org)
(require 'toc-org)
(add-hook 'org-mode-hook 'toc-org-enable)

;; [ ORG-BULLETS ]
(straight-use-package 'org-bullets)
(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)

;; [ GENERAL ]
(straight-use-package 'general)
(require 'general)
(general-evil-setup)
(general-create-definer rf-leader
                        :state '(normal visual emacs)
                        :keymaps 'override
                        :prefix "SPC"
                        :global-prefix "M-SPC")

;; Keybinding
(rf-leader
  "/" '(find-file :wk "Find file")
  "g c" '(comment-line :wk "Comment line")
  ;; Buffer keybinding
  "b" '(:ignore t :wk "Buffer")
  "b b" '(switch-to-buffer :wk "Find existing buffer")
  "b i" '(ibuffer :wk "Ibuffer")
  "b c" '(kill-this-buffer :wk "Close this buffer")
  "b n" '(next-buffer :wk "Next buffer")
  "b p" '(previous-buffer :wk "Previous buffer")
  "b r" '(revert-buffer :wk "Reload buffer"))

;; [ WHICH-KEY ]
(straight-use-package 'which-key)
(require 'which-key)
(which-key-mode 1)
(setq which-key-side-window-location 'bottom
      which-key-sort-order #'which-key-key-order-alpha
      which-key-sort-uppercase-first nil
      which-key-add-column-padding 1
      which-key-max-display-columns nil
      which-key-min-display-lines 6
      which-key-side-window-slot -10
      which-key-side-window-max-height 0.25
      which-key-idle-delay 0.8
      which-key-max-description-length 25
      which-key-allow-imprecise-window-fit t
      which-key-separator " → " )

