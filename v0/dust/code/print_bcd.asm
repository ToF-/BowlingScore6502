print_bcd       lda bcd_num+0
                bne print_nz_1
                lda #$20
                jsr $FFD2
                jmp print_digit_2
print_nz_1      ora #$30
                jsr $FFD2
print_digit_2   lda bcd_num+1
                bne print_nz_2
                lda #$20
                jsr $FFD2
print_nz_2      ora #$30
                jsr $FFD2
                lda bcd_num+2
                ora #$30
                jsr $FFD2
                rts
