; converts the 16 bit value of score into 3 binary coded decimal

score_to_bcd    sed
                lda #0
                sta score_bcd+0
                sta score_bcd+1
                sta score_bcd+2
                ldx #16

conv_bit        asl score+0
                rol score+1

                lda score_bcd+0
                adc score_bcd+0
                sta score_bcd+0

                lda score_bcd+1
                adc score_bcd+1
                sta score_bcd+1

                lda score_bcd+2
                adc score_bcd+2
                sta score_bcd+2

                dex
                bne conv_bit
                cld
                rts

                
