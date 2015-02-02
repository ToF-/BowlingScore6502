    processor 6502
    org $1000

add_roll
    lda bonus
    and #$03
    tax 
loop_score
    jsr add_score
    dex
    bne loop_score
    lda frame
    cmp #$10
    beq end_score
    jsr add_score
end_score
    rts
add_score
    clc
    lda roll
    adc score
    sta score
    lda #0
    adc score+1
    sta score+1
    rts

start
    lda #0
    sta score+0
    sta score+1
    sta bonus
    sta frame
    sta roll
    lda #$0B
    sta track
    rts

roll    .byte 0
score   .word 0
bonus   .byte 0
frame   .byte 0
track   .byte 0
     
