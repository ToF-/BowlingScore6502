    processor 6502
    org $0801
    .byte $0c, $08, $0a, $00, $9e, $20  ; basic program: 10 sys 4096 
    .byte $34, $30, $39, $36, $00, $00  ; launches our code in $1000
    .byte $00
    org $1000
border_color equ $d020
screen_color equ $d021
chrout       equ $ffd2

    jmp test0
    include "bowling.asm"

test0 ; after add_roll, score increases
    lda #147
    jsr chrout
    jsr start_game
    lda #4
    sta roll
    jsr add_roll
    jsr add_roll
    lda score
    cmp #8
    beq test1
    jmp fail
test1 ; after 20 average rolls, adding roll doesn't increase score
    lda #46
    jsr chrout
    jsr start_game
    lda #21
    sta tmp
test1loop
    lda #4
    sta roll
    jsr add_roll
    dec tmp
    bne test1loop
    lda score
    cmp #80
    beq test2
    jmp fail
test2 ; a strike increases frame 
    lda #46
    jsr chrout
    jsr start_game
    lda #10
    sta roll
    jsr add_roll
    lda frame
    cmp #1
    beq test3
    jmp fail
test3 ; a first roll doesn't increases frame 
    lda #46
    jsr chrout
    jsr start_game
    lda #9
    sta roll
    jsr add_roll
    lda frame
    cmp #0
    beq test4
    jmp fail
test4 ; bonus rolls are added to score if there is bonus
    lda #46
    jsr chrout
    jsr start_game
    lda #2
    sta bonus
    lda #4
    sta roll
    jsr add_roll
    lda score
    cmp #12
    beq test5
    jmp fail
test5 ; a strike creates a bonus of 1 for next roll and 1 for next next roll
    lda #46
    jsr chrout
    jsr start_game
    lda #10
    sta roll
    jsr add_roll
    lda bonus
    cmp #5
    beq test6
    jmp fail
test6 ; a spare creates a bonus of 1 for next roll
    lda #46
    jsr chrout
    jsr start_game
    lda #5
    sta roll
    jsr add_roll
    lda #5
    sta roll
    jsr add_roll
    lda bonus
    cmp #1
    beq test7
    jmp fail
    rts
test7 ; a strike after a strike creates a bonus of 2 for next roll and 1 for next next roll
    lda #46
    jsr chrout
    jsr start_game
    lda #10
    sta roll
    jsr add_roll
    lda #10
    sta roll
    jsr add_roll
    lda bonus
    cmp #6
    beq test8
    jmp fail
test8 ; after 10 frames, strikes or spares don't create bonus
    lda #46
    jsr chrout
    jsr start_game
    lda #12
    sta tmp
test8_loop
    lda #10
    sta roll
    jsr add_roll
    dec tmp
    bne test8_loop
    lda score
    cmp #$2C
    bne fail
    lda score+1
    cmp #$01
    bne fail
    lda #46
    jsr chrout

succeed
    lda #5
    sta border_color
    rts
fail
    lda #2
    sta border_color
    rts


