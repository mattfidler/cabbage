;; Configuration

;;;; -------------------------------------
;;;; Bundle
(cabbage-load-bundle-dependencies "ergonomic" '("enlarge"))
(cabbage-vendor 'ergoemacs-mode)

(require 'ergoemacs-mode)
(defun move-cursor-next-pane ()
  "Move cursor to the next pane."
  (interactive)
  (other-window 1))

(defun move-cursor-previous-pane ()
  "Move cursor to the previous pane."
  (interactive)
  (other-window -1))

(ergoemacs-theme-component cabbage-alt-ctl ()
  "Meta+Ctl+ movement commands"
  (global-set-key (kbd "M-C-i") 'scroll-down)
  (global-set-key (kbd "M-C-k") 'scroll-up)
  (global-set-key (kbd "M-C-l") 'end-of-line)
  (global-set-key (kbd "M-C-j") 'beginning-of-line))

(ergoemacs-theme-component cabbage-move-paragraph ()
  "Move paragraph"
  (global-set-key (kbd "M-U") 'backward-paragraph)
  (global-set-key (kbd "M-O") 'forward-paragraph)
  (global-set-key (kbd "M-C-o") 'forward-paragraph)
  (global-set-key (kbd "M-C-u") 'backward-paragraph))

(ergoemacs-theme-component cabbage-pop-mark ()
  "Pop mark"
  (global-set-key (kbd "M-b") 'pop-to-mark-command))

(ergoemacs-theme-component cabbage-kill-word-shifted
    "Shifted Kill Word"
    (global-set-key (kbd "M-D") 'backward-kill-word)
    (global-set-key (kbd "M-F") 'kill-word))

(ergoemacs-theme-component cabbage-beginning-end-of-buffer ()
  "Beginning/End of buffer"
  (global-set-key (kbd "M-h") 'beginning-of-buffer)
  (global-set-key (kbd "M-H") 'end-of-buffer))

(ergoemacs-theme-component cabbage-switch ()
  "Switching windows"
  (global-set-key (kbd "M-1") 'cabbage-enlargement-enlarge)
  (global-set-key (kbd "M-C-1") 'cabbage-enlargement-restore)
  (global-set-key (kbd "M-0") 'delete-window)
  (global-set-key (kbd "M-2") 'split-window-vertically)
  (global-set-key (kbd "M-3") 'split-window-horizontally)
  (global-set-key (kbd "M-4") 'balance-windows)
  (global-set-key (kbd "M-5") 'delete-other-windows)
  (global-set-key (kbd "M-+") 'balance-windows))

(ergoemacs-theme-component cabbage-exec ()
  "Cabbage execute"
  (global-unset-key (kbd "M-x")) ; execute-extended-command
  (global-set-key (kbd "M-a") 'execute-extended-command)
  (global-set-key (kbd "M-q") 'shell-command)
  (global-set-key (kbd "M-e") 'cabbage-testing-execute-test))

(ergoemacs-theme-component cabbage-windmove ()
  "Move Windows Cabbage Keys"
  (global-unset-key (kbd "C-d"))
  (global-unset-key (kbd "C-w"))
  (global-unset-key (kbd "C-s"))
  (global-unset-key (kbd "C-a"))
  (global-set-key (kbd "C-d") 'windmove-right)
  (global-set-key (kbd "C-s") 'windmove-down)
  (global-set-key (kbd "C-a") 'windmove-left)
  (global-set-key (kbd "C-w") 'windmove-up)
  (global-set-key (kbd "M-s") 'move-cursor-next-pane)
  (global-set-key (kbd "M-S") 'move-cursor-previous-pane))

(ergoemacs-theme-component cabbage-rectangle ()
  "Rectangles..."
  (global-set-key (kbd "C-r d") 'kill-rectangle))

(ergoemacs-theme-component cabbage-fixed-keys ()
  "Fixed cabbage keys"
  (global-set-key (kbd "C-S-n") 'write-file)
  (global-set-key (kbd "C-S-a") 'mark-whole-buffer)
  (global-set-key (kbd "C-c e") 'eval-and-replace)
  (global-set-key (kbd "C-x C-m") 'execute-extended-command)
  (global-set-key (kbd "C-c C-m") 'execute-extended-command)
  (global-set-key (kbd "M-r") 'replace-string)
  (global-set-key [C-return] 'cabbage-duplicate-line)
  (global-set-key (kbd "C-$") 'cabbage-kill-buffer)
  (global-set-key (kbd "C-c i") 'indent-buffer)
  (global-set-key (kbd "C-c n") 'cabbage-cleanup-buffer)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  ;; Use remaps instead so that Alt+Enter will open directories under `ido-mode'
  (global-set-key [remap electric-newline-and-maybe-indent] 'cabbage-next-line)
  (global-set-key [remap newline-and-indent] 'cabbage-next-line)

  (global-set-key (kbd "C-c C-k") 'cabbage-comment-or-uncomment-region-or-line)
  (global-set-key (kbd "C-c k") 'kill-compilation)
  (global-set-key (kbd "C-c w") 'remove-trailing-whitespace-mode)
  (global-set-key (kbd "C-*") 'isearch-forward-at-point)
  (global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
  (global-set-key (kbd "C-c r") 'revert-buffer)
  ;; Note these keys do not require cabbage bundles to be active, just
  ;; functions to be defined.
  (global-set-key (kbd "C-x g") 'magit-status)
  ;; Global bindings for cabbage bundles

  ;; rect-mark bundle bindings
  (global-set-key (kbd "C-x r M-SPC") 'rm-set-mark)
  (global-set-key (kbd "M-x") 'cabbage-kill-region-or-rm-kill-region-executor)
  (global-set-key (kbd "M-c") 'cabbage-kill-ring-save-or-rm-kill-ring-save-executor)
  (global-set-key (kbd "C-x r M-r") 'cabbage-replace-replace-string)
  (global-set-key (kbd "C-x r s") 'string-rectangle)
  (global-set-key (kbd "C-x r <down-mouse-1>") 'rm-mouse-drag-region)

  ;; irc bundle bindings
  (global-set-key (kbd "C-p i") 'cabbage-erc)

  ;; jabber bundle bindings
  (global-set-key (kbd "C-p j") 'cabbage-jabber)

  ;; plone bundle bindings
  (global-set-key (kbd "C-c f c") 'cabbage-plone-find-changelog-make-entry)
  (global-set-key (kbd "M-T") 'cabbage-plone-find-file-in-package)
  (global-set-key (kbd "C-p b") 'cabbage-plone-ido-find-buildout)
  (global-set-key (kbd "C-c f r") 'cabbage-plone-reload-code)
  (global-set-key (kbd "C-c f f") 'cabbage-plone-run)
  (global-set-key (kbd "C-c f t") 'cabbage-plone-tests)
  (global-set-key (kbd "C-c f p") 'cabbage-plone--pep8-package)
  (global-set-key (kbd "C-c f a") 'cabbage-plone-find-adapter-by-name)
  (global-set-key (kbd "C-c f A") 'cabbage-plone-find-adapter-by-providing-interface)
  (global-set-key (kbd "C-c f u") 'cabbage-plone-find-utility-by-name)
  (global-set-key (kbd "C-c f U") 'cabbage-plone-find-utility-by-providing-interface)

  ;; cabbage-developer bundle bindings
  (global-set-key (kbd "C-c p") 'cabbage-emdeveloper-find-cabbage-config)
  (global-set-key (kbd "C-p e") 'cabbage-emdeveloper-emacs-persp)

  ;; power-edit bundle bindings
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode)
  (global-set-key (kbd "M-<up>") 'move-text-up)
  (global-set-key (kbd "C-M-i") 'move-text-up)
  (global-set-key (kbd "M-<down>") 'move-text-down)
  (global-set-key (kbd "C-M-k") 'move-text-down)
  (global-set-key (kbd "M-<right>")  'textmate-shift-right)
  (global-set-key (kbd "C-M-l")  'textmate-shift-right)
  (global-set-key (kbd "M-<left>") 'textmate-shift-left)
  (global-set-key (kbd "C-M-j") 'textmate-shift-left)

  ;; accessibility bundle bindings
  (global-set-key (kbd "<f5>") 'ns-toggle-fullscreen)
  (global-set-key (kbd "C-+") 'increase-font-size)
  (global-set-key (kbd "C--") 'decrease-font-size)
  (global-set-key (kbd "C-c C-w") 'whitespace-mode)

  ;; project bundle bindings
  (global-set-key (kbd "M-t") 'textmate-goto-file)
  (global-set-key (kbd "M-w") 'textmate-goto-symbol)
  (global-set-key (kbd "C-x p") 'cabbage-project-ido-find-project)
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-x f") 'recentf-ido-find-file)

  ;; org bundle bindings
  (global-set-key (kbd "C-p o") 'cabbage-org-emacs-persp))

(ergoemacs-theme-component cabbage-perspective ()
  "Perspective Bindings"
  (global-set-key (kbd "C-p s") 'persp-switch)
  (global-set-key (kbd "C-p p") 'cabbage-persp-last)
  (global-set-key (kbd "C-p d") 'persp-kill)
  (global-set-key (kbd "C-p x") 'persp-kill)
  (global-set-key (kbd "C-p m") 'cabbage-persp-main))

(ergoemacs-theme cabbage ()
  "`ergoemacs-mode' theme for cabbage."
  :components '(copy
                dired-to-wdired
                execute
                fixed-newline
                help
                kill-line
                misc
                move-bracket
                move-buffer
                move-char
                ;; move-line
                move-page
                cabbage-move-paragraph
                cabbage-pop-mark
                cabbage-kill-word-shifted
                cabbage-beginning-end-of-buffer
                cabbage-switch
                cabbage-exec
                cabbage-rectangle
                cabbage-fixed-keys
                cabbage-perspective
                move-word
                search-reg ;; Regular Expression search
                select-items
                ;; switch
                text-transform
                ergoemacs-remaps
                standard-vars)
  :optional-on '(apps-punctuation
                 apps-apps
                 apps
                 cabbage-alt-ctl
                 backspace-del-seq
                 backspace-is-back
                 fn-keys
                 f2-edit
                 fixed-bold-italic
                 standard-fixed
                 ido-remaps
                 helm-remaps
                 multiple-cursors-remaps
                 quit
                 apps-swap
                 save-options-on-exit)
  :optional-off '(guru no-backspace search
                       ergoemacs-banish-shift)
  :options-menu '(("Menu/Apps Key" (apps apps-apps apps-punctuation))
                  ("Function Keys" (fn-keys f2-edit))
                  ("Remaps" (ido-remaps helm-remaps multiple-cursors-remaps))
                  ("Extreme ErgoEmacs" (guru no-backspace ergoemacs-banish-shift))
                  ("Standard Keys" (standard-fixed fixed-bold-italic quit))
                  ("Keys during Key Sequence" (f2-edit apps-swap backspace-del-seq))))

(setq ergoemacs-theme "cabbage")
(ergoemacs-mode 1)
