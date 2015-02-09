; converts the DCB score value to txt for print

score_to_txt    lda score_bcd+1
                ora #$30
                sta score_txt+0
_score_txt1     lda score_bcd+0
                pha
                lsr
                lsr
                lsr
                lsr
                ora #$30
                sta score_txt+1
                pla
                and #$0F
                ora #$30
                sta score_txt+2
                rts

                
