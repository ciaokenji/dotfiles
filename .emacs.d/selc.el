;; selc.el --- Standard Calculator ver 0.1

(defun selc-init ()
    "initialize variables"
    (setq selc-numstr "")
    (setq selc-opstr "+")
    (setq selc-result 0))

(defun selc-getchar ()
    "get a charactor"
    (setq selc-charnum (read-char))
    (if (and (> selc-charnum 47) (< selc-charnum 58))
	(selc-set-numstr (number-to-string (- selc-charnum 48)))) 
    (if (equal selc-charnum 46)
        (selc-set-numstr "."))
    (if (equal selc-charnum 13) (selc-calculate "+"))
    (if (equal selc-charnum 42) (selc-calculate "*"))
    (if (equal selc-charnum 43) (selc-calculate "+"))
    (if (equal selc-charnum 45) (selc-calculate "-"))
    (if (equal selc-charnum 47) (selc-calculate "/"))
    (if (or (equal selc-charnum 66) (equal selc-charnum 99))
	(selc-init))
    (if (or (equal selc-charnum 88) (equal selc-charnum 120))
	(setq selc-alive nil)))

(defun selc-set-numstr (numstr)
    "concatenate number string"
    (setq selc-numstr (concat selc-numstr numstr)))

(defun selc-calculate (opstr)
    "format lisp expression and evaluate it"
    (setq selc-expstr 
        (concat 
	    "(" selc-opstr " " 
	    (number-to-string selc-result) 
	    " " selc-numstr ")"))
    (setq selc-numstr "")
    (setq selc-opstr opstr)
    (setq selc-result 
        (float (eval (car (read-from-string selc-expstr))))))

(defun selc-display ()
    "display menu and value"
    (interactive "p")
    (if (equal selc-numstr "")
            (setq selc-value (number-to-string selc-result))
	(setq selc-value selc-numstr))
    (message (concat "e[X]it / [C]lear : " selc-value)))

(defun selc ()
    "simple elisp calculator using mini buffer"
    (interactive)
    (selc-init)
    (setq selc-alive t)
    (while selc-alive
	(selc-display)
        (selc-getchar))
    (message "End of selc"))
