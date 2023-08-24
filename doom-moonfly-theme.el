;;; moonfly.el --- inspired by Atom One Dark -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Copyright (C) Firas al-Khalil
;;
;; Author: Firas al-Khalil
;; Created: April 18, 2022
;; Version: 1.0.0
;; Keywords: custom themes, faces
;; Homepage:
;; Package-Requires: ((emacs "25.1") (cl-lib "0.5") (doom-themes "2.2.1"))
;;
;;; Commentary:
;;
;; A copycat of vim-moonfly theme.
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-moonfly-theme nil
  "Options for the `moonfly' theme."
  :group 'doom-themes)

(defcustom doom-moonfly-theme-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-moonfly-theme
  :type 'boolean)

(defcustom doom-moonfly-theme-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-moonfly-theme
  :type 'boolean)

(defcustom doom-moonfly-theme-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-moonfly-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-moonfly
  "A dark theme inspired by vim-moonfly."

  ;; name        default   256           16
  ((bg         '("#080808" "black"       "black"  ))
   (fg         '("#dcdcdc" "#dcdcdc"     "brightwhite"  ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#080808" "black"       "black"        ))
   (fg-alt     '("#dcdcdc" "#dcdcdc"     "white"        ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#080808" "black"       "black"        ))
   (base1      '("#242424" "#242424"     "brightblack"  ))
   (base2      '("#414141" "#414141"     "brightblack"  ))
   (base3      '("#5d5d5d" "#5d5d5d"     "brightblack"  ))
   (base4      '("#6b6b6b" "#6b6b6b"     "brightblack"  ))
   (base5      '("#797979" "#797979"     "brightblack"  ))
   (base6      '("#878787" "#878787"     "brightblack"  ))
   (base7      '("#969696" "#969696"     "brightblack"  ))
   (base8      '("#dcdcdc" "#dcdcdc"     "white"        ))

   (blue          '("#80a0ff" "#80a0ff" "blue"         ))
   (bright-blue   '("#74b2ff" "#74b2ff" "brightblue"   ))
   (bright-cyan   '("#85dc85" "#85dc85" "brightcyan"   ))
   (bright-green  '("#36c692" "#36c692" "brightgreen"  ))
   (bright-purple '("#ae81ff" "#ae81ff" "brightmagenta"))
   (bright-red    '("#ff5189" "#ff5189" "brightred"    ))
   (bright-orange '("#f09479" "#f09479" "brightorange" ))
   (bright-yellow '("#c2c292" "#c2c292" "brightyellow" ))
   (cursor        '("#9e9e9e" "#9e9e9e" "grey"         ))
   (cursor-text   '("#080808" "#080808" "black"        ))
   (cyan          '("#79dac8" "#79dac8" "cyan"         ))
   (dark-blue     '("#80a0ff" "#80a0ff" "blue"         ))
   (dark-cyan     '("#79dac8" "#79dac8" "cyan"         ))
   (green         '("#8cc85f" "#8cc85f" "green"        ))
   (grey          base4                                 )
   (magenta       '("#d183e8" "#d183e8" "magenta"      ))
   (orange        '("#ff7051" "#ff7051" "orange"       ))
   (purple        '("#d183e8" "#d183e8" "magenta"      ))
   (red           '("#ff5454" "#ff5454" "red"          ))
   (selection     '("#b2ceee" "#b2ceee" "blue"         ))
   (teal          '("#85dc85" "#85dc85" "brightcyan"   ))
   (violet        '("#ae81ff" "#ae81ff" "brightmagenta"))
   (yellow        '("#e3c78a" "#e3c78a" "yellow"       ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      cursor)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      cursor)
   (builtin        purple)
   (comments       (if doom-moonfly-theme-brighter-comments cyan base5))
   (doc-comments   (doom-lighten (if doom-moonfly-theme-brighter-comments cyan base5) 0.25))
   (constants      bright-purple)
   (functions      bright-blue)
   (keywords       purple)
   (methods        bright-blue)
   (operators      bright-blue)
   (type           bright-green)
   (strings        bright-yellow)
   (variables      cyan)
   (numbers        yellow)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          bright-red)
   (warning        yellow)
   (success        green)
   (vc-modified    bright-orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (if doom-moonfly-theme-brighter-modeline
                                 (doom-darken bright-blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-moonfly-theme-brighter-modeline
                                 (doom-darken bright-blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-moonfly-theme-padded-modeline
      (if (integerp doom-moonfly-theme-padded-modeline) doom-moonfly-theme-padded-modeline 4))))

  ;;;; Base theme face overrides
  (((line-number &override) :foreground base2)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-moonfly-theme-brighter-comments (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-moonfly-theme-brighter-modeline base8 highlight))

   ;;;; company
   (company-tooltip :foreground fg :background bg)
   (company-tooltip-scrollbar-thumb :background base5)
   (company-tooltip-scrollbar-track :background base1)
   (company-tooltip-search-selection :background purple :foreground fg)
   (company-tooltip-selection :background bright-blue :foreground bg)
   ;;;; highlight
   (cursor                           :background blue :foreground bg)
   (evil-ex-lazy-highlight           :foreground bg :background bright-orange)
   (evil-snipe-first-match-face      :foreground bg :background bright-orange)
   (evil-snipe-matches-face          :foreground bg :background bright-blue  )
   (lazy-highlight                   :foreground bg :background bright-orange)
   (lsp-face-highlight-read          :foreground bg :background bright-orange)
   (lsp-face-highlight-textual       :foreground bg :background bright-orange)
   (lsp-face-highlight-write         :foreground bg :background bright-orange)
   (lsp-ui-peek-highlight            :foreground bg :background bright-orange)
   (markdown-highlight-face          :background purple :foreground bg)
   (flycheck-error-list-highligh     :backgground bright-red :foreground bg)
   (highlight-thing                  :foreground bg :background bright-orange)
   (company-tootlip-search           :foreground bg :background bright-orange)
   (company-tootlip-search-selection :foreground bg :background bright-orange)
   (nav-flash-face                   :background bright-blue :foreground bg)
   (solaire-hl-line-face             :backgroud bright-blue  :foreground bg)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground bright-yellow)
   (css-property             :foreground bright-green)
   (css-selector             :foreground bright-blue)
   ;;;; doom-modeline
   (doom-modeline-bar                 :background (if doom-moonfly-theme-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file         :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path         :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground bright-blue :weight 'bold)
   (doom-modeline-project-dir         :foreground bright-blue :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   ((markdown-code-face &override) :background bg)
   (markdown-bold-face :forground purple :weight 'bold)
   (markdown-header-face :inherit 'bold :foreground bright-blue)
   (markdown-highlight-face :foreground fg :background purple)
   (markdown-list-face :foreground bright-orange)
   (markdown-markup-face :foreground base5)
   ;;;; rjsx-mode
   (rjsx-tag :foreground bright-red)
   (rjsx-attr :foreground bright-orange)
   ;; (tree-sitter-hl-face:punctuation.bracket :foreground comments)
   ;; (tree-sitter-hl-face:attribute :foreground blue)
   ;; (tree-sitter-hl-face:function\.call :foreground white)

   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt)))
   (hl-line :background base1)
   (solaire-hl-line-face :inherit 'hl-line :background base4)
   ;;;; org <built-in>
   ((org-block &override) :background bg)
   ((org-block-background &override) :background bg)
   ((org-block-begin-line &override) :background bg)
   ;;;; org-pomodoro
   (org-pomodoro-mode-line :inherit 'mode-line-emphasis) ; unreadable otherwise
   (org-pomodoro-mode-line-break :inherit 'org-pomodoro-mode-line)
   (org-pomodoro-mode-line-overtime :inherit 'org-pomodoro-mode-line)
   ;;;; Rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground bright-purple)
   (rainbow-delimiters-depth-2-face :foreground bright-orange)
   (rainbow-delimiters-depth-3-face :foreground green)
   (rainbow-delimiters-depth-4-face :foreground purple)
   (rainbow-delimiters-depth-5-face :foreground bright-cyan)
   (rainbow-delimiters-depth-6-face :foreground yellow)
   (rainbow-delimiters-depth-7-face :foreground bright-blue)
   (rainbow-delimiters-depth-8-face :foreground bright-green)
   (rainbow-delimiters-depth-9-face :foreground cyan)
   ;;;; treemacs
   (treemacs-directory-face     :foreground base8)
   (treemacs-file-face          :foreground fg)
   (treemacs-git-added-face     :foreground bright-green)
   (treemacs-git-modified-face  :foreground bright-orange)
   (treemacs-git-untracked-face :foreground bright-purple)
   (treemacs-root-face          :foreground bright-blue :weight 'bold)
   ;;;; magit
   (diff-refine-added   :background bright-green :foreground bg)
   (diff-refine-removed :background bright-red :foreground bg)
   (magit-bisect-bad :background bg :foreground bright-red)
   (magit-bisect-good :background bg :foreground bright-green)
   (magit-bisect-skip :background bg :foreground fg)
   (magit-blame-culprit :background base1 :foreground bright-red :weight 'bold)
   (magit-blame-date    :background base1 :foreground purple :weight 'bold)
   (magit-blame-hash    :background base1 :foreground bright-yellow :weight 'bold)
   (magit-blame-header  :background base1 :foreground fg :weight 'bold)
   (magit-blame-heading :background base1 :foreground fg :weight 'bold)
   (magit-blame-name    :background base1 :foreground green :weight 'bold)
   (magit-blame-sha1    :background base1 :foreground bright-yellow :weight 'bold)
   (magit-blame-subject :background base1 :foreground bright-blue :weight 'bold)
   (magit-blame-summary :background base1 :foreground bright-blue :weight 'bold)
   (magit-blame-time    :background base1 :foreground purple :weight 'bold)
   (magit-branch-current :background bg :foreground bright-blue :box 't)
   (magit-branch-local :background bg :foreground bright-purple)
   (magit-diff-added             :background bg :foreground bright-green)
   (magit-diff-added-highlight   :background bg :foreground bright-green)
   (magit-diff-base              :foreground fg :weight 'light)
   (magit-diff-base-highlight    :foreground fg :weight 'bold)
   (magit-diff-conflict-heading  :foreground fg)
   (magit-diff-context           :foreground fg :weight 'light)
   (magit-diff-context-highlight :foreground fg :weight 'bold)
   (magit-diff-file-header       :foreground yellow)
   (magit-diff-file-heading      :foreground bright-blue :weight 'light)
   (magit-diff-file-heading-highlight :foreground bright-blue :weight 'bold)
   (magit-diff-file-heading-selection :foreground bright-blue :weight 'bold :background bg)
   (magit-diff-hunk-heading           :foreground yellow :weight 'light)
   (magit-diff-hunk-heading-highlight :foreground yellow :weight 'bold)
   (magit-diff-hunk-heading-selection :foreground yellow :background bg :weight 'bold)
   (magit-diff-lines-boundary         :background fg :foreground base2)
   (magit-diff-lines-heading          :background fg :foreground base2)
   (magit-diff-our                :background bg :foreground bright-blue)
   (magit-diff-our-highlight                :background bg :foreground bright-blue)
   (magit-diff-removed                :background bg :foreground bright-red)
   (magit-diff-removed-highlight      :background bg :foreground bright-red)
   (magit-diff-their                :background bg :foreground bright-cyan)
   (magit-diff-their-highlight                :background bg :foreground bright-cyan)
   (magit-diff-whitespace-warning    :background red :foreground bg)
   (magit-diffstat-added                :background bg :foreground bright-green)
   (magit-diffstat-removed                :background bg :foreground bright-red)
   (magit-filename :background bg :foreground bright-orange)
   (magit-hash :foreground bright-yellow)
   (magit-head :background bg :foreground bright-purple :box 't)
   (magit-header-line :background bright-purple :foreground bg :weight 'bold)
   (magit-log-author            :foreground green :weight 'bold)
   (magit-log-date              :foreground purple)
   (magit-log-graph             :foreground fg)
   (magit-log-head-label-head   :background bright-blue :foreground bg :weight 'bold)
   (magit-log-head-label-local  :background bright-purple :foreground bg :weight 'bold)
   (magit-log-head-label-remote :background bright-cyan :foreground bg :weight 'bold)
   (magit-log-head-label-tags   :background bright-orange :foreground bg :weight 'bold)
   (magit-log-head-label-wip    :background yellow :foreground bg :weight 'bold)
   (magit-log-sha1              :foreground bright-yellow)
   (magit-process-ng            :foreground bright-orange :weight 'bold)
   (magit-process-ok            :foreground bright-cyan :weight 'bold)
   (magit-section-heading           :foreground bright-purple)
   (magit-section-heading-selection :foreground bright-blue :weight 'bold)
   (magit-section-highlight         :weight 'bold)
   (magit-section-title             :background bg :foreground bright-purple :weight 'bold)
   (magit-tag :background bg :foreground bright-cyan :box 't)
   ;;;; display-fill-column-indicator-mode
   (fill-column-indicator :height 1 :background vertical-bar :foreground vertical-bar ))
  ;;;; Base theme variable overrides-
  ())

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (let ((base (file-name-directory load-file-name)))
    (add-to-list 'custom-theme-load-path base)))

(provide 'doom-moonfly-theme)
;;; moonfly.el ends here
