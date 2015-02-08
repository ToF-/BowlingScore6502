; main.asm
            jsr init_screen
            lda #$17
            sta score+0
            lda #$01
            sta score+1
            jsr score_to_bcd

            lda score_bcd+0
            ldx 1
            jsr assert_equals
            lda score_bcd+1
            ldx 1
            jsr assert_equals
            lda score_bcd+2
            ldx 7
            jsr assert_equals
            rts

score       !word 0         ; 1 word  for score e.g. $0117 (279)
score_bcd   !byte 0,0,0     ; 3 bytes for binary coded decimal e.g. 2 7 9

