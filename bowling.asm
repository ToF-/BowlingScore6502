
start_game      ; initialize bonus, score, frame
    lda #0
    sta bonus   
    sta score
    sta score+1
    sta frame
    lda #11     ; 11 = new frame beginning
    sta track
    rts

add_roll        ; add a roll to the score
    lda bonus
    and #3      ; bonus for this roll can be 2,1 or 0
    tax
    lda bonus   ; shift bonus to next roll bonus (5->1)
    lsr
    lsr
    sta bonus   
    txa             ; bonus for this roll
    beq add_normal  ; if no bonus, just add the roll
    tax
    jsr add_score   ; add roll once more
    dex     
    beq add_normal
    jsr add_score   ; add roll twice 
add_normal
    lda frame
    cmp #10     ; if frame=10 don't add score
    beq end_add
    jsr add_score
end_add
    lda frame   ; if frame=10 don't generate bonus
    cmp #10
    beq keep_track  ; keep always in the same frame
    clc         ; calculating new bonus
    lda track
    adc roll
    cmp #21     ; new frame+10 ==> strike
    bne not_strike
    clc
    lda bonus   
    adc #5      ; next next roll bonus on bit 2, next roll bonus on bits 1 and 0
    sta bonus
    jmp new_frame
not_strike
    cmp #10     ; track+roll= 10  ==> spare 
    bne not_spare
    lda #1
    sta bonus
    jmp new_frame
not_spare
    bcc new_frame   ; track + roll < 10 => new frame
keep_track          ; 1st roll, keep track of roll
    lda roll
    sta track
    rts
new_frame           ; mark new frame
    lda #11
    sta track
    inc frame       ; increase frame
    rts
add_score           ; add roll to score
    clc
    lda roll
    adc score
    sta score
    lda #0
    adc score+1
    sta score+1
    rts

roll    .byte   0
score   .word   0
frame   .byte   0
track   .byte   0
bonus   .byte   0
tmp     .byte   0

