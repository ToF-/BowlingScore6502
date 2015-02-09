; main.asm
            jsr init_screen
            jsr tests

            rts

roll        !byte 0         ; roll to add to score
score       !word 0         ; 1 word  for score e.g. $0117 (279)
score_bcd   !byte 0,0,0     ; 3 bytes for binary coded decimal e.g. 2 7 9
score_txt   !text "  0",0   ; placeholder for score output

