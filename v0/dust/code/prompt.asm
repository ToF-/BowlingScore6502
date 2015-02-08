prompt      ldx #0
     	    lda prompt_line,x ; read characters from line of text...
          	beq end_prompt
            jsr $FFD2
            inx
            jmp prompt
end_prompt	rts
