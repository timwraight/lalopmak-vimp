
;;  Colemak Evil: A set of optimized Vim-like key bindings for Emacs.
;;  Copyright (C) 2013 Patrick Brinich-Langlois

;;  lalopmak-vimp: A more geometric fork.
;;  Copyright (C) 2013

;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.

;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU General Public License for more details.

;;  You should have received a copy of the GNU General Public License
;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.


(require 'lalopmak-vimp-base)


;;;;;;;;;;;;;;;;; Bindings ;;;;;;;;;;;;;;;;;;;



;;; Up/down/left/right
(set-in-all-vimp-states-but-insert "u" 'vimp-previous-line)
(set-in-all-vimp-states-but-insert "e" 'vimp-next-line)
(set-in-all-vimp-states-but-insert "n" 'lalopmak-vimp-backward-char)
(set-in-all-vimp-states-but-insert "i" 'lalopmak-vimp-forward-char)

;;; Beginning/end of line (home/end)
(set-in-all-vimp-states-but-insert "L" 'back-to-indentation)
(set-in-all-vimp-states-but-insert "Y" 'vimp-end-of-line)

(vimp-define-motion lalopmak-vimp-scroll-page-up (count)
  "Scrolls page up 10 lines"
  (previous-line 10))

(vimp-define-motion lalopmak-vimp-scroll-page-down (count)
  "Scrolls down 10 lines"
  (next-line 10))


;;; Prev/next buffer
(set-in-all-vimp-states-but-insert "\M-u" 'lalopmak-vimp-scroll-page-up)
(set-in-all-vimp-states-but-insert "\M-e" 'lalopmak-vimp-scroll-page-down)

;;; Words forward/backward
;; (set-in-all-vimp-states-but-insert "\C-n" 'lalopmak-vimp-backward-word-begin)
;; (set-in-all-vimp-states-but-insert "\C-i" 'lalopmak-vimp-forward-word-end)

;;; WORD forward/backward
(set-in-all-vimp-states-but-insert "\M-i" 'lalopmak-vimp-forward-WORD-end)
(set-in-all-vimp-states-but-insert "\M-n" 'lalopmak-vimp-backward-WORD-begin)


;;Ace jump
(set-in-all-vimp-states-but-insert "l" 'lalopmak-vimp-narrowed-ace-jump-char-mode)
(set-in-all-vimp-states-but-insert "\M-l" 'lalopmak-vimp-ace-jump-char-mode)
;; So far I find that I only need these two, but the char-to-mode one looks like it
;; could be useful as a motion, because it stops one char short of the character.
;; (set-in-all-vimp-states-but-insert "F" 'lalopmak-vimp-narrowed-ace-jump-char-to-mode)
;; (set-in-all-vimp-states-but-insert "W" 'lalopmak-vimp-ace-jump-char-to-mode)


;;directional object maps
(lalopmak-vimp-define-key vimp-inner-text-objects-map "l" 'vimp-inner-word)
(lalopmak-vimp-define-key vimp-outer-text-objects-map "l" 'vimp-a-word)
(lalopmak-vimp-define-key vimp-inner-text-objects-map "y" 'vimp-inner-WORD)
(lalopmak-vimp-define-key vimp-outer-text-objects-map "y" 'vimp-a-WORD)
(lalopmak-vimp-define-key vimp-inner-text-objects-map "e" 'vimp-inner-sentence)
(lalopmak-vimp-define-key vimp-outer-text-objects-map "e" 'vimp-a-sentence)
(lalopmak-vimp-define-key vimp-inner-text-objects-map "u" 'vimp-inner-paragraph)
(lalopmak-vimp-define-key vimp-outer-text-objects-map "u" 'vimp-a-paragraph)

;; Not sure what this is, think it's an emacs definition.  Originally assigned to o
(lalopmak-vimp-define-key vimp-inner-text-objects-map "n" 'vimp-inner-symbol)
(lalopmak-vimp-define-key vimp-outer-text-objects-map "n" 'vimp-a-symbol)

;; Execute command: map : to ;
(lalopmak-vimp-define-key vimp-motion-state-map ";" 'vimp-ex);;; End of word forward/backward

;;; Cut/copy/paste
(set-in-all-vimp-states-but-insert "x" 'vimp-substitute)
(set-in-all-vimp-states-but-insert "X" 'vimp-delete-line)  ; delete to end of line; use dd to delete whole line
(set-in-all-vimp-states-but-insert "c" 'vimp-yank)
(set-in-all-vimp-states-but-insert "C" 'vimp-yank-line)

;; "Original" paste v/undo p
;; =====
(set-in-all-vimp-states-but-insert "V" 'vimp-paste-before)
(set-in-all-vimp-states-but-insert "v" 'vimp-paste-after)
(set-in-all-vimp-states-but-insert "\C-v" 'vimp-paste-pop)
(set-in-all-vimp-states-but-insert "\M-v" 'vimp-paste-pop-next)

;;; Undo/redo
(lalopmak-vimp-define-key vimp-normal-state-map "p" 'undo)
(when (fboundp 'undo-tree-undo)
  (lalopmak-vimp-define-key vimp-normal-state-map "p" 'undo-tree-undo)
  (lalopmak-vimp-define-key vimp-normal-state-map "\C-p" 'undo-tree-redo))
;; =====

;; Experimental swapped paste p/undo v
;; =====
;; (set-in-all-vimp-states-but-insert "P" 'vimp-paste-before)
;; (set-in-all-vimp-states-but-insert "p" 'vimp-paste-after)
;; (set-in-all-vimp-states-but-insert "\C-p" 'vimp-paste-pop)

;; ;;; Undo/redo
;; (lalopmak-vimp-define-key vimp-normal-state-map "v" 'undo)
;; (when (fboundp 'undo-tree-undo)
;;   (lalopmak-vimp-define-key vimp-normal-state-map "v" 'undo-tree-undo)
;;   (lalopmak-vimp-define-key vimp-normal-state-map "\C-v" 'undo-tree-redo))
;; =====



;;; Cursor position jumplist
(set-in-all-vimp-states-but-insert "N" 'vimp-jump-backward)
(set-in-all-vimp-states-but-insert "I" 'vimp-jump-forward)


;;; Move cursor to top/bottom of screen
;; next/prior are page up/down
(set-in-all-vimp-states (kbd "C-<next>") 'vimp-window-bottom)
(set-in-all-vimp-states (kbd "C-<prior>") 'vimp-window-top)


;;; Make insert/add work also in visual line mode like in visual block mode
;; not sure what this means

;;; Visual mode
(set-in-all-vimp-states-but-insert "a" 'vimp-visual-char)
(set-in-all-vimp-states-but-insert "A" 'vimp-visual-line)
(set-in-all-vimp-states-but-insert "\C-a" 'mark-whole-buffer)
(lalopmak-vimp-define-key vimp-motion-state-map "\M-a" 'vimp-visual-block)


;; ;;switching sides in visual mode
;; (define-key vimp-visual-state-map " a" 'exchange-point-and-mark)
;; (define-key vimp-visual-state-map " A" 'vimp-visual-exchange-corners)

;; ;;space-prefixed motions
;; (define-key vimp-motion-state-map " " nil)
;; (define-key vimp-motion-state-map "  " (lambda () (interactive) (insert " ")))
;; (define-key vimp-motion-state-map " /" 'vimp-scroll-line-to-bottom)
;; (define-key vimp-motion-state-map " \\" 'vimp-scroll-line-to-center)
;; (define-key vimp-motion-state-map " !" 'vimp-scroll-line-to-top)

;;;vimp-surround


(setcdr surround-mode-map nil) ;removes previous "s" mappings

(vimp-define-key 'operator surround-mode-map "z" 'surround-edit)
(vimp-define-key 'visual surround-mode-map "z" 'surround-region)
(vimp-define-key 'visual surround-mode-map "Z" 'Surround-region)

;;; visual Block mode
;; Since the system clipboard is accessible by Emacs through the
;; regular paste command (v), a separate C-v mapping isn't needed.
;; (lalopmak-vimp-define-key vimp-motion-state-map "\C-b" 'vimp-visual-block)

;;; Allow switching from visual line to visual block mode
;; not implemented

;;; Visual mode with mouse
;; not implemented
;;; Insert literal
;; not implemented

;;; GUI search
;; not implemented

;;; Redraw screen
;; not implemented

;;; Tabs
;; Who needs tabs? Use iswitchb instead. Put (iswitchb-mode 1) in your
;; .emacs and use C-x b to search for the buffer you want. C-s and C-r
;; rotate through the listed buffers

;;; New/close/save
;; these might conflict with emacs mappings


(set-in-all-vimp-states-but-insert "J" 'vimp-join)


;;not motion for compatiblilty with undo-tree
(set-in-all-vimp-states-but-insert-and-motion "q" 'vimp-replace)
(set-in-all-vimp-states-but-insert-and-motion "Q" 'vimp-replace-state)

;;; Scroll in place
(lalopmak-vimp-define-key vimp-motion-state-map (kbd "C-<up>") 'vimp-scroll-line-up)
(lalopmak-vimp-define-key vimp-motion-state-map (kbd "C-<down>") 'vimp-scroll-line-down)

;;; Live line reordering
;; not implemented

;;; Restore mappings
;;; Free mappings: ,/+/H

;;; Macros
;; (lalopmak-vimp-define-key vimp-normal-state-map "Q" '(lambda ()
;; 					 (interactive)
;; 					 (vimp-execute-macro 1 last-kbd-macro)))

;; (cond (window-system  ; ensure not running in a terminal
;;        (lalopmak-vimp-local-set-key (kbd "<return>") 'newline)
;;        (lalopmak-vimp-local-set-key "\C-m" 'vimp-record-macro)))
(lalopmak-vimp-define-key vimp-normal-state-map "'" 'vimp-execute-macro)
(lalopmak-vimp-define-key vimp-normal-state-map "m" 'vimp-record-macro)
;; (lalopmak-vimp-define-key vimp-normal-state-map "\"" 'vimp-execute-macro)

(lalopmak-vimp-define-key vimp-normal-state-map "M" 'vimp-set-marker)


(define-key vimp-motion-state-map (kbd "C-'") 'vimp-goto-mark-line)
;;; Duplicate line
;; not implemented
;; Use "CV" instead

;;; Misc overridden keys must be prefixed with g
;; not implemented


(vimp-define-operator lalopmak-vimp-all-case (beg end type)
  "Converts to all case, or, if already all case, converts to all lower case."
  (let ((region (buffer-substring beg end)))
    (if (equal (upcase region)
               region)
        (vimp-downcase beg end type)
      (vimp-upcase beg end type))))


(lalopmak-vimp-define-key vimp-visual-state-map "m" 'lalopmak-vimp-all-case)

;;; Search
(lalopmak-vimp-define-key vimp-motion-state-map "k" 'vimp-search-next)
(lalopmak-vimp-define-key vimp-motion-state-map "K" 'vimp-search-previous)

;;; Folding
;; (lalopmak-vimp-define-key vimp-normal-state-map "zo" 'vimp-open-fold)
;; (lalopmak-vimp-define-key vimp-normal-state-map "zc" 'vimp-close-fold)
;; (lalopmak-vimp-define-key vimp-normal-state-map "za" 'vimp-toggle-fold)
;; (lalopmak-vimp-define-key vimp-normal-state-map "zr" 'vimp-open-folds)
;; (lalopmak-vimp-define-key vimp-normal-state-map "zm" 'vimp-close-folds)

;;; Window handling
;; C-w (not C-r as in Shai's mappings) prefixes window commands

(lalopmak-vimp-define-key vimp-window-map "n" 'vimp-window-left)
(lalopmak-vimp-define-key vimp-window-map "N" 'vimp-window-move-far-left)
(lalopmak-vimp-define-key vimp-window-map "e" 'vimp-window-down)
(lalopmak-vimp-define-key vimp-window-map "E" 'vimp-window-move-very-bottom)
(lalopmak-vimp-define-key vimp-window-map "u" 'vimp-window-up)
(lalopmak-vimp-define-key vimp-window-map "U" 'vimp-window-move-very-top)
(lalopmak-vimp-define-key vimp-window-map "i" 'vimp-window-right)
(lalopmak-vimp-define-key vimp-window-map "I" 'vimp-window-move-far-right)
(lalopmak-vimp-define-key vimp-window-map "k" 'vimp-window-new)


(set-in-all-vimp-states-but-insert (kbd "\\")  'vimp-indent)

;;Unassigns previous object pending states
(define-key vimp-visual-state-map "a" nil)
(define-key vimp-visual-state-map "i" nil)
(define-key vimp-operator-state-map "a" nil)
(define-key vimp-operator-state-map "i" nil)


;; Insert / inner object pending state
(set-in-all-vimp-states-but-insert "r" 'vimp-insert)
(set-in-all-vimp-states-but-insert "R" 'vimp-insert-line)
(lalopmak-vimp-define-key vimp-operator-state-map "r" vimp-inner-text-objects-map)
(lalopmak-vimp-define-key vimp-visual-state-map "r" vimp-inner-text-objects-map)

;;Append / outer object pending state
(set-in-all-vimp-states-but-insert "s" 'vimp-append)
(set-in-all-vimp-states-but-insert "S" 'vimp-append-line)
(lalopmak-vimp-define-key vimp-operator-state-map "s" vimp-outer-text-objects-map)
(lalopmak-vimp-define-key vimp-visual-state-map "s" vimp-outer-text-objects-map)

(lalopmak-vimp-define-key vimp-visual-state-map "R" 'vimp-insert)
(lalopmak-vimp-define-key vimp-visual-state-map "S" 'vimp-append)

;;Change
(set-in-all-vimp-states-but-insert "T" 'vimp-change-line)
(set-in-all-vimp-states-but-insert "t" 'vimp-change)

;; (set-in-all-vimp-states-but-insert "p" 'vimp-substitute)   ;tentative assignment
;; (set-in-all-vimp-states-but-insert "\C-p" 'vimp-change-whole-line)

;;conflicts with undo
;; (set-in-all-vimp-states-but-insert "\C-t" 'vimp-jump-backward)
;; (set-in-all-vimp-states-but-insert "\C-p" 'vimp-jump-forward)

;;old find char/reverse for use in macros
(set-in-all-vimp-states-but-insert "\M-f" 'vimp-find-char)
(set-in-all-vimp-states-but-insert "\M-w" 'vimp-find-char-backward)
(set-in-all-vimp-states-but-insert "\M-t" 'vimp-repeat-find-char)

;;Line jump
(set-in-all-vimp-states-but-insert "o" 'lalopmak-vimp-if-count-goto-line-else-ace-jump-line-mode) ;temporary assignment

;switch to buffer
(lalopmak-vimp-define-key vimp-motion-state-map "b" 'switch-to-buffer)
(lalopmak-vimp-define-key vimp-motion-state-map "\M-b" 'ido-write-file)
(lalopmak-vimp-define-key vimp-motion-state-map "\C-b" 'fiplr-find-file)
(lalopmak-vimp-define-key vimp-motion-state-map "B" 'find-file)

;;switches transpose words to transpose symbols
(lalopmak-vimp-define-key vimp-insert-state-map "\C-t" 'transpose-symbols)
(lalopmak-vimp-define-key vimp-normal-state-map "\C-t" 'transpose-symbols)

;;;;;;;;;;;;PASTING;;;;;;;;;;;;;;;;;;
(vimp-define-motion lalopmak-vimp-paste-below (count)
  "Pastes in the line below."
  (vimp-open-below 1)
  ;; (newline count) ;;TODO count indicates number of lines until the paste
  (vimp-paste-after 1))

(vimp-define-motion lalopmak-vimp-paste-below-then-normal (count)
  "Pastes in the line below then normal mode."
  (lalopmak-vimp-paste-below count)
  (vimp-normal-state))

(vimp-define-motion lalopmak-vimp-paste-above (count)
  "Pastes in the line above."
  (vimp-open-above 1)
  ;; (newline count) ;;TODO count indicates number of lines until the paste
  (vimp-paste-after 1))

(vimp-define-motion lalopmak-vimp-paste-above-then-normal (count)
  "Pastes in the line above then normal mode."
  (lalopmak-vimp-paste-above count)
  (vimp-normal-state))

(vimp-define-motion lalopmak-vimp-paste-at-bol (count)
  "Pastes at beginning of line."
  (back-to-indentation)
  (vimp-paste-before 1))

(vimp-define-motion lalopmak-vimp-paste-at-eol (count)
  "Pastes at end of line."
  (vimp-end-of-line)
  (vimp-paste-after 1))

;;o to open in line above/below, or [number]o to go to line [number]
(set-in-all-vimp-states-but-insert "z" 'vimp-open-below)
(set-in-all-vimp-states-but-insert "Z" 'vimp-open-above)

;;M-[direction] to paste in that direction
(set-in-all-vimp-states-but-insert "\M-u" 'lalopmak-vimp-paste-above-then-normal)
(set-in-all-vimp-states-but-insert "\M-e" 'lalopmak-vimp-paste-below-then-normal)
(lalopmak-vimp-define-key vimp-insert-state-map "\M-u" 'lalopmak-vimp-paste-above)
(lalopmak-vimp-define-key vimp-insert-state-map "\M-e" 'lalopmak-vimp-paste-below)
(set-in-all-vimp-states "\M-n" 'lalopmak-vimp-paste-at-bol)
(set-in-all-vimp-states "\M-i" 'lalopmak-vimp-paste-at-eol)



(lalopmak-vimp-define-key vimp-motion-state-map "0" 'vimp-beginning-of-line)


;;necessary or we get errors when trying to map "EE", "UE", etc
(lalopmak-vimp-define-key vimp-motion-state-map "E" nil)
(lalopmak-vimp-define-key vimp-motion-state-map "U" nil)

(lalopmak-vimp-define-key vimp-motion-state-map "EU" 'vimp-forward-section-begin)
(lalopmak-vimp-define-key vimp-motion-state-map "EE" 'vimp-forward-section-end)
(lalopmak-vimp-define-key vimp-motion-state-map "UU" 'vimp-backward-section-begin)
(lalopmak-vimp-define-key vimp-motion-state-map "UE" 'vimp-backward-section-end)
(lalopmak-vimp-define-key vimp-motion-state-map "U(" 'vimp-previous-open-paren)
(lalopmak-vimp-define-key vimp-motion-state-map "U)" 'vimp-previous-open-paren)
(lalopmak-vimp-define-key vimp-motion-state-map "E(" 'vimp-next-close-paren)
(lalopmak-vimp-define-key vimp-motion-state-map "E)" 'vimp-next-close-paren)
(lalopmak-vimp-define-key vimp-motion-state-map "U{" 'vimp-previous-open-brace)
(lalopmak-vimp-define-key vimp-motion-state-map "U}" 'vimp-previous-open-brace)
(lalopmak-vimp-define-key vimp-motion-state-map "E}" 'vimp-next-close-brace)
(lalopmak-vimp-define-key vimp-motion-state-map "E}" 'vimp-next-close-brace)

;;tentative assignment; for the key in top middle
(lalopmak-vimp-define-key vimp-motion-state-map "!" 'vimp-jump-item)

;; Makes ; an alias for :
(set-in-all-vimp-states-but-insert ";" 'vimp-ex)


;;hooks for hints
(vimp-ex-define-cmd "hints" 'lalopmak-vimp-hints)
(vimp-ex-define-cmd "ars" "hints")

(vimp-ex-define-cmd "mnemonic" 'lalopmak-vimp-mnemonic-hints)



;;Experiment: swaps o and :
;; (set-in-all-vimp-states-but-insert ";" 'lalopmak-vimp-goto-line-if-count-else-open-below)
;; (set-in-all-vimp-states-but-insert ":" 'vimp-open-above)
;; (set-in-all-vimp-states-but-insert "o" 'vimp-ex)
;; (set-in-all-vimp-states-but-insert "O" 'vimp-ex)

;; (vimp-define-key 'normal vimp-paredit-mode-map
;;   (kbd "d") 'vimp-paredit-delete
;;   (kbd "t") 'vimp-paredit-change
;;   (kbd "c") 'vimp-paredit-yank
;;   (kbd "D") 'vimp-paredit-delete-line
;;   (kbd "T") 'vimp-paredit-change-line
;;   (kbd "C") 'vimp-paredit-yank-line
;;   (kbd "x") 'paredit-backward-delete
;;   (kbd "X") 'paredit-forward-delete)

;;experiment
(setq vimp-cross-lines t)




(provide 'lalopmak-vimp)