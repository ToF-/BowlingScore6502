
get_roll    jsr $FFCF
            cmp #$58
            beq x_entered
            cmp #$30
            bcc get_roll
			cmp #$39
			beq decode
			bcs get_roll
decode		and #$0F
			rts
x_entered	lda #$0A
end_get		rts