tests       ; when score = #$0107 then score_txt should be "263"
            lda #$07
            sta score+0
            lda #$01
            sta score+1

            jsr score_to_bcd
            jsr score_to_txt
            lda score_txt+0
            ldx #$32
            jsr assert_equals
            lda score_txt+1
            ldx #$36
            jsr assert_equals
            lda score_txt+2
            ldx #$33
            jsr assert_equals

            ; when add_roll 5 then score should increase by 5
            lda #$FE
            sta score+0
            lda #$00
            sta score+1
            lda #5
            sta roll
            jsr add_roll
            lda score+0
            ldx #$03
            jsr assert_equals
            lda score+1
            ldx #$01
            jsr assert_equals

            rts
