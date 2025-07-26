;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 16 :weight 'normal))
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 21))
(setq doom-theme 'doom-one)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(after! evil
  ;; gh = beginning of line (like Vim’s 0)
  ;; gl = end   of line (like Vim’s $)
  (map! :nvo "gh" #'evil-beginning-of-line
        :nvo "gl" #'evil-end-of-line))

(map! :leader
      :desc "List Flycheck errors" "e" #'flycheck-list-errors)

;; make sure rg / counsel / consult is loaded before we bind it:
(after! rg
  (map! :leader
        :prefix "s"    ; under SPC s ...
        "r" #'rg       ; SPC s r → ripgrep
        ;; override the old m (jump to bookmark)
        "m" #'evil-jump-to-mark
        ;; if you really want to nil it first, you can do:
        ;; "m" nil
        ;; and then re-bind:
        ;; "m" #'evil-jump-to-mark
        ))

(require 'ejc-sql)

;; accept completion from copilot and fallback to company
;;(use-package! copilot
;;  :hook (prog-mode . copilot-mode)
;;  :bind (:map copilot-completion-map
;;              ("<tab>" . 'copilot-accept-completion)
;;              ("TAB" . 'copilot-accept-completion)
;;              ("C-TAB" . 'copilot-accept-completion-by-word)
;;              ("C-<tab>" . 'copilot-accept-completion-by-word)))

;; Define your custom formatter

;;(defun my/google-java-format ()
;;  "Format Java buffer using custom google-java-format command."
;;  (when (eq major-mode 'java-mode)
;;    (let ((file (buffer-file-name)))
;;      (when file
;;        (shell-command
;;         (format "/usr/bin/google-java-format_linux-x86-64 --skip-reflowing-long-strings --skip-javadoc-formatting --replace %s"
;;                 (shell-quote-argument file)))))))


;; Set up format-on-save for Java
;;(add-hook 'java-mode-hook
;;          (lambda ()
;;            (add-hook 'before-save-hook #'my/google-java-format nil t)))


;; Java Debug with Component Selection
(after! dap-mode
  ;; Variable to store last used component
  (defvar my-java-last-component nil
    "Last used component ID for Java debugging")

  ;; Your component list - customize this for your project
  (defvar my-java-components
    '("auth-service"
      "user-service"
      "notification-service"
      "data-processor"
      "web-api"
      "batch-processor")
    "Available component IDs for Java debugging")

  ;; Main function for component selection
  (defun my/java-debug-with-components ()
    "Debug Java with component ID selection (remembers last choice)"
    (interactive)
    (let* ((default (or my-java-last-component (car my-java-components)))
           (selected-component (completing-read
                               (format "Select component (default %s): " default)
                               my-java-components nil t nil nil default))
           (additional-args (read-string "Additional args (optional): " "")))
      ;; Save selection for next time
      (setq my-java-last-component selected-component)

      ;; Launch debugger
      (dap-debug
       (list :type "java"
             :request "launch"
             :args (if (string-empty-p additional-args)
                       (vector (concat "--component-id=" selected-component))
                     (vector (concat "--component-id=" selected-component) additional-args))
             :name (concat "Java Debug - " selected-component)
             :projectName (projectile-project-name)))))

  ;; Quick launch function for last used component
  (defun my/java-debug-last-component ()
    "Debug Java with last used component (no prompts)"
    (interactive)
    (if my-java-last-component
        (dap-debug
         (list :type "java"
               :request "launch"
               :args (vector (concat "--component-id=" my-java-last-component))
               :name (concat "Java Debug - " my-java-last-component)
               :projectName (projectile-project-name)))
      (message "No previous component found, use my/java-debug-with-components first")
      (my/java-debug-with-components)))

  ;; Key bindings
  (map! :leader
        :prefix ("d" . "debug")
        :desc "Java debug with components" "j" #'my/java-debug-with-components
        :desc "Java debug last component" "J" #'my/java-debug-last-component))

;; (setq catppuccin-flavor 'frappe) ; or 'latte, 'macchiato, or 'mocha
;;    (load-theme 'catppuccin t)
;;(load-theme 'kanagawa-wave t)
;;(load-theme 'doom-gruvbox t)
'(lsp-java-jdt-download-url
   "https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.37.0/jdt-language-server-1.37.0-202406271335.tar.gz")
;;; config.el ends here
