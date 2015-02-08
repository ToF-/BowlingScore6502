
chrout = $ffd2
border_col = $d020
bckgnd_col = $d021

init_screen lda #0          ; black
            sta border_col
            sta bckgnd_col
            lda #147        ; clear screen
            jsr chrout
            lda #30         ; set cursor color to green
            jsr chrout
            rts
