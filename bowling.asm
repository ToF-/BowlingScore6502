    processor 6502
    org $0801
    .byte $0c, $08, $0a, $00, $9e, $20
    .byte $34, $30, $39, $36, $00, $00
    .byte $00
    org $1000

    jmp tests
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
    beq add_done
    jsr add_score
add_done
    clc
    lda track
    adc roll
    cmp #21     ;  11 + 10 = 10 roll on a new frame = strike
    bne not_strike
    lda #3
    sta type
    rts
not_strike
    cmp #$0A    ; tr + ro = 10 it's a spare
    bne not_spare
    lda #2
    sta type
    rts
not_spare
    bcc not_second
    lda #1
    sta type
    rts
not_second
    lda #0
    sta type
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
tests
    lda #$0B
    sta track
    lda #$0A
    sta roll
    jsr add_roll
    lda type
    cmp #$03
    bne fail
    jsr succeed
    
    lda #$04
    sta track
    lda #$06
    sta roll
    jsr add_roll
    lda type
    cmp #$02
    bne fail
    jsr succeed
    
    lda #$0B
    sta track
    lda #$04
    sta roll
    jsr add_roll
    lda type
    cmp #$00
    bne fail 
    jsr succeed
    rts
succeed
    lda #5
    sta $d020
    rts
fail
    lda #2
    sta $d020
    rts

roll    .byte 0
score   .word 0
bonus   .byte 0
frame   .byte 0
track   .byte 0
type    .byte 0
     
