; main.asm

            jsr init_screen
            lda #$48
            ldx #$42
            jsr assert_equals
            lda #$42
            jsr assert_equals
            rts
