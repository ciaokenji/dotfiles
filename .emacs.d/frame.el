;;;
;;; ~/.emacs for GNU Emacs for Windows NT and Windows 95
;;;

;;; Japanese

  (set-language-environment "Japanese")
  (set-default-coding-systems 'sjis)
  (set-terminal-coding-system 'sjis)
  (set-clipboard-coding-system 'sjis-dos)
  (setq explicit-shell-file-name "bash.exe")
  (setq shell-file-name "sh.exe")
  ;;;(setq shell-command-option "-c")
  (add-hook 'shell-mode-hook
    (lambda ()
      (set-buffer-process-coding-system 'undecided-dos 'sjis-unix)))
  (setq completion-ignore-case nil)

;;; TrueType Font
;;;
;;; ((insert (prin1-to-string (w32-select-font)))

  (create-fontset-from-fontset-spec
    "-outline-\236\263\236\254\236\265\236\267\236\266\201\276\236\262\201\251-normal-r-normal-normal-13-97-96-96-c-*-fontset-ttf")

;(create-fontset-from-fontset-spec
;       "-*-Courier New-normal-r-*-*-13-*-*-*-c-*-fontset-ttf,
;       japanese-jisx0208:-*-MS-normal-r-*-*-16-*-*-*-c-*-jisx0208-sjis,
;       japanese-jisx0212:-*-MS-normal-r-*-*-16-*-*-*-c-*-jisx0208-sjis,
;       katakana-jisx0201:-*-MS-normal-r-*-*-16-*-*-*-c-*-jisx0201-sjis,
;       latin-jisx0201:-*-MS-normal-r-*-*-16-*-*-*-c-*-jisx0201-sjis,
;       japanese-jisx0208-1978:-*-MS-normal-r-*-*-16-*-*-*-c-*-jisx0208-sjis" t)
;;; Frame

  (setq default-frame-alist
    '((foreground-color . "black")
      ;;(background-color . "lightgray")
      (background-color . "white")
      (width . 80) (height . 40)
      (top . 50) (left . 50)
      (menu-bar-lines . 1)
      (font . "fontset-ttf")
      ))

;;; Scrolling

(setq scroll-conservatively 1)
