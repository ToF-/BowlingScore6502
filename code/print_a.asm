print_a     pha
            pha
            lsr 
            lsr 
            lsr
            lsr
            jsr prnt_nibble
            pla
            jsr prnt_nibble
            pla
            rts

prnt_nibble and #$0F
            ora #$30
            cmp #$3A
            bcc emit
            adc #$05 ; + carry
emit        jsr chrout
            rts
