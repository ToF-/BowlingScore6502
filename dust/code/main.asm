;============================================================
; Start coding here / delete example code
;============================================================

;============================================================
; clear screen and turn black
;============================================================

main            jsr clear_screen
                jsr prompt
                jsr get_roll
                rts