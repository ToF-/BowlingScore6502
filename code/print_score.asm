print_score     ldx #0
loop_prt_score  lda score_txt,x
                beq end_prt_score
                jsr chrout
                inx 
                bne loop_prt_score
end_prt_score   rts
