;============================================================
; write text on the screen
;============================================================


prompt 	    ldx #$00          ; init X-Register with $00
loop_prompt lda prompt_line,x ; read characters from line of text...
          	beq end_prompt
          	sta $0400,x       ; ...and store in screen ram near the center
           	inx 
           	cpx #$28          ; finished when all 40 cols of a line are processed
           	bne loop_prompt   ; loop if we are not done yet
end_prompt	rts