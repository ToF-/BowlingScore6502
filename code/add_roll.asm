add_roll        clc
                lda score+0
                adc roll
                sta score+0
                lda score+1
                adc #$00
                sta score+1
                rts
