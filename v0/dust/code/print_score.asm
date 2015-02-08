print_score     jsr conv_to_bcd
                ldx #0
label_score     lda score_line,x
                beq end_print_label
                jsr $FFD2
                inx
                jmp label_score
end_print_label jsr print_bcd
                rts

