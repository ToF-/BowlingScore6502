
!macro      should_equal address {
            lda address
            jsr assert_equals }

tests       ; when score = #$0107 then score_txt should be "263"
            lda #$07
            sta score+0
            lda #$01
            sta score+1

            jsr score_to_bcd
            jsr score_to_txt
            ldx #$32
            +should_equal score_txt+0
            ldx #$36
            +should_equal score_txt+1
            ldx #$33
            +should_equal score_txt+2

            ; when add_roll 5 then score should increase by 5
            lda #$FE
            sta score+0
            lda #$00
            sta score+1
            lda #5
            sta roll
            jsr add_roll
            ldx #$03
            +should_equal score+0
            ldx #$01
            +should_equal score+1

            rts
