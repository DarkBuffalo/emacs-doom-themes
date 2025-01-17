;;; doom-verde-theme.el --- inspired by Atom Spacegrey Dark -*- no-byte-compile: t; -*-
(require 'doom-themes)

(defgroup doom-verde-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-verde-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-verde-theme
  :type 'boolean)

(defcustom doom-verde-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-verde-theme
  :type 'boolean)

(defcustom doom-verde-comment-bg doom-verde-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-verde-theme
  :type 'boolean)

(defcustom doom-verde-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-verde-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-verde
  "A dark theme inspired by Atom Spacegrey Dark"

  ;; name        default   256       16
  ((bg         '("#2b303b" nil       nil            ))
   (bg-alt     '("#232830" nil       nil            ))
   (base0      '("#1B2229" "black"   "black"        ))
   (base1      '("#1c1f24" "#1e1e1e" "brightblack"  ))
   (base2      '("#202328" "#2e2e2e" "brightblack"  ))
   (base3      '("#2F3237" "#2F3237" "brightblack"  ))
   (base4      '("#4f5b66" "#4f5b66" "brightblack"  ))
   (base5      '("#65737E" "#65737E" "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b" "brightblack"  ))
   (base7      '("#9ca0a4" "#979797" "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf" "white"        ))
   (fg         '("#c0c5ce" "#c0c5ce" "brightwhite"  ))
   (fg-alt     '("#c0c5ce" "#c0c5ce" "white"        ))

   (grey       base4)
   (red        '("#BF616A" "#BF616A" "red"          ))
   (orange     '("#F3A738" "#F3A738" "brightred"    ))
   (green      '("#81B145" "#81B145" "green"        ))
   (blue       '("#688CA8" "#688CA8" "brightblue"   ))
   (violet     '("#b48ead" "#b48ead" "brightmagenta"))
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
   (yellow     '("#ECBE7B" "#ECBE7B" "yellow"       ))
   (dark-blue  '("#2A5C85" "#2A5C85" "blue"         ))
   (magenta    '("#c678dd" "#c678dd" "magenta"      ))
   (cyan       '("#46D9FF" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#174B75" "#174B75" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      green)
   (vertical-bar   (doom-darken bg 0.25))
   (selection      base4)
   (builtin        green)
   (comments       (if doom-verde-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-verde-brighter-comments dark-cyan base5) 0.25))
   (constants      green)
   (functions      blue)
   (keywords       violet)
   (methods        blue)
   (operators      fg)
   (type           yellow)
   (strings        green)
   (variables      red)
   (numbers        green)
   (region         selection)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg-alt) "black" "black"))
   (-modeline-bright doom-verde-brighter-modeline)
   (-modeline-pad
    (when doom-verde-padded-modeline
      (if (integerp doom-verde-padded-modeline) doom-verde-padded-modeline 4)))



   ;; --- Modeline config -------------------

   (modeline-fg     nil)
   (modeline-fg-alt (doom-blend violet base4 (if -modeline-bright 0.5 0.2)))

   (modeline-bg
    (if -modeline-bright
        (doom-darken base3 0.05)
      base1))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken base3 0.1)
      base1))
   (modeline-bg-inactive (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-verde-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground green)
   (css-property             :foreground fg)
   (css-selector             :foreground red)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-darken bg 0.1))

   ;; org-mode
   (org-block            :background (doom-darken bg-alt 0.04))
   (org-block-begin-line :foreground base4 :slant 'italic :background (doom-darken bg 0.04))

   ((outline-1 &override) :foreground fg :weight 'ultra-bold)
   ((outline-2 &override) :foreground (doom-blend fg blue 0.35))
   ((outline-3 &override) :foreground (doom-blend fg blue 0.7))
   ((outline-4 &override) :foreground blue)
   ((outline-5 &override) :foreground (doom-blend magenta blue 0.2))
   ((outline-6 &override) :foreground (doom-blend magenta blue 0.4))
   ((outline-7 &override) :foreground (doom-blend magenta blue 0.6))
   ((outline-8 &override) :foreground fg)

   (org-ellipsis         :underline nil :background bg    :foreground "#6BA327")
   ((org-quote &override) :background base1)

   ;; org-mode
   (org-hide :foreground bg)
   (solaire-org-hide-face :foreground hidden)

   (tooltip              :background bg-alt :foreground fg))

  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-verde-theme.el ends here
