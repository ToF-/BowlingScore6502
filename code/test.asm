; compare A and X (X = expected) if they are equals, print a .
; if they differ, print x then a 
assert_equals   sta result
                cpx result
                bne fail
                lda #46
                jsr chrout
                rts
fail            jsr print_a
                lda #33
                jsr chrout
                lda #61
                jsr chrout
                txa    
                jsr print_a
                lda #13
                jsr chrout
                rts          

result          !byte 0 
