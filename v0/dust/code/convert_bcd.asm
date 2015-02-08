conv_to_bcd sed 
            lda #0
            sta bcd_num+0
            sta bcd_num+1
            sta bcd_num+2
            ldx #9
conv_bit    asl bin_num+0
            rol bin_num+1
            lda bcd_num+0
            adc bcd_num+0
            lda bcd_num+1
            sta bcd_num+1
            lda bcd_num+2
            sta bcd_num+2
            dex
            bne conv_bit
            cld
            rts

bin_num 	!word  0
bcd_num	    !byte  0,0,0
