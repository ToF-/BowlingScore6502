;============================================================
; clear screen and turn black
;============================================================

clear_screen     ldx #$00     ; start of loop
                 stx $d020    ; write to border register
                 stx $d021    ; write to screen register
                 lda #147     ; clear screen
                 jsr $FFD2
                 lda #30      ; green
                 jsr $FFD2
                 rts
