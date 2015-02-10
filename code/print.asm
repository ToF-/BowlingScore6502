!macro          print address {
                ldx #0
loop_print      lda address,x
                beq end_print
                jsr chrout
                inx
                bne loop_print
end_print       rts }
