; Compiled with 1.32.270.0
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e 02 19 STX $1902 ; (spentry + 0)
0811 : a2 29 __ LDX #$29
0813 : a0 87 __ LDY #$87
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 2a __ CPX #$2a
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 99 __ CPY #$99
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 f2 __ LDA #$f2
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;1557, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0880 : a9 00 __ LDA #$00
0882 : 8d 20 d0 STA $d020 
0885 : 8d 21 d0 STA $d021 
0888 : 20 f4 08 JSR $08f4 ; (scene1_run.s4 + 0)
088b : 20 69 0d JSR $0d69 ; (scene2_run.s4 + 0)
088e : 20 98 11 JSR $1198 ; (scene3_run.s1 + 0)
0891 : 20 38 17 JSR $1738 ; (scene4_run.s4 + 0)
0894 : a9 28 __ LDA #$28
0896 : 85 0d __ STA P0 
0898 : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
089b : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
089e : a9 0a __ LDA #$0a
08a0 : 85 0d __ STA P0 
08a2 : a9 29 __ LDA #$29
08a4 : 85 10 __ STA P3 
08a6 : a9 01 __ LDA #$01
08a8 : 85 11 __ STA P4 
08aa : a9 32 __ LDA #$32
08ac : 85 0f __ STA P2 
08ae : 20 c2 0b JSR $0bc2 ; (pcenter.s4 + 0)
08b1 : a9 32 __ LDA #$32
08b3 : 85 0d __ STA P0 
08b5 : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
08b8 : a9 0c __ LDA #$0c
08ba : 85 0d __ STA P0 
08bc : 85 11 __ STA P4 
08be : a9 53 __ LDA #$53
08c0 : 85 0f __ STA P2 
08c2 : a9 29 __ LDA #$29
08c4 : 85 10 __ STA P3 
08c6 : 20 c2 0b JSR $0bc2 ; (pcenter.s4 + 0)
08c9 : 20 ed 18 JSR $18ed ; (wait_frames@proxy + 0)
08cc : a9 12 __ LDA #$12
08ce : 85 0d __ STA P0 
08d0 : a9 29 __ LDA #$29
08d2 : 85 10 __ STA P3 
08d4 : a9 6c __ LDA #$6c
08d6 : 85 0f __ STA P2 
08d8 : 20 c2 0b JSR $0bc2 ; (pcenter.s4 + 0)
08db : a9 00 __ LDA #$00
08dd : 8d c5 19 STA $19c5 ; (blink_phase + 0)
08e0 : 8d c4 19 STA $19c4 ; (blink_cnt + 0)
.l5:
08e3 : a9 12 __ LDA #$12
08e5 : 85 0f __ STA P2 
08e7 : a9 01 __ LDA #$01
08e9 : 85 10 __ STA P3 
08eb : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
08ee : 20 b7 0c JSR $0cb7 ; (blink_row.s4 + 0)
08f1 : 4c e3 08 JMP $08e3 ; (main.l5 + 0)
--------------------------------------------------------------------
scene1_run: ; scene1_run()->void
; 468, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
08f4 : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
08f7 : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
08fa : a9 03 __ LDA #$03
08fc : 85 0d __ STA P0 
08fe : a9 19 __ LDA #$19
0900 : 85 0e __ STA P1 
0902 : 20 de 0a JSR $0ade ; (sprite_load.s4 + 0)
0905 : a9 80 __ LDA #$80
0907 : 8d f8 07 STA $07f8 
090a : a9 a0 __ LDA #$a0
090c : 8d 00 d0 STA $d000 
090f : a9 38 __ LDA #$38
0911 : 8d 01 d0 STA $d001 
0914 : ad 10 d0 LDA $d010 
0917 : 29 fe __ AND #$fe
0919 : 8d 10 d0 STA $d010 
091c : a9 01 __ LDA #$01
091e : 8d 27 d0 STA $d027 
0921 : ad 1c d0 LDA $d01c 
0924 : 29 fe __ AND #$fe
0926 : 8d 1c d0 STA $d01c 
0929 : ad 1b d0 LDA $d01b 
092c : 29 fe __ AND #$fe
092e : 8d 1b d0 STA $d01b 
0931 : ad 1d d0 LDA $d01d 
0934 : 09 01 __ ORA #$01
0936 : 8d 1d d0 STA $d01d 
0939 : ad 17 d0 LDA $d017 
093c : 09 01 __ ORA #$01
093e : 8d 17 d0 STA $d017 
0941 : ad 15 d0 LDA $d015 
0944 : 09 01 __ ORA #$01
0946 : 8d 15 d0 STA $d015 
0949 : 20 f0 0a JSR $0af0 ; (draw_year.s4 + 0)
094c : a9 12 __ LDA #$12
094e : 20 87 0b JSR $0b87 ; (hline.s4 + 0)
0951 : a9 14 __ LDA #$14
0953 : 85 0d __ STA P0 
0955 : a9 19 __ LDA #$19
0957 : 85 10 __ STA P3 
0959 : a9 9c __ LDA #$9c
095b : 85 0f __ STA P2 
095d : 20 be 0b JSR $0bbe ; (pcenter@proxy + 0)
0960 : e6 11 __ INC P4 
0962 : a9 16 __ LDA #$16
0964 : 85 0d __ STA P0 
0966 : a9 aa __ LDA #$aa
0968 : 85 0f __ STA P2 
096a : a9 19 __ LDA #$19
096c : 85 10 __ STA P3 
096e : 20 c2 0b JSR $0bc2 ; (pcenter.s4 + 0)
0971 : 20 4a 0c JSR $0c4a ; (scroll_init.s4 + 0)
0974 : a9 00 __ LDA #$00
0976 : 8d c5 19 STA $19c5 ; (blink_phase + 0)
0979 : 8d c4 19 STA $19c4 ; (blink_cnt + 0)
097c : 85 47 __ STA T1 + 0 
097e : 85 48 __ STA T2 + 0 
0980 : a9 16 __ LDA #$16
0982 : 85 0f __ STA P2 
0984 : a9 0c __ LDA #$0c
0986 : 85 10 __ STA P3 
.l5:
0988 : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
098b : 20 6f 0c JSR $0c6f ; (scroll_step.s4 + 0)
098e : 20 b7 0c JSR $0cb7 ; (blink_row.s4 + 0)
0991 : e6 48 __ INC T2 + 0 
0993 : a5 48 __ LDA T2 + 0 
0995 : a6 47 __ LDX T1 + 0 
0997 : dd cb 19 CMP $19cb,x ; (seq_hold[0] + 0)
099a : 90 35 __ BCC $09d1 ; (scene1_run.s6 + 0)
.s8:
099c : a2 00 __ LDX #$00
099e : 86 48 __ STX T2 + 0 
09a0 : e6 47 __ INC T1 + 0 
09a2 : a5 47 __ LDA T1 + 0 
09a4 : c9 05 __ CMP #$05
09a6 : 90 02 __ BCC $09aa ; (scene1_run.s9 + 0)
.s15:
09a8 : 86 47 __ STX T1 + 0 
.s9:
09aa : a6 47 __ LDX T1 + 0 
09ac : bd c6 19 LDA $19c6,x ; (seq_frame[0] + 0)
09af : d0 0e __ BNE $09bf ; (scene1_run.s12 + 0)
.s10:
09b1 : a9 1b __ LDA #$1b
09b3 : a0 00 __ LDY #$00
.s11:
09b5 : 84 0d __ STY P0 
09b7 : 85 0e __ STA P1 
09b9 : 20 de 0a JSR $0ade ; (sprite_load.s4 + 0)
09bc : 4c d1 09 JMP $09d1 ; (scene1_run.s6 + 0)
.s12:
09bf : c9 01 __ CMP #$01
09c1 : f0 07 __ BEQ $09ca ; (scene1_run.s14 + 0)
.s13:
09c3 : a9 1b __ LDA #$1b
09c5 : a0 3f __ LDY #$3f
09c7 : 4c b5 09 JMP $09b5 ; (scene1_run.s11 + 0)
.s14:
09ca : a9 19 __ LDA #$19
09cc : a0 03 __ LDY #$03
09ce : 4c b5 09 JMP $09b5 ; (scene1_run.s11 + 0)
.s6:
09d1 : 20 11 0d JSR $0d11 ; (any_key.s4 + 0)
09d4 : aa __ __ TAX
09d5 : f0 b1 __ BEQ $0988 ; (scene1_run.l5 + 0)
.s7:
09d7 : ad 15 d0 LDA $d015 
09da : 29 fe __ AND #$fe
09dc : 8d 15 d0 STA $d015 
09df : a9 05 __ LDA #$05
09e1 : 85 0d __ STA P0 
09e3 : ad 1d d0 LDA $d01d 
09e6 : 29 fe __ AND #$fe
09e8 : 8d 1d d0 STA $d01d 
09eb : ad 17 d0 LDA $d017 
09ee : 29 fe __ AND #$fe
09f0 : 8d 17 d0 STA $d017 
09f3 : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
09f6 : 20 4c 0d JSR $0d4c ; (fade_to_black.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
09f9 : a9 0f __ LDA #$0f
09fb : 85 0d __ STA P0 
--------------------------------------------------------------------
wait_frames: ; wait_frames(u8)->void
; 126, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
09fd : a5 0d __ LDA P0 ; (n + 0)
09ff : f0 09 __ BEQ $0a0a ; (wait_frames.s3 + 0)
.l5:
0a01 : c6 0d __ DEC P0 ; (n + 0)
0a03 : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
0a06 : a5 0d __ LDA P0 ; (n + 0)
0a08 : d0 f7 __ BNE $0a01 ; (wait_frames.l5 + 0)
.s3:
0a0a : 60 __ __ RTS
--------------------------------------------------------------------
glitch_transition: ; glitch_transition()->void
; 663, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0a0b : a9 ac __ LDA #$ac
0a0d : 85 45 __ STA T2 + 0 
0a0f : a9 12 __ LDA #$12
0a11 : 85 46 __ STA T5 + 0 
.l5:
0a13 : a9 00 __ LDA #$00
0a15 : 85 1b __ STA ACCU + 0 
0a17 : 85 1f __ STA ADDR + 0 
0a19 : a9 04 __ LDA #$04
0a1b : 85 1c __ STA ACCU + 1 
0a1d : a6 45 __ LDX T2 + 0 
0a1f : 4c 24 0a JMP $0a24 ; (glitch_transition.l12 + 0)
.s15:
0a22 : e6 1c __ INC ACCU + 1 
.l12:
0a24 : 8a __ __ TXA
0a25 : 0a __ __ ASL
0a26 : a9 00 __ LDA #$00
0a28 : 2a __ __ ROL
0a29 : 85 1d __ STA ACCU + 2 
0a2b : 8a __ __ TXA
0a2c : 4a __ __ LSR
0a2d : 4a __ __ LSR
0a2e : 4a __ __ LSR
0a2f : 4a __ __ LSR
0a30 : 4a __ __ LSR
0a31 : 45 1d __ EOR ACCU + 2 
0a33 : 85 1d __ STA ACCU + 2 
0a35 : 8a __ __ TXA
0a36 : 4a __ __ LSR
0a37 : 4a __ __ LSR
0a38 : 4a __ __ LSR
0a39 : 4a __ __ LSR
0a3a : 45 1d __ EOR ACCU + 2 
0a3c : 85 1d __ STA ACCU + 2 
0a3e : 8a __ __ TXA
0a3f : 4a __ __ LSR
0a40 : 4a __ __ LSR
0a41 : 4a __ __ LSR
0a42 : 45 1d __ EOR ACCU + 2 
0a44 : 4a __ __ LSR
0a45 : 8a __ __ TXA
0a46 : 2a __ __ ROL
0a47 : aa __ __ TAX
0a48 : 29 3f __ AND #$3f
0a4a : a0 00 __ LDY #$00
0a4c : 91 1b __ STA (ACCU + 0),y 
0a4e : 18 __ __ CLC
0a4f : a5 1c __ LDA ACCU + 1 
0a51 : 69 d4 __ ADC #$d4
0a53 : 85 20 __ STA ADDR + 1 
0a55 : 8a __ __ TXA
0a56 : 4a __ __ LSR
0a57 : 4a __ __ LSR
0a58 : 4a __ __ LSR
0a59 : 4a __ __ LSR
0a5a : a4 1b __ LDY ACCU + 0 
0a5c : 91 1f __ STA (ADDR + 0),y 
0a5e : 98 __ __ TYA
0a5f : 18 __ __ CLC
0a60 : 69 01 __ ADC #$01
0a62 : 85 1b __ STA ACCU + 0 
0a64 : b0 bc __ BCS $0a22 ; (glitch_transition.s15 + 0)
.s16:
0a66 : c9 e8 __ CMP #$e8
0a68 : d0 ba __ BNE $0a24 ; (glitch_transition.l12 + 0)
.s11:
0a6a : a5 1c __ LDA ACCU + 1 
0a6c : c9 07 __ CMP #$07
0a6e : d0 b4 __ BNE $0a24 ; (glitch_transition.l12 + 0)
.s6:
0a70 : 86 45 __ STX T2 + 0 
0a72 : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
0a75 : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
0a78 : c6 46 __ DEC T5 + 0 
0a7a : d0 97 __ BNE $0a13 ; (glitch_transition.l5 + 0)
.s7:
0a7c : a9 00 __ LDA #$00
0a7e : 85 43 __ STA T1 + 0 
0a80 : a9 d8 __ LDA #$d8
0a82 : 85 44 __ STA T1 + 1 
.l8:
0a84 : a9 00 __ LDA #$00
0a86 : a0 27 __ LDY #$27
.l13:
0a88 : 91 43 __ STA (T1 + 0),y 
0a8a : 88 __ __ DEY
0a8b : 10 fb __ BPL $0a88 ; (glitch_transition.l13 + 0)
.s14:
0a8d : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
0a90 : 18 __ __ CLC
0a91 : a5 43 __ LDA T1 + 0 
0a93 : 69 28 __ ADC #$28
0a95 : 85 43 __ STA T1 + 0 
0a97 : 90 02 __ BCC $0a9b ; (glitch_transition.s18 + 0)
.s17:
0a99 : e6 44 __ INC T1 + 1 
.s18:
0a9b : c9 e8 __ CMP #$e8
0a9d : d0 e5 __ BNE $0a84 ; (glitch_transition.l8 + 0)
.s10:
0a9f : a5 44 __ LDA T1 + 1 
0aa1 : c9 db __ CMP #$db
0aa3 : d0 df __ BNE $0a84 ; (glitch_transition.l8 + 0)
--------------------------------------------------------------------
cls: ; cls()->void
;  54, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0aa5 : a9 00 __ LDA #$00
0aa7 : 85 1f __ STA ADDR + 0 
0aa9 : 8d 20 d0 STA $d020 
0aac : 8d 21 d0 STA $d021 
0aaf : 85 1b __ STA ACCU + 0 
0ab1 : a9 04 __ LDA #$04
0ab3 : 85 1c __ STA ACCU + 1 
0ab5 : d0 02 __ BNE $0ab9 ; (cls.l6 + 0)
.s7:
0ab7 : e6 1c __ INC ACCU + 1 
.l6:
0ab9 : a9 20 __ LDA #$20
0abb : a0 00 __ LDY #$00
0abd : 91 1b __ STA (ACCU + 0),y 
0abf : 18 __ __ CLC
0ac0 : a5 1c __ LDA ACCU + 1 
0ac2 : 69 d4 __ ADC #$d4
0ac4 : 85 20 __ STA ADDR + 1 
0ac6 : 98 __ __ TYA
0ac7 : a4 1b __ LDY ACCU + 0 
0ac9 : 91 1f __ STA (ADDR + 0),y 
0acb : 98 __ __ TYA
0acc : 18 __ __ CLC
0acd : 69 01 __ ADC #$01
0acf : 85 1b __ STA ACCU + 0 
0ad1 : b0 e4 __ BCS $0ab7 ; (cls.s7 + 0)
.s8:
0ad3 : c9 e8 __ CMP #$e8
0ad5 : d0 e2 __ BNE $0ab9 ; (cls.l6 + 0)
.s5:
0ad7 : a5 1c __ LDA ACCU + 1 
0ad9 : c9 07 __ CMP #$07
0adb : d0 dc __ BNE $0ab9 ; (cls.l6 + 0)
.s3:
0add : 60 __ __ RTS
--------------------------------------------------------------------
sprite_load: ; sprite_load(const u8*)->void
; 413, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0ade : a0 00 __ LDY #$00
.l5:
0ae0 : b1 0d __ LDA (P0),y ; (data + 0)
0ae2 : 99 00 20 STA $2000,y ; (_art_07_r1[0] + 5)
0ae5 : c8 __ __ INY
0ae6 : c0 3f __ CPY #$3f
0ae8 : d0 f6 __ BNE $0ae0 ; (sprite_load.l5 + 0)
.s6:
0aea : a9 00 __ LDA #$00
0aec : 8d 3f 20 STA $203f ; (_art_10_r4[0] + 5)
.s3:
0aef : 60 __ __ RTS
--------------------------------------------------------------------
draw_year: ; draw_year(u8,u8)->void
; 451, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0af0 : a9 42 __ LDA #$42
0af2 : 8d f6 9f STA $9ff6 ; (rows[0] + 0)
0af5 : a9 19 __ LDA #$19
0af7 : 8d f7 9f STA $9ff7 ; (rows[0] + 1)
0afa : a9 54 __ LDA #$54
0afc : 8d f8 9f STA $9ff8 ; (rows[0] + 2)
0aff : a9 19 __ LDA #$19
0b01 : 8d f9 9f STA $9ff9 ; (rows[0] + 3)
0b04 : a9 66 __ LDA #$66
0b06 : 8d fa 9f STA $9ffa ; (rows[0] + 4)
0b09 : a9 19 __ LDA #$19
0b0b : 8d fb 9f STA $9ffb ; (rows[0] + 5)
0b0e : a9 78 __ LDA #$78
0b10 : 8d fc 9f STA $9ffc ; (rows[0] + 6)
0b13 : a9 19 __ LDA #$19
0b15 : 8d fd 9f STA $9ffd ; (rows[0] + 7)
0b18 : a9 8a __ LDA #$8a
0b1a : 8d fe 9f STA $9ffe ; (rows[0] + 8)
0b1d : a9 19 __ LDA #$19
0b1f : 8d ff 9f STA $9fff ; (rows[0] + 9)
0b22 : a2 00 __ LDX #$00
0b24 : 86 1f __ STX ADDR + 0 
0b26 : a9 eb __ LDA #$eb
0b28 : 85 1b __ STA ACCU + 0 
0b2a : a9 01 __ LDA #$01
0b2c : 85 1c __ STA ACCU + 1 
.l5:
0b2e : a5 1b __ LDA ACCU + 0 
0b30 : 85 43 __ STA T2 + 0 
0b32 : 18 __ __ CLC
0b33 : a5 1c __ LDA ACCU + 1 
0b35 : 69 04 __ ADC #$04
0b37 : 85 44 __ STA T2 + 1 
0b39 : 8a __ __ TXA
0b3a : 0a __ __ ASL
0b3b : a8 __ __ TAY
0b3c : b9 f6 9f LDA $9ff6,y ; (rows[0] + 0)
0b3f : 85 45 __ STA T3 + 0 
0b41 : b9 f7 9f LDA $9ff7,y ; (rows[0] + 1)
0b44 : 85 46 __ STA T3 + 1 
0b46 : a0 00 __ LDY #$00
0b48 : 84 1d __ STY ACCU + 2 
0b4a : 18 __ __ CLC
.l8:
0b4b : b1 45 __ LDA (T3 + 0),y 
0b4d : a0 00 __ LDY #$00
0b4f : 91 43 __ STA (T2 + 0),y 
0b51 : a5 44 __ LDA T2 + 1 
0b53 : 69 d4 __ ADC #$d4
0b55 : 85 20 __ STA ADDR + 1 
0b57 : a9 01 __ LDA #$01
0b59 : a4 43 __ LDY T2 + 0 
0b5b : 91 1f __ STA (ADDR + 0),y 
0b5d : 98 __ __ TYA
0b5e : 18 __ __ CLC
0b5f : 69 01 __ ADC #$01
0b61 : 85 43 __ STA T2 + 0 
0b63 : 90 02 __ BCC $0b67 ; (draw_year.s10 + 0)
.s9:
0b65 : e6 44 __ INC T2 + 1 
.s10:
0b67 : e6 1d __ INC ACCU + 2 
0b69 : a4 1d __ LDY ACCU + 2 
0b6b : c0 12 __ CPY #$12
0b6d : 90 dc __ BCC $0b4b ; (draw_year.l8 + 0)
.s6:
0b6f : a5 1b __ LDA ACCU + 0 
0b71 : 69 27 __ ADC #$27
0b73 : 85 1b __ STA ACCU + 0 
0b75 : a5 1c __ LDA ACCU + 1 
0b77 : 69 00 __ ADC #$00
0b79 : 85 1c __ STA ACCU + 1 
0b7b : e8 __ __ INX
0b7c : c9 02 __ CMP #$02
0b7e : d0 ae __ BNE $0b2e ; (draw_year.l5 + 0)
.s7:
0b80 : a5 1b __ LDA ACCU + 0 
0b82 : c9 b3 __ CMP #$b3
0b84 : d0 a8 __ BNE $0b2e ; (draw_year.l5 + 0)
.s3:
0b86 : 60 __ __ RTS
--------------------------------------------------------------------
hline: ; hline(u8,u8,u8)->void
;  92, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0b87 : 85 0d __ STA P0 ; (row + 0)
0b89 : 0a __ __ ASL
0b8a : 0a __ __ ASL
0b8b : 65 0d __ ADC P0 ; (row + 0)
0b8d : 0a __ __ ASL
0b8e : 0a __ __ ASL
0b8f : 85 1b __ STA ACCU + 0 
0b91 : a9 01 __ LDA #$01
0b93 : 2a __ __ ROL
0b94 : 06 1b __ ASL ACCU + 0 
0b96 : 2a __ __ ROL
0b97 : 85 1c __ STA ACCU + 1 
0b99 : a5 1b __ LDA ACCU + 0 
0b9b : 09 02 __ ORA #$02
0b9d : a8 __ __ TAY
0b9e : a9 00 __ LDA #$00
0ba0 : 85 1f __ STA ADDR + 0 
0ba2 : 85 1b __ STA ACCU + 0 
0ba4 : a2 24 __ LDX #$24
.l5:
0ba6 : a9 2d __ LDA #$2d
0ba8 : 91 1b __ STA (ACCU + 0),y 
0baa : 18 __ __ CLC
0bab : a5 1c __ LDA ACCU + 1 
0bad : 69 d4 __ ADC #$d4
0baf : 85 20 __ STA ADDR + 1 
0bb1 : a9 0b __ LDA #$0b
0bb3 : 91 1f __ STA (ADDR + 0),y 
0bb5 : c8 __ __ INY
0bb6 : d0 02 __ BNE $0bba ; (hline.s7 + 0)
.s6:
0bb8 : e6 1c __ INC ACCU + 1 
.s7:
0bba : ca __ __ DEX
0bbb : d0 e9 __ BNE $0ba6 ; (hline.l5 + 0)
.s3:
0bbd : 60 __ __ RTS
--------------------------------------------------------------------
pcenter@proxy: ; pcenter@proxy
0bbe : a9 0b __ LDA #$0b
0bc0 : 85 11 __ STA P4 
--------------------------------------------------------------------
pcenter: ; pcenter(u8,const u8*,u8)->void
;  76, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0bc2 : 18 __ __ CLC
0bc3 : a5 0f __ LDA P2 ; (s + 0)
0bc5 : 69 01 __ ADC #$01
0bc7 : 85 1b __ STA ACCU + 0 
0bc9 : a5 10 __ LDA P3 ; (s + 1)
0bcb : 69 00 __ ADC #$00
0bcd : 85 1c __ STA ACCU + 1 
0bcf : a0 00 __ LDY #$00
0bd1 : 84 43 __ STY T2 + 0 
0bd3 : b1 0f __ LDA (P2),y ; (s + 0)
0bd5 : f0 0d __ BEQ $0be4 ; (pcenter.s5 + 0)
.l6:
0bd7 : e6 43 __ INC T2 + 0 
0bd9 : b1 1b __ LDA (ACCU + 0),y 
0bdb : aa __ __ TAX
0bdc : c8 __ __ INY
0bdd : d0 02 __ BNE $0be1 ; (pcenter.s8 + 0)
.s7:
0bdf : e6 1c __ INC ACCU + 1 
.s8:
0be1 : 8a __ __ TXA
0be2 : d0 f3 __ BNE $0bd7 ; (pcenter.l6 + 0)
.s5:
0be4 : 38 __ __ SEC
0be5 : a9 28 __ LDA #$28
0be7 : e5 43 __ SBC T2 + 0 
0be9 : 6a __ __ ROR
0bea : 49 80 __ EOR #$80
0bec : 85 0e __ STA P1 
--------------------------------------------------------------------
pat: ; pat(u8,u8,const u8*,u8)->void
;  65, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0bee : a0 00 __ LDY #$00
0bf0 : b1 0f __ LDA (P2),y ; (s + 0)
0bf2 : f0 55 __ BEQ $0c49 ; (pat.s3 + 0)
.s5:
0bf4 : 84 1f __ STY ADDR + 0 
0bf6 : a5 0d __ LDA P0 ; (row + 0)
0bf8 : 0a __ __ ASL
0bf9 : 85 1b __ STA ACCU + 0 
0bfb : 98 __ __ TYA
0bfc : 2a __ __ ROL
0bfd : 06 1b __ ASL ACCU + 0 
0bff : 2a __ __ ROL
0c00 : aa __ __ TAX
0c01 : 18 __ __ CLC
0c02 : a5 1b __ LDA ACCU + 0 
0c04 : 65 0d __ ADC P0 ; (row + 0)
0c06 : 85 1b __ STA ACCU + 0 
0c08 : 8a __ __ TXA
0c09 : 69 00 __ ADC #$00
0c0b : 06 1b __ ASL ACCU + 0 
0c0d : 2a __ __ ROL
0c0e : 06 1b __ ASL ACCU + 0 
0c10 : 2a __ __ ROL
0c11 : 06 1b __ ASL ACCU + 0 
0c13 : 2a __ __ ROL
0c14 : aa __ __ TAX
0c15 : 18 __ __ CLC
0c16 : a5 1b __ LDA ACCU + 0 
0c18 : 65 0e __ ADC P1 ; (col + 0)
0c1a : 85 1b __ STA ACCU + 0 
0c1c : 8a __ __ TXA
0c1d : 69 04 __ ADC #$04
0c1f : 85 1c __ STA ACCU + 1 
0c21 : b1 0f __ LDA (P2),y ; (s + 0)
0c23 : a6 11 __ LDX P4 ; (fg + 0)
.l6:
0c25 : 91 1b __ STA (ACCU + 0),y 
0c27 : 18 __ __ CLC
0c28 : a5 1c __ LDA ACCU + 1 
0c2a : 69 d4 __ ADC #$d4
0c2c : 85 20 __ STA ADDR + 1 
0c2e : 8a __ __ TXA
0c2f : a4 1b __ LDY ACCU + 0 
0c31 : 91 1f __ STA (ADDR + 0),y 
0c33 : 98 __ __ TYA
0c34 : 18 __ __ CLC
0c35 : 69 01 __ ADC #$01
0c37 : 85 1b __ STA ACCU + 0 
0c39 : 90 02 __ BCC $0c3d ; (pat.s8 + 0)
.s7:
0c3b : e6 1c __ INC ACCU + 1 
.s8:
0c3d : e6 0f __ INC P2 ; (s + 0)
0c3f : d0 02 __ BNE $0c43 ; (pat.s10 + 0)
.s9:
0c41 : e6 10 __ INC P3 ; (s + 1)
.s10:
0c43 : a0 00 __ LDY #$00
0c45 : b1 0f __ LDA (P2),y ; (s + 0)
0c47 : d0 dc __ BNE $0c25 ; (pat.l6 + 0)
.s3:
0c49 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_init: ; scroll_init()->void
; 251, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0c4a : a9 00 __ LDA #$00
0c4c : 8d c3 19 STA $19c3 ; (scroll_tick + 0)
0c4f : 8d c1 19 STA $19c1 ; (scroll_idx + 0)
0c52 : 8d c2 19 STA $19c2 ; (scroll_idx + 1)
0c55 : a9 20 __ LDA #$20
0c57 : a2 27 __ LDX #$27
.l5:
0c59 : 9d 87 29 STA $2987,x ; (scroll_buf[0] + 0)
0c5c : ca __ __ DEX
0c5d : 10 fa __ BPL $0c59 ; (scroll_init.l5 + 0)
.s3:
0c5f : 60 __ __ RTS
--------------------------------------------------------------------
wait_frame: ; wait_frame()->void
; 118, "C:/code/jonas/c64Demo/nineteen84.c"
.l4:
0c60 : ad 12 d0 LDA $d012 
0c63 : c9 fa __ CMP #$fa
0c65 : 90 f9 __ BCC $0c60 ; (wait_frame.l4 + 0)
.l5:
0c67 : ad 12 d0 LDA $d012 
0c6a : c9 fa __ CMP #$fa
0c6c : b0 f9 __ BCS $0c67 ; (wait_frame.l5 + 0)
.s3:
0c6e : 60 __ __ RTS
--------------------------------------------------------------------
scroll_step: ; scroll_step()->void
; 259, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0c6f : ee c3 19 INC $19c3 ; (scroll_tick + 0)
0c72 : ad c3 19 LDA $19c3 ; (scroll_tick + 0)
0c75 : c9 0c __ CMP #$0c
0c77 : 90 3d __ BCC $0cb6 ; (scroll_step.s3 + 0)
.s5:
0c79 : a0 00 __ LDY #$00
0c7b : 8c c3 19 STY $19c3 ; (scroll_tick + 0)
.l7:
0c7e : b9 88 29 LDA $2988,y ; (scroll_buf[0] + 1)
0c81 : 99 87 29 STA $2987,y ; (scroll_buf[0] + 0)
0c84 : c8 __ __ INY
0c85 : c0 27 __ CPY #$27
0c87 : d0 f5 __ BNE $0c7e ; (scroll_step.l7 + 0)
.s8:
0c89 : ae c1 19 LDX $19c1 ; (scroll_idx + 0)
0c8c : ee c1 19 INC $19c1 ; (scroll_idx + 0)
0c8f : a0 00 __ LDY #$00
0c91 : 8c c2 19 STY $19c2 ; (scroll_idx + 1)
0c94 : bd 00 1a LDA $1a00,x ; (scroll_text[0] + 0)
0c97 : c9 ff __ CMP #$ff
0c99 : d0 08 __ BNE $0ca3 ; (scroll_step.s10 + 0)
.s6:
0c9b : 8c c1 19 STY $19c1 ; (scroll_idx + 0)
0c9e : 8c c2 19 STY $19c2 ; (scroll_idx + 1)
0ca1 : a9 20 __ LDA #$20
.s10:
0ca3 : 8d ae 29 STA $29ae ; (scroll_buf[0] + 39)
.l9:
0ca6 : b9 87 29 LDA $2987,y ; (scroll_buf[0] + 0)
0ca9 : 99 c0 07 STA $07c0,y 
0cac : a9 0d __ LDA #$0d
0cae : 99 c0 db STA $dbc0,y 
0cb1 : c8 __ __ INY
0cb2 : c0 28 __ CPY #$28
0cb4 : d0 f0 __ BNE $0ca6 ; (scroll_step.l9 + 0)
.s3:
0cb6 : 60 __ __ RTS
--------------------------------------------------------------------
blink_row: ; blink_row(u8,u8)->void
; 198, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0cb7 : a5 0f __ LDA P2 ; (row + 0)
0cb9 : 85 0d __ STA P0 
0cbb : ee c4 19 INC $19c4 ; (blink_cnt + 0)
0cbe : ad c4 19 LDA $19c4 ; (blink_cnt + 0)
0cc1 : c9 19 __ CMP #$19
0cc3 : 90 19 __ BCC $0cde ; (blink_row.s5 + 0)
.s8:
0cc5 : a9 00 __ LDA #$00
0cc7 : 8d c4 19 STA $19c4 ; (blink_cnt + 0)
0cca : cd c5 19 CMP $19c5 ; (blink_phase + 0)
0ccd : 2a __ __ ROL
0cce : 8d c5 19 STA $19c5 ; (blink_phase + 0)
0cd1 : f0 04 __ BEQ $0cd7 ; (blink_row.s6 + 0)
.s7:
0cd3 : a5 10 __ LDA P3 ; (fg + 0)
0cd5 : 90 02 __ BCC $0cd9 ; (blink_row.s9 + 0)
.s6:
0cd7 : a9 00 __ LDA #$00
.s9:
0cd9 : 85 0e __ STA P1 
0cdb : 4c e5 0c JMP $0ce5 ; (rowcol.s4 + 0)
.s5:
0cde : ad c5 19 LDA $19c5 ; (blink_phase + 0)
0ce1 : f0 f4 __ BEQ $0cd7 ; (blink_row.s6 + 0)
0ce3 : d0 ee __ BNE $0cd3 ; (blink_row.s7 + 0)
--------------------------------------------------------------------
rowcol: ; rowcol(u8,u8)->void
;  85, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0ce5 : a5 0d __ LDA P0 ; (row + 0)
0ce7 : 0a __ __ ASL
0ce8 : 85 1b __ STA ACCU + 0 
0cea : a9 00 __ LDA #$00
0cec : 2a __ __ ROL
0ced : 06 1b __ ASL ACCU + 0 
0cef : 2a __ __ ROL
0cf0 : aa __ __ TAX
0cf1 : a5 1b __ LDA ACCU + 0 
0cf3 : 65 0d __ ADC P0 ; (row + 0)
0cf5 : 85 1b __ STA ACCU + 0 
0cf7 : 8a __ __ TXA
0cf8 : 69 00 __ ADC #$00
0cfa : 06 1b __ ASL ACCU + 0 
0cfc : 2a __ __ ROL
0cfd : 06 1b __ ASL ACCU + 0 
0cff : 2a __ __ ROL
0d00 : 06 1b __ ASL ACCU + 0 
0d02 : 2a __ __ ROL
0d03 : 69 d8 __ ADC #$d8
0d05 : 85 1c __ STA ACCU + 1 
0d07 : a5 0e __ LDA P1 ; (fg + 0)
0d09 : a0 27 __ LDY #$27
.l5:
0d0b : 91 1b __ STA (ACCU + 0),y 
0d0d : 88 __ __ DEY
0d0e : 10 fb __ BPL $0d0b ; (rowcol.l5 + 0)
.s3:
0d10 : 60 __ __ RTS
--------------------------------------------------------------------
any_key: ; any_key()->u8
; 141, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0d11 : a9 7f __ LDA #$7f
0d13 : 8d 00 dc STA $dc00 
0d16 : ad 01 dc LDA $dc01 
0d19 : 29 10 __ AND #$10
0d1b : f0 0b __ BEQ $0d28 ; (any_key.s5 + 0)
.s6:
0d1d : a9 fd __ LDA #$fd
0d1f : 8d 00 dc STA $dc00 
0d22 : ad 01 dc LDA $dc01 
0d25 : 4a __ __ LSR
0d26 : b0 08 __ BCS $0d30 ; (any_key.s7 + 0)
.s5:
0d28 : a9 ff __ LDA #$ff
0d2a : 8d 00 dc STA $dc00 
.s10:
0d2d : a9 01 __ LDA #$01
.s3:
0d2f : 60 __ __ RTS
.s7:
0d30 : a9 fe __ LDA #$fe
0d32 : 8d 00 dc STA $dc00 
0d35 : ad 01 dc LDA $dc01 
0d38 : 29 10 __ AND #$10
0d3a : a2 ff __ LDX #$ff
0d3c : 8e 00 dc STX $dc00 
0d3f : aa __ __ TAX
0d40 : f0 eb __ BEQ $0d2d ; (any_key.s10 + 0)
.s8:
0d42 : ad 00 dc LDA $dc00 
0d45 : 29 10 __ AND #$10
0d47 : f0 e4 __ BEQ $0d2d ; (any_key.s10 + 0)
.s9:
0d49 : a9 00 __ LDA #$00
0d4b : 60 __ __ RTS
--------------------------------------------------------------------
fade_to_black: ; fade_to_black()->void
; 207, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0d4c : a9 00 __ LDA #$00
0d4e : 85 0e __ STA P1 
0d50 : 85 0d __ STA P0 
.l6:
0d52 : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
0d55 : 20 e5 0c JSR $0ce5 ; (rowcol.s4 + 0)
0d58 : e6 0d __ INC P0 
0d5a : a5 0d __ LDA P0 
0d5c : c9 19 __ CMP #$19
0d5e : 90 f2 __ BCC $0d52 ; (fade_to_black.l6 + 0)
.s5:
0d60 : a9 00 __ LDA #$00
0d62 : 8d 20 d0 STA $d020 
0d65 : 8d 21 d0 STA $d021 
.s3:
0d68 : 60 __ __ RTS
--------------------------------------------------------------------
scene2_run: ; scene2_run()->void
; 714, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0d69 : a9 01 __ LDA #$01
0d6b : 85 0d __ STA P0 
0d6d : a9 0b __ LDA #$0b
0d6f : 85 11 __ STA P4 
0d71 : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
0d74 : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
0d77 : a9 d0 __ LDA #$d0
0d79 : 85 0f __ STA P2 
0d7b : a9 19 __ LDA #$19
0d7d : 85 10 __ STA P3 
0d7f : 20 c2 0b JSR $0bc2 ; (pcenter.s4 + 0)
0d82 : a9 02 __ LDA #$02
0d84 : 20 87 0b JSR $0b87 ; (hline.s4 + 0)
0d87 : a9 0a __ LDA #$0a
0d89 : 85 0d __ STA P0 
0d8b : a9 19 __ LDA #$19
0d8d : 85 10 __ STA P3 
0d8f : a9 de __ LDA #$de
0d91 : 85 0f __ STA P2 
0d93 : 20 df 18 JSR $18df ; (pat@proxy + 0)
0d96 : a9 0c __ LDA #$0c
0d98 : 85 0d __ STA P0 
0d9a : a9 19 __ LDA #$19
0d9c : 85 10 __ STA P3 
0d9e : a9 e5 __ LDA #$e5
0da0 : 85 0f __ STA P2 
0da2 : 20 ee 0b JSR $0bee ; (pat.s4 + 0)
0da5 : a9 0e __ LDA #$0e
0da7 : 85 0d __ STA P0 
0da9 : a9 19 __ LDA #$19
0dab : 85 10 __ STA P3 
0dad : a9 ef __ LDA #$ef
0daf : 85 0f __ STA P2 
0db1 : 20 ee 0b JSR $0bee ; (pat.s4 + 0)
0db4 : a9 10 __ LDA #$10
0db6 : 20 87 0b JSR $0b87 ; (hline.s4 + 0)
0db9 : a9 0a __ LDA #$0a
0dbb : 85 0f __ STA P2 
0dbd : a9 1b __ LDA #$1b
0dbf : 85 15 __ STA P8 
0dc1 : a9 06 __ LDA #$06
0dc3 : 85 10 __ STA P3 
0dc5 : a9 00 __ LDA #$00
0dc7 : 85 11 __ STA P4 
0dc9 : a9 00 __ LDA #$00
0dcb : 85 0d __ STA P0 
0dcd : a9 2a __ LDA #$2a
0dcf : 85 0e __ STA P1 
0dd1 : a9 e4 __ LDA #$e4
0dd3 : 85 12 __ STA P5 
0dd5 : a9 1a __ LDA #$1a
0dd7 : 85 13 __ STA P6 
0dd9 : a9 7e __ LDA #$7e
0ddb : 85 14 __ STA P7 
0ddd : 20 7c 0f JSR $0f7c ; (scroller_init.s4 + 0)
0de0 : e6 11 __ INC P4 
0de2 : a9 0c __ LDA #$0c
0de4 : 85 0f __ STA P2 
0de6 : a9 33 __ LDA #$33
0de8 : 85 0d __ STA P0 
0dea : a9 1c __ LDA #$1c
0dec : 85 15 __ STA P8 
0dee : a9 2a __ LDA #$2a
0df0 : 85 0e __ STA P1 
0df2 : a9 d8 __ LDA #$d8
0df4 : 85 12 __ STA P5 
0df6 : a9 1b __ LDA #$1b
0df8 : 85 13 __ STA P6 
0dfa : a9 00 __ LDA #$00
0dfc : 85 14 __ STA P7 
0dfe : 20 7c 0f JSR $0f7c ; (scroller_init.s4 + 0)
0e01 : c6 11 __ DEC P4 
0e03 : a9 0e __ LDA #$0e
0e05 : 85 0f __ STA P2 
0e07 : a9 0a __ LDA #$0a
0e09 : 85 10 __ STA P3 
0e0b : a9 66 __ LDA #$66
0e0d : 85 0d __ STA P0 
0e0f : a9 1c __ LDA #$1c
0e11 : 85 15 __ STA P8 
0e13 : a9 2a __ LDA #$2a
0e15 : 85 0e __ STA P1 
0e17 : a9 e8 __ LDA #$e8
0e19 : 85 12 __ STA P5 
0e1b : a9 1b __ LDA #$1b
0e1d : 85 13 __ STA P6 
0e1f : a9 61 __ LDA #$61
0e21 : 85 14 __ STA P7 
0e23 : 20 7c 0f JSR $0f7c ; (scroller_init.s4 + 0)
0e26 : a9 00 __ LDA #$00
0e28 : 85 4b __ STA T5 + 0 
0e2a : 8d c5 19 STA $19c5 ; (blink_phase + 0)
0e2d : 8d c4 19 STA $19c4 ; (blink_cnt + 0)
0e30 : 85 48 __ STA T2 + 0 
0e32 : 85 47 __ STA T1 + 0 
0e34 : a9 02 __ LDA #$02
0e36 : 85 49 __ STA T3 + 0 
0e38 : 85 4a __ STA T4 + 0 
.l5:
0e3a : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
0e3d : a9 00 __ LDA #$00
0e3f : 85 0d __ STA P0 
0e41 : a9 2a __ LDA #$2a
0e43 : 85 0e __ STA P1 
0e45 : 20 ba 0f JSR $0fba ; (scroller_step.s4 + 0)
0e48 : a9 33 __ LDA #$33
0e4a : 85 0d __ STA P0 
0e4c : a9 2a __ LDA #$2a
0e4e : 85 0e __ STA P1 
0e50 : 20 ba 0f JSR $0fba ; (scroller_step.s4 + 0)
0e53 : a9 66 __ LDA #$66
0e55 : 85 0d __ STA P0 
0e57 : a9 2a __ LDA #$2a
0e59 : 85 0e __ STA P1 
0e5b : 20 ba 0f JSR $0fba ; (scroller_step.s4 + 0)
0e5e : 20 b2 10 JSR $10b2 ; (scroller_crossflash.s4 + 0)
0e61 : e6 48 __ INC T2 + 0 
0e63 : a4 47 __ LDY T1 + 0 
0e65 : c0 04 __ CPY #$04
0e67 : 90 03 __ BCC $0e6c ; (scene2_run.s8 + 0)
0e69 : 4c 29 0f JMP $0f29 ; (scene2_run.s6 + 0)
.s8:
0e6c : b9 96 18 LDA $1896,y ; (__multab100L + 0)
0e6f : 69 50 __ ADC #$50
0e71 : c5 48 __ CMP T2 + 0 
0e73 : 90 02 __ BCC $0e77 ; (scene2_run.s9 + 0)
.s19:
0e75 : d0 c3 __ BNE $0e3a ; (scene2_run.l5 + 0)
.s9:
0e77 : 98 __ __ TYA
0e78 : d0 37 __ BNE $0eb1 ; (scene2_run.s11 + 0)
.s10:
0e7a : a5 49 __ LDA T3 + 0 
0e7c : 85 11 __ STA P4 
0e7e : a9 12 __ LDA #$12
0e80 : 85 0d __ STA P0 
0e82 : a9 02 __ LDA #$02
0e84 : 85 10 __ STA P3 
0e86 : a9 f8 __ LDA #$f8
0e88 : 85 12 __ STA P5 
0e8a : a9 19 __ LDA #$19
0e8c : 85 13 __ STA P6 
0e8e : 20 2a 11 JSR $112a ; (reveal_word.s4 + 0)
0e91 : 85 49 __ STA T3 + 0 
0e93 : a5 4a __ LDA T4 + 0 
0e95 : 85 11 __ STA P4 
0e97 : a9 14 __ LDA #$14
0e99 : 85 0d __ STA P0 
0e9b : a9 0a __ LDA #$0a
0e9d : 85 10 __ STA P3 
0e9f : a9 ba __ LDA #$ba
0ea1 : 85 12 __ STA P5 
0ea3 : a9 1c __ LDA #$1c
0ea5 : 85 13 __ STA P6 
0ea7 : 20 2a 11 JSR $112a ; (reveal_word.s4 + 0)
0eaa : 85 4a __ STA T4 + 0 
0eac : a9 01 __ LDA #$01
0eae : 4c 77 0f JMP $0f77 ; (scene2_run.s18 + 0)
.s11:
0eb1 : c9 01 __ CMP #$01
0eb3 : d0 31 __ BNE $0ee6 ; (scene2_run.s12 + 0)
.s17:
0eb5 : 20 16 11 JSR $1116 ; (reveal_word@proxy + 0)
0eb8 : 85 11 __ STA P4 
0eba : a9 03 __ LDA #$03
0ebc : 85 10 __ STA P3 
0ebe : a9 1a __ LDA #$1a
0ec0 : 85 13 __ STA P6 
0ec2 : a9 f4 __ LDA #$f4
0ec4 : 85 12 __ STA P5 
0ec6 : 20 2a 11 JSR $112a ; (reveal_word.s4 + 0)
0ec9 : 85 49 __ STA T3 + 0 
0ecb : 20 c8 18 JSR $18c8 ; (reveal_word@proxy + 0)
0ece : 85 11 __ STA P4 
0ed0 : a9 0e __ LDA #$0e
0ed2 : 85 10 __ STA P3 
0ed4 : a9 1b __ LDA #$1b
0ed6 : 85 13 __ STA P6 
0ed8 : a9 f8 __ LDA #$f8
0eda : 85 12 __ STA P5 
0edc : 20 2a 11 JSR $112a ; (reveal_word.s4 + 0)
0edf : 85 4a __ STA T4 + 0 
0ee1 : a9 02 __ LDA #$02
0ee3 : 4c 77 0f JMP $0f77 ; (scene2_run.s18 + 0)
.s12:
0ee6 : c9 02 __ CMP #$02
0ee8 : d0 30 __ BNE $0f1a ; (scene2_run.s13 + 0)
.s16:
0eea : 20 16 11 JSR $1116 ; (reveal_word@proxy + 0)
0eed : 85 11 __ STA P4 
0eef : a9 0d __ LDA #$0d
0ef1 : 85 10 __ STA P3 
0ef3 : a9 1c __ LDA #$1c
0ef5 : 85 13 __ STA P6 
0ef7 : a9 c7 __ LDA #$c7
0ef9 : 85 12 __ STA P5 
0efb : 20 2a 11 JSR $112a ; (reveal_word.s4 + 0)
0efe : 85 49 __ STA T3 + 0 
0f00 : 20 c8 18 JSR $18c8 ; (reveal_word@proxy + 0)
0f03 : 85 11 __ STA P4 
0f05 : a9 07 __ LDA #$07
0f07 : 85 10 __ STA P3 
0f09 : a9 1a __ LDA #$1a
0f0b : 85 13 __ STA P6 
0f0d : a9 fc __ LDA #$fc
0f0f : 85 12 __ STA P5 
0f11 : 20 2a 11 JSR $112a ; (reveal_word.s4 + 0)
0f14 : 85 4a __ STA T4 + 0 
0f16 : a9 03 __ LDA #$03
0f18 : d0 5d __ BNE $0f77 ; (scene2_run.s18 + 0)
.s13:
0f1a : c9 03 __ CMP #$03
0f1c : f0 28 __ BEQ $0f46 ; (scene2_run.s15 + 0)
.s14:
0f1e : e6 47 __ INC T1 + 0 
0f20 : a5 47 __ LDA T1 + 0 
0f22 : c9 04 __ CMP #$04
0f24 : b0 03 __ BCS $0f29 ; (scene2_run.s6 + 0)
0f26 : 4c 3a 0e JMP $0e3a ; (scene2_run.l5 + 0)
.s6:
0f29 : e6 4b __ INC T5 + 0 
0f2b : a5 4b __ LDA T5 + 0 
0f2d : c9 96 __ CMP #$96
0f2f : 90 f5 __ BCC $0f26 ; (scene2_run.s14 + 8)
.s7:
0f31 : a9 05 __ LDA #$05
0f33 : 85 0d __ STA P0 
0f35 : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
0f38 : a9 00 __ LDA #$00
0f3a : 8d 20 d0 STA $d020 
0f3d : 8d 21 d0 STA $d021 
0f40 : 20 0b 0a JSR $0a0b ; (glitch_transition.s4 + 0)
0f43 : 4c fb 18 JMP $18fb ; (wait_frames@proxy + 0)
.s15:
0f46 : 20 16 11 JSR $1116 ; (reveal_word@proxy + 0)
0f49 : 85 11 __ STA P4 
0f4b : a9 08 __ LDA #$08
0f4d : 85 10 __ STA P3 
0f4f : a9 1c __ LDA #$1c
0f51 : 85 13 __ STA P6 
0f53 : a9 d0 __ LDA #$d0
0f55 : 85 12 __ STA P5 
0f57 : 20 2a 11 JSR $112a ; (reveal_word.s4 + 0)
0f5a : 85 49 __ STA T3 + 0 
0f5c : 20 c8 18 JSR $18c8 ; (reveal_word@proxy + 0)
0f5f : 85 11 __ STA P4 
0f61 : a9 04 __ LDA #$04
0f63 : 85 47 __ STA T1 + 0 
0f65 : 85 10 __ STA P3 
0f67 : a9 d9 __ LDA #$d9
0f69 : 85 12 __ STA P5 
0f6b : a9 1c __ LDA #$1c
0f6d : 85 13 __ STA P6 
0f6f : 20 2a 11 JSR $112a ; (reveal_word.s4 + 0)
0f72 : 85 4a __ STA T4 + 0 
0f74 : 4c 29 0f JMP $0f29 ; (scene2_run.s6 + 0)
.s18:
0f77 : 85 47 __ STA T1 + 0 
0f79 : 4c 3a 0e JMP $0e3a ; (scene2_run.l5 + 0)
--------------------------------------------------------------------
scroller_init: ; scroller_init(struct S#13003*,u8,u8,u8,const u8*,const u8*)->void
; 598, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0f7c : a9 00 __ LDA #$00
0f7e : a0 28 __ LDY #$28
0f80 : 91 0d __ STA (P0),y ; (s + 0)
0f82 : c8 __ __ INY
0f83 : 91 0d __ STA (P0),y ; (s + 0)
0f85 : c8 __ __ INY
0f86 : 91 0d __ STA (P0),y ; (s + 0)
0f88 : a5 10 __ LDA P3 ; (speed + 0)
0f8a : c8 __ __ INY
0f8b : 91 0d __ STA (P0),y ; (s + 0)
0f8d : a9 00 __ LDA #$00
0f8f : c8 __ __ INY
0f90 : 91 0d __ STA (P0),y ; (s + 0)
0f92 : a5 11 __ LDA P4 ; (dir + 0)
0f94 : c8 __ __ INY
0f95 : 91 0d __ STA (P0),y ; (s + 0)
0f97 : a5 0f __ LDA P2 ; (row + 0)
0f99 : c8 __ __ INY
0f9a : 91 0d __ STA (P0),y ; (s + 0)
0f9c : a5 12 __ LDA P5 ; (wave + 0)
0f9e : c8 __ __ INY
0f9f : 91 0d __ STA (P0),y ; (s + 0)
0fa1 : a5 13 __ LDA P6 ; (wave + 1)
0fa3 : c8 __ __ INY
0fa4 : 91 0d __ STA (P0),y ; (s + 0)
0fa6 : a5 14 __ LDA P7 ; (msg + 0)
0fa8 : c8 __ __ INY
0fa9 : 91 0d __ STA (P0),y ; (s + 0)
0fab : a5 15 __ LDA P8 ; (msg + 1)
0fad : c8 __ __ INY
0fae : 91 0d __ STA (P0),y ; (s + 0)
0fb0 : a9 20 __ LDA #$20
0fb2 : a0 27 __ LDY #$27
.l5:
0fb4 : 91 0d __ STA (P0),y ; (s + 0)
0fb6 : 88 __ __ DEY
0fb7 : 10 fb __ BPL $0fb4 ; (scroller_init.l5 + 0)
.s3:
0fb9 : 60 __ __ RTS
--------------------------------------------------------------------
scroller_step: ; scroller_step(struct S#13003*)->void
; 613, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0fba : 18 __ __ CLC
0fbb : a0 2a __ LDY #$2a
0fbd : b1 0d __ LDA (P0),y ; (s + 0)
0fbf : 69 01 __ ADC #$01
0fc1 : 91 0d __ STA (P0),y ; (s + 0)
0fc3 : c8 __ __ INY
0fc4 : d1 0d __ CMP (P0),y ; (s + 0)
0fc6 : 90 5b __ BCC $1023 ; (scroller_step.s5 + 0)
.s10:
0fc8 : a9 00 __ LDA #$00
0fca : 88 __ __ DEY
0fcb : 91 0d __ STA (P0),y ; (s + 0)
0fcd : a0 28 __ LDY #$28
0fcf : b1 0d __ LDA (P0),y ; (s + 0)
0fd1 : 85 1b __ STA ACCU + 0 
0fd3 : 69 00 __ ADC #$00
0fd5 : 91 0d __ STA (P0),y ; (s + 0)
0fd7 : c8 __ __ INY
0fd8 : b1 0d __ LDA (P0),y ; (s + 0)
0fda : 85 1c __ STA ACCU + 1 
0fdc : 69 00 __ ADC #$00
0fde : 91 0d __ STA (P0),y ; (s + 0)
0fe0 : a0 31 __ LDY #$31
0fe2 : b1 0d __ LDA (P0),y ; (s + 0)
0fe4 : 85 43 __ STA T2 + 0 
0fe6 : 18 __ __ CLC
0fe7 : 65 1b __ ADC ACCU + 0 
0fe9 : 85 1b __ STA ACCU + 0 
0feb : c8 __ __ INY
0fec : b1 0d __ LDA (P0),y ; (s + 0)
0fee : 85 44 __ STA T2 + 1 
0ff0 : 65 1c __ ADC ACCU + 1 
0ff2 : 85 1c __ STA ACCU + 1 
0ff4 : a0 00 __ LDY #$00
0ff6 : b1 1b __ LDA (ACCU + 0),y 
0ff8 : aa __ __ TAX
0ff9 : e0 ff __ CPX #$ff
0ffb : d0 0c __ BNE $1009 ; (scroller_step.s11 + 0)
.s14:
0ffd : 98 __ __ TYA
0ffe : a0 28 __ LDY #$28
1000 : 91 0d __ STA (P0),y ; (s + 0)
1002 : c8 __ __ INY
1003 : 91 0d __ STA (P0),y ; (s + 0)
1005 : a8 __ __ TAY
1006 : b1 43 __ LDA (T2 + 0),y 
1008 : aa __ __ TAX
.s11:
1009 : a0 2d __ LDY #$2d
100b : b1 0d __ LDA (P0),y ; (s + 0)
100d : f0 03 __ BEQ $1012 ; (scroller_step.s12 + 0)
100f : 4c a3 10 JMP $10a3 ; (scroller_step.s13 + 0)
.s12:
1012 : a8 __ __ TAY
.l17:
1013 : c8 __ __ INY
1014 : b1 0d __ LDA (P0),y ; (s + 0)
1016 : 88 __ __ DEY
1017 : 91 0d __ STA (P0),y ; (s + 0)
1019 : c8 __ __ INY
101a : c0 27 __ CPY #$27
101c : 90 f5 __ BCC $1013 ; (scroller_step.l17 + 0)
.s18:
101e : 8a __ __ TXA
101f : a0 27 __ LDY #$27
.s19:
1021 : 91 0d __ STA (P0),y ; (s + 0)
.s5:
1023 : a0 2c __ LDY #$2c
1025 : b1 0d __ LDA (P0),y ; (s + 0)
1027 : 18 __ __ CLC
1028 : 69 01 __ ADC #$01
102a : 29 0f __ AND #$0f
102c : 91 0d __ STA (P0),y ; (s + 0)
102e : a0 2e __ LDY #$2e
1030 : b1 0d __ LDA (P0),y ; (s + 0)
1032 : 0a __ __ ASL
1033 : 85 1b __ STA ACCU + 0 
1035 : a9 00 __ LDA #$00
1037 : 2a __ __ ROL
1038 : 06 1b __ ASL ACCU + 0 
103a : 2a __ __ ROL
103b : aa __ __ TAX
103c : a5 1b __ LDA ACCU + 0 
103e : 71 0d __ ADC (P0),y ; (s + 0)
1040 : 85 1b __ STA ACCU + 0 
1042 : 8a __ __ TXA
1043 : 69 00 __ ADC #$00
1045 : 06 1b __ ASL ACCU + 0 
1047 : 2a __ __ ROL
1048 : 06 1b __ ASL ACCU + 0 
104a : 2a __ __ ROL
104b : 06 1b __ ASL ACCU + 0 
104d : 2a __ __ ROL
104e : 69 04 __ ADC #$04
1050 : 85 1c __ STA ACCU + 1 
1052 : c8 __ __ INY
1053 : b1 0d __ LDA (P0),y ; (s + 0)
1055 : 85 43 __ STA T2 + 0 
1057 : c8 __ __ INY
1058 : b1 0d __ LDA (P0),y ; (s + 0)
105a : 85 44 __ STA T2 + 1 
105c : a0 00 __ LDY #$00
.l6:
105e : 84 1e __ STY ACCU + 3 
1060 : b1 0d __ LDA (P0),y ; (s + 0)
1062 : a0 00 __ LDY #$00
1064 : 91 1b __ STA (ACCU + 0),y 
1066 : a0 2c __ LDY #$2c
1068 : b1 0d __ LDA (P0),y ; (s + 0)
106a : 85 1d __ STA ACCU + 2 
106c : c8 __ __ INY
106d : b1 0d __ LDA (P0),y ; (s + 0)
106f : d0 08 __ BNE $1079 ; (scroller_step.s9 + 0)
.s7:
1071 : 18 __ __ CLC
1072 : a5 1d __ LDA ACCU + 2 
1074 : 65 1e __ ADC ACCU + 3 
1076 : 4c 81 10 JMP $1081 ; (scroller_step.s8 + 0)
.s9:
1079 : 38 __ __ SEC
107a : a9 27 __ LDA #$27
107c : e5 1e __ SBC ACCU + 3 
107e : 18 __ __ CLC
107f : 65 1d __ ADC ACCU + 2 
.s8:
1081 : 29 0f __ AND #$0f
1083 : a8 __ __ TAY
1084 : a5 1b __ LDA ACCU + 0 
1086 : 85 1f __ STA ADDR + 0 
1088 : 18 __ __ CLC
1089 : a5 1c __ LDA ACCU + 1 
108b : 69 d4 __ ADC #$d4
108d : 85 20 __ STA ADDR + 1 
108f : b1 43 __ LDA (T2 + 0),y 
1091 : a0 00 __ LDY #$00
1093 : 91 1f __ STA (ADDR + 0),y 
1095 : e6 1b __ INC ACCU + 0 
1097 : d0 02 __ BNE $109b ; (scroller_step.s21 + 0)
.s20:
1099 : e6 1c __ INC ACCU + 1 
.s21:
109b : a4 1e __ LDY ACCU + 3 
109d : c8 __ __ INY
109e : c0 28 __ CPY #$28
10a0 : 90 bc __ BCC $105e ; (scroller_step.l6 + 0)
.s3:
10a2 : 60 __ __ RTS
.s13:
10a3 : a0 27 __ LDY #$27
.l15:
10a5 : 88 __ __ DEY
10a6 : b1 0d __ LDA (P0),y ; (s + 0)
10a8 : c8 __ __ INY
10a9 : 91 0d __ STA (P0),y ; (s + 0)
10ab : 88 __ __ DEY
10ac : d0 f7 __ BNE $10a5 ; (scroller_step.l15 + 0)
.s16:
10ae : 8a __ __ TXA
10af : 4c 21 10 JMP $1021 ; (scroller_step.s19 + 0)
--------------------------------------------------------------------
scroller_crossflash: ; scroller_crossflash()->void
; 649, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
10b2 : ad 14 2a LDA $2a14 ; (scr[0].buf[0] + 20)
10b5 : c9 20 __ CMP #$20
10b7 : f0 5c __ BEQ $1115 ; (scroller_crossflash.s3 + 0)
.s5:
10b9 : ad 46 2a LDA $2a46 ; (scr[0] + 70)
10bc : c9 20 __ CMP #$20
10be : f0 55 __ BEQ $1115 ; (scroller_crossflash.s3 + 0)
.s6:
10c0 : ad 61 2a LDA $2a61 ; (scr[0] + 97)
10c3 : 0a __ __ ASL
10c4 : 85 1b __ STA ACCU + 0 
10c6 : a9 00 __ LDA #$00
10c8 : 2a __ __ ROL
10c9 : 06 1b __ ASL ACCU + 0 
10cb : 2a __ __ ROL
10cc : aa __ __ TAX
10cd : a5 1b __ LDA ACCU + 0 
10cf : 6d 61 2a ADC $2a61 ; (scr[0] + 97)
10d2 : 85 43 __ STA T0 + 0 
10d4 : 8a __ __ TXA
10d5 : 69 00 __ ADC #$00
10d7 : 06 43 __ ASL T0 + 0 
10d9 : 2a __ __ ROL
10da : 06 43 __ ASL T0 + 0 
10dc : 2a __ __ ROL
10dd : 06 43 __ ASL T0 + 0 
10df : 2a __ __ ROL
10e0 : 69 d8 __ ADC #$d8
10e2 : 85 44 __ STA T0 + 1 
10e4 : ad 2e 2a LDA $2a2e ; (scr[0].row + 0)
10e7 : 0a __ __ ASL
10e8 : 85 1b __ STA ACCU + 0 
10ea : a9 00 __ LDA #$00
10ec : 2a __ __ ROL
10ed : 06 1b __ ASL ACCU + 0 
10ef : 2a __ __ ROL
10f0 : aa __ __ TAX
10f1 : a5 1b __ LDA ACCU + 0 
10f3 : 6d 2e 2a ADC $2a2e ; (scr[0].row + 0)
10f6 : 85 1b __ STA ACCU + 0 
10f8 : 8a __ __ TXA
10f9 : 69 00 __ ADC #$00
10fb : 06 1b __ ASL ACCU + 0 
10fd : 2a __ __ ROL
10fe : 06 1b __ ASL ACCU + 0 
1100 : 2a __ __ ROL
1101 : 06 1b __ ASL ACCU + 0 
1103 : 2a __ __ ROL
1104 : 69 d8 __ ADC #$d8
1106 : 85 1c __ STA ACCU + 1 
1108 : a9 01 __ LDA #$01
110a : a0 10 __ LDY #$10
.l7:
110c : 91 1b __ STA (ACCU + 0),y 
110e : 91 43 __ STA (T0 + 0),y 
1110 : c8 __ __ INY
1111 : c0 18 __ CPY #$18
1113 : d0 f7 __ BNE $110c ; (scroller_crossflash.l7 + 0)
.s3:
1115 : 60 __ __ RTS
--------------------------------------------------------------------
reveal_word@proxy: ; reveal_word@proxy
1116 : a9 12 __ LDA #$12
1118 : 85 0d __ STA P0 
111a : a9 0b __ LDA #$0b
111c : 85 10 __ STA P3 
111e : a5 49 __ LDA $49 
1120 : 85 11 __ STA P4 
1122 : a9 fc __ LDA #$fc
1124 : 85 12 __ STA P5 
1126 : a9 19 __ LDA #$19
1128 : 85 13 __ STA P6 
--------------------------------------------------------------------
reveal_word: ; reveal_word(u8,u8,const u8*,u8)->u8
; 703, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
112a : a0 00 __ LDY #$00
112c : b1 12 __ LDA (P5),y ; (word + 0)
112e : f0 26 __ BEQ $1156 ; (reveal_word.s5 + 0)
.l6:
1130 : a5 11 __ LDA P4 ; (col + 0)
1132 : 85 0e __ STA P1 
1134 : a0 00 __ LDY #$00
1136 : b1 12 __ LDA (P5),y ; (word + 0)
1138 : 85 0f __ STA P2 
113a : 20 5d 11 JSR $115d ; (pch.s4 + 0)
113d : e6 11 __ INC P4 ; (col + 0)
113f : a5 12 __ LDA P5 ; (word + 0)
1141 : 85 1b __ STA ACCU + 0 
1143 : 18 __ __ CLC
1144 : 69 01 __ ADC #$01
1146 : 85 12 __ STA P5 ; (word + 0)
1148 : a5 13 __ LDA P6 ; (word + 1)
114a : 85 1c __ STA ACCU + 1 
114c : 69 00 __ ADC #$00
114e : 85 13 __ STA P6 ; (word + 1)
1150 : a0 01 __ LDY #$01
1152 : b1 1b __ LDA (ACCU + 0),y 
1154 : d0 da __ BNE $1130 ; (reveal_word.l6 + 0)
.s5:
1156 : a5 11 __ LDA P4 ; (col + 0)
.s3:
1158 : 60 __ __ RTS
--------------------------------------------------------------------
pch@proxy: ; pch@proxy
1159 : a9 20 __ LDA #$20
115b : 85 0f __ STA P2 
--------------------------------------------------------------------
pch: ; pch(u8,u8,u8,u8)->void
; 102, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
115d : a5 0d __ LDA P0 ; (row + 0)
115f : 0a __ __ ASL
1160 : 85 1b __ STA ACCU + 0 
1162 : a9 00 __ LDA #$00
1164 : 2a __ __ ROL
1165 : 06 1b __ ASL ACCU + 0 
1167 : 2a __ __ ROL
1168 : aa __ __ TAX
1169 : a5 1b __ LDA ACCU + 0 
116b : 65 0d __ ADC P0 ; (row + 0)
116d : 85 43 __ STA T1 + 0 
116f : 8a __ __ TXA
1170 : 69 00 __ ADC #$00
1172 : 06 43 __ ASL T1 + 0 
1174 : 2a __ __ ROL
1175 : 06 43 __ ASL T1 + 0 
1177 : 2a __ __ ROL
1178 : 06 43 __ ASL T1 + 0 
117a : 2a __ __ ROL
117b : aa __ __ TAX
117c : a5 43 __ LDA T1 + 0 
117e : 65 0e __ ADC P1 ; (col + 0)
1180 : 85 43 __ STA T1 + 0 
1182 : 85 1b __ STA ACCU + 0 
1184 : 8a __ __ TXA
1185 : 69 04 __ ADC #$04
1187 : 85 44 __ STA T1 + 1 
1189 : 69 d4 __ ADC #$d4
118b : 85 1c __ STA ACCU + 1 
118d : a5 0f __ LDA P2 ; (ch + 0)
118f : a0 00 __ LDY #$00
1191 : 91 43 __ STA (T1 + 0),y 
1193 : a5 10 __ LDA P3 ; (fg + 0)
1195 : 91 1b __ STA (ACCU + 0),y 
.s3:
1197 : 60 __ __ RTS
--------------------------------------------------------------------
scene3_run: ; scene3_run()->void
;1371, "C:/code/jonas/c64Demo/nineteen84.c"
.s1:
1198 : a2 03 __ LDX #$03
119a : b5 53 __ LDA T1 + 0,x 
119c : 9d f4 9f STA $9ff4,x ; (scene3_run@stack + 0)
119f : ca __ __ DEX
11a0 : 10 f8 __ BPL $119a ; (scene3_run.s1 + 2)
.s4:
11a2 : a9 08 __ LDA #$08
11a4 : 85 0d __ STA P0 
11a6 : a9 07 __ LDA #$07
11a8 : 85 11 __ STA P4 
11aa : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
11ad : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
11b0 : a9 00 __ LDA #$00
11b2 : 85 0f __ STA P2 
11b4 : a9 1d __ LDA #$1d
11b6 : 85 10 __ STA P3 
11b8 : 20 c2 0b JSR $0bc2 ; (pcenter.s4 + 0)
11bb : a9 0a __ LDA #$0a
11bd : 20 87 0b JSR $0b87 ; (hline.s4 + 0)
11c0 : a9 0c __ LDA #$0c
11c2 : 85 0d __ STA P0 
11c4 : a9 1b __ LDA #$1b
11c6 : 85 10 __ STA P3 
11c8 : a9 0f __ LDA #$0f
11ca : 85 11 __ STA P4 
11cc : a9 fd __ LDA #$fd
11ce : 85 0f __ STA P2 
11d0 : 20 df 18 JSR $18df ; (pat@proxy + 0)
11d3 : a9 16 __ LDA #$16
11d5 : 85 0d __ STA P0 
11d7 : a9 1d __ LDA #$1d
11d9 : 85 10 __ STA P3 
11db : a9 23 __ LDA #$23
11dd : 85 0f __ STA P2 
11df : 20 be 0b JSR $0bbe ; (pcenter@proxy + 0)
11e2 : a9 20 __ LDA #$20
11e4 : a2 26 __ LDX #$26
.l15:
11e6 : 9d af 29 STA $29af,x ; (input_buf[0] + 0)
11e9 : ca __ __ DEX
11ea : 10 fa __ BPL $11e6 ; (scene3_run.l15 + 0)
.s16:
11ec : 20 2f 13 JSR $132f ; (input_line.s4 + 0)
11ef : a5 1b __ LDA ACCU + 0 
11f1 : aa __ __ TAX
11f2 : 4c f7 11 JMP $11f7 ; (scene3_run.l5 + 0)
.s14:
11f5 : ca __ __ DEX
11f6 : 8a __ __ TXA
.l5:
11f7 : c9 01 __ CMP #$01
11f9 : a9 00 __ LDA #$00
11fb : 6a __ __ ROR
11fc : a8 __ __ TAY
11fd : f0 07 __ BEQ $1206 ; (scene3_run.s17 + 0)
.s13:
11ff : bd ae 29 LDA $29ae,x ; (scroll_buf[0] + 39)
1202 : c9 20 __ CMP #$20
1204 : f0 ef __ BEQ $11f5 ; (scene3_run.s14 + 0)
.s17:
1206 : 86 56 __ STX T4 + 0 
1208 : 86 0d __ STX P0 
120a : 84 53 __ STY T1 + 0 
120c : 20 37 14 JSR $1437 ; (find_theme.s4 + 0)
120f : a5 1b __ LDA ACCU + 0 
1211 : 85 12 __ STA P5 
1213 : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
1216 : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
1219 : 20 a4 14 JSR $14a4 ; (show_waiting.s1 + 0)
121c : a5 56 __ LDA T4 + 0 
121e : 85 0d __ STA P0 
1220 : a9 fc __ LDA #$fc
1222 : 85 0e __ STA P1 
1224 : a9 9f __ LDA #$9f
1226 : 85 11 __ STA P4 
1228 : a9 9f __ LDA #$9f
122a : 85 0f __ STA P2 
122c : a9 fa __ LDA #$fa
122e : 85 10 __ STA P3 
1230 : 20 79 16 JSR $1679 ; (find_response.s4 + 0)
1233 : a9 07 __ LDA #$07
1235 : 85 11 __ STA P4 
1237 : a9 23 __ LDA #$23
1239 : 85 14 __ STA P7 
123b : a9 0d __ LDA #$0d
123d : 85 12 __ STA P5 
123f : a9 0b __ LDA #$0b
1241 : 85 15 __ STA P8 
1243 : a9 03 __ LDA #$03
1245 : 85 16 __ STA P9 
1247 : a9 f1 __ LDA #$f1
1249 : 85 13 __ STA P6 
124b : 20 0b 17 JSR $170b ; (typeout.l4 + 0)
124e : 20 f9 09 JSR $09f9 ; (wait_frames@proxy + 0)
1251 : 24 53 __ BIT T1 + 0 
1253 : 10 24 __ BPL $1279 ; (scene3_run.s6 + 0)
.s12:
1255 : 38 __ __ SEC
1256 : a9 28 __ LDA #$28
1258 : e5 56 __ SBC T4 + 0 
125a : 4a __ __ LSR
125b : 85 43 __ STA T0 + 0 
125d : a0 00 __ LDY #$00
125f : 84 54 __ STY T3 + 0 
1261 : 18 __ __ CLC
.l18:
1262 : a5 43 __ LDA T0 + 0 
1264 : 65 54 __ ADC T3 + 0 
1266 : aa __ __ TAX
1267 : b9 af 29 LDA $29af,y ; (input_buf[0] + 0)
126a : 9d 40 05 STA $0540,x 
126d : a9 01 __ LDA #$01
126f : 9d 40 d9 STA $d940,x 
1272 : c8 __ __ INY
1273 : 84 54 __ STY T3 + 0 
1275 : c4 56 __ CPY T4 + 0 
1277 : 90 e9 __ BCC $1262 ; (scene3_run.l18 + 0)
.s6:
1279 : 20 ed 18 JSR $18ed ; (wait_frames@proxy + 0)
127c : a9 0a __ LDA #$0a
127e : 20 87 0b JSR $0b87 ; (hline.s4 + 0)
1281 : 20 0a 18 JSR $180a ; (wait_frames@proxy + 0)
1284 : a9 0c __ LDA #$0c
1286 : 85 11 __ STA P4 
1288 : 85 12 __ STA P5 
128a : a9 6b __ LDA #$6b
128c : 85 13 __ STA P6 
128e : a9 28 __ LDA #$28
1290 : 85 14 __ STA P7 
1292 : 20 0b 17 JSR $170b ; (typeout.l4 + 0)
1295 : 20 0a 18 JSR $180a ; (wait_frames@proxy + 0)
1298 : ad fc 9f LDA $9ffc ; (match_l1 + 0)
129b : 85 43 __ STA T0 + 0 
129d : ad fd 9f LDA $9ffd ; (match_l1 + 1)
12a0 : 85 44 __ STA T0 + 1 
12a2 : a0 00 __ LDY #$00
12a4 : f0 01 __ BEQ $12a7 ; (scene3_run.l7 + 0)
.s11:
12a6 : c8 __ __ INY
.l7:
12a7 : b1 43 __ LDA (T0 + 0),y 
12a9 : d0 fb __ BNE $12a6 ; (scene3_run.s11 + 0)
.s8:
12ab : 84 53 __ STY T1 + 0 
12ad : ad fa 9f LDA $9ffa ; (match_l2 + 0)
12b0 : 85 54 __ STA T3 + 0 
12b2 : ad fb 9f LDA $9ffb ; (match_l2 + 1)
12b5 : 85 55 __ STA T3 + 1 
12b7 : a0 00 __ LDY #$00
12b9 : b1 54 __ LDA (T3 + 0),y 
12bb : f0 05 __ BEQ $12c2 ; (scene3_run.s9 + 0)
.l10:
12bd : c8 __ __ INY
12be : b1 54 __ LDA (T3 + 0),y 
12c0 : d0 fb __ BNE $12bd ; (scene3_run.l10 + 0)
.s9:
12c2 : 84 47 __ STY T5 + 0 
12c4 : e6 11 __ INC P4 
12c6 : a5 43 __ LDA T0 + 0 
12c8 : 85 13 __ STA P6 
12ca : a5 44 __ LDA T0 + 1 
12cc : 85 14 __ STA P7 
12ce : c6 15 __ DEC P8 
12d0 : 38 __ __ SEC
12d1 : a9 28 __ LDA #$28
12d3 : e5 53 __ SBC T1 + 0 
12d5 : 6a __ __ ROR
12d6 : 49 80 __ EOR #$80
12d8 : 85 12 __ STA P5 
12da : 20 0b 17 JSR $170b ; (typeout.l4 + 0)
12dd : 20 fb 18 JSR $18fb ; (wait_frames@proxy + 0)
12e0 : e6 11 __ INC P4 
12e2 : a5 54 __ LDA T3 + 0 
12e4 : 85 13 __ STA P6 
12e6 : a5 55 __ LDA T3 + 1 
12e8 : 85 14 __ STA P7 
12ea : 38 __ __ SEC
12eb : a9 28 __ LDA #$28
12ed : e5 47 __ SBC T5 + 0 
12ef : 6a __ __ ROR
12f0 : 49 80 __ EOR #$80
12f2 : 85 12 __ STA P5 
12f4 : 20 0b 17 JSR $170b ; (typeout.l4 + 0)
12f7 : 20 e6 18 JSR $18e6 ; (wait_frames@proxy + 0)
12fa : a9 10 __ LDA #$10
12fc : 20 87 0b JSR $0b87 ; (hline.s4 + 0)
12ff : 20 e6 18 JSR $18e6 ; (wait_frames@proxy + 0)
1302 : e6 16 __ INC P9 
1304 : a9 12 __ LDA #$12
1306 : 85 11 __ STA P4 
1308 : a9 08 __ LDA #$08
130a : 85 12 __ STA P5 
130c : a9 7c __ LDA #$7c
130e : 85 13 __ STA P6 
1310 : a9 28 __ LDA #$28
1312 : 85 14 __ STA P7 
1314 : 20 ba 18 JSR $18ba ; (typeout@proxy + 0)
1317 : a9 78 __ LDA #$78
1319 : 85 0d __ STA P0 
131b : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
131e : 20 4c 0d JSR $0d4c ; (fade_to_black.s4 + 0)
1321 : 20 0a 18 JSR $180a ; (wait_frames@proxy + 0)
.s3:
1324 : a2 03 __ LDX #$03
1326 : bd f4 9f LDA $9ff4,x ; (scene3_run@stack + 0)
1329 : 95 53 __ STA T1 + 0,x 
132b : ca __ __ DEX
132c : 10 f8 __ BPL $1326 ; (scene3_run.s3 + 2)
132e : 60 __ __ RTS
--------------------------------------------------------------------
input_line: ; input_line(u8,u8,u8,u8*,u8)->u8
; 311, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
132f : a9 00 __ LDA #$00
1331 : 85 46 __ STA T4 + 0 
1333 : 85 47 __ STA T5 + 0 
1335 : a9 01 __ LDA #$01
1337 : 85 48 __ STA T6 + 0 
1339 : 85 10 __ STA P3 
133b : a9 0c __ LDA #$0c
133d : 85 0d __ STA P0 
133f : a9 20 __ LDA #$20
1341 : 85 0f __ STA P2 
1343 : a9 03 __ LDA #$03
1345 : 85 0e __ STA P1 
.l17:
1347 : 20 5d 11 JSR $115d ; (pch.s4 + 0)
134a : e6 0e __ INC P1 
134c : a5 0e __ LDA P1 
134e : c9 28 __ CMP #$28
1350 : d0 f5 __ BNE $1347 ; (input_line.l17 + 0)
.l5:
1352 : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
1355 : e6 47 __ INC T5 + 0 
1357 : a5 47 __ LDA T5 + 0 
1359 : c9 14 __ CMP #$14
135b : 90 09 __ BCC $1366 ; (input_line.s6 + 0)
.s16:
135d : a9 00 __ LDA #$00
135f : 85 47 __ STA T5 + 0 
1361 : c5 48 __ CMP T6 + 0 
1363 : 2a __ __ ROL
1364 : 85 48 __ STA T6 + 0 
.s6:
1366 : a9 0c __ LDA #$0c
1368 : 85 0d __ STA P0 
136a : a9 01 __ LDA #$01
136c : 85 10 __ STA P3 
136e : a5 48 __ LDA T6 + 0 
1370 : f0 04 __ BEQ $1376 ; (input_line.s18 + 0)
.s19:
1372 : a9 a0 __ LDA #$a0
1374 : 90 02 __ BCC $1378 ; (input_line.s20 + 0)
.s18:
1376 : a9 20 __ LDA #$20
.s20:
1378 : 85 0f __ STA P2 
137a : 18 __ __ CLC
137b : a5 46 __ LDA T4 + 0 
137d : 69 03 __ ADC #$03
137f : 85 0e __ STA P1 
1381 : 20 5d 11 JSR $115d ; (pch.s4 + 0)
1384 : 20 e9 13 JSR $13e9 ; (read_key.s4 + 0)
1387 : aa __ __ TAX
1388 : f0 c8 __ BEQ $1352 ; (input_line.l5 + 0)
.s7:
138a : c9 0d __ CMP #$0d
138c : f0 4e __ BEQ $13dc ; (input_line.s15 + 0)
.s8:
138e : c9 14 __ CMP #$14
1390 : d0 24 __ BNE $13b6 ; (input_line.s9 + 0)
.s13:
1392 : a5 46 __ LDA T4 + 0 
1394 : f0 bc __ BEQ $1352 ; (input_line.l5 + 0)
.s14:
1396 : 20 59 11 JSR $1159 ; (pch@proxy + 0)
1399 : 18 __ __ CLC
139a : a5 46 __ LDA T4 + 0 
139c : 69 ff __ ADC #$ff
139e : 85 45 __ STA T2 + 0 
13a0 : 18 __ __ CLC
13a1 : 69 03 __ ADC #$03
13a3 : 85 0e __ STA P1 
13a5 : 20 5d 11 JSR $115d ; (pch.s4 + 0)
13a8 : a9 00 __ LDA #$00
13aa : a6 46 __ LDX T4 + 0 
13ac : 9d ae 29 STA $29ae,x ; (scroll_buf[0] + 39)
.s12:
13af : a5 45 __ LDA T2 + 0 
13b1 : 85 46 __ STA T4 + 0 
13b3 : 4c 52 13 JMP $1352 ; (input_line.l5 + 0)
.s9:
13b6 : 20 0c 14 JSR $140c ; (petscii_to_sc.s4 + 0)
13b9 : a8 __ __ TAY
13ba : f0 96 __ BEQ $1352 ; (input_line.l5 + 0)
.s10:
13bc : a6 46 __ LDX T4 + 0 
13be : e0 24 __ CPX #$24
13c0 : b0 90 __ BCS $1352 ; (input_line.l5 + 0)
.s11:
13c2 : 85 0f __ STA P2 
13c4 : 98 __ __ TYA
13c5 : 9d af 29 STA $29af,x ; (input_buf[0] + 0)
13c8 : 20 5d 11 JSR $115d ; (pch.s4 + 0)
13cb : a9 20 __ LDA #$20
13cd : 85 0f __ STA P2 
13cf : a6 46 __ LDX T4 + 0 
13d1 : e8 __ __ INX
13d2 : 86 45 __ STX T2 + 0 
13d4 : e6 0e __ INC P1 
13d6 : 20 5d 11 JSR $115d ; (pch.s4 + 0)
13d9 : 4c af 13 JMP $13af ; (input_line.s12 + 0)
.s15:
13dc : 20 59 11 JSR $1159 ; (pch@proxy + 0)
13df : a9 00 __ LDA #$00
13e1 : a6 46 __ LDX T4 + 0 
13e3 : 86 1b __ STX ACCU + 0 
13e5 : 9d af 29 STA $29af,x ; (input_buf[0] + 0)
.s3:
13e8 : 60 __ __ RTS
--------------------------------------------------------------------
read_key: ; read_key()->u8
; 288, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
13e9 : a5 c6 __ LDA $c6 
13eb : f0 1e __ BEQ $140b ; (read_key.s3 + 0)
.s5:
13ed : ae 77 02 LDX $0277 
13f0 : a5 c6 __ LDA $c6 
13f2 : 38 __ __ SEC
13f3 : e9 01 __ SBC #$01
13f5 : f0 11 __ BEQ $1408 ; (read_key.s6 + 0)
.s7:
13f7 : 85 1b __ STA ACCU + 0 
13f9 : a0 00 __ LDY #$00
.l8:
13fb : b9 78 02 LDA $0278,y 
13fe : 99 77 02 STA $0277,y 
1401 : c8 __ __ INY
1402 : c4 1b __ CPY ACCU + 0 
1404 : 90 f5 __ BCC $13fb ; (read_key.l8 + 0)
.s9:
1406 : a5 1b __ LDA ACCU + 0 
.s6:
1408 : 85 c6 __ STA $c6 
140a : 8a __ __ TXA
.s3:
140b : 60 __ __ RTS
--------------------------------------------------------------------
petscii_to_sc: ; petscii_to_sc(u8)->u8
; 300, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
140c : c9 41 __ CMP #$41
140e : 90 22 __ BCC $1432 ; (petscii_to_sc.s5 + 0)
.s13:
1410 : c9 5b __ CMP #$5b
1412 : b0 03 __ BCS $1417 ; (petscii_to_sc.s6 + 0)
.s14:
1414 : e9 3f __ SBC #$3f
.s3:
1416 : 60 __ __ RTS
.s6:
1417 : c9 2e __ CMP #$2e
1419 : f0 fb __ BEQ $1416 ; (petscii_to_sc.s3 + 0)
.s7:
141b : c9 21 __ CMP #$21
141d : f0 f7 __ BEQ $1416 ; (petscii_to_sc.s3 + 0)
.s8:
141f : c9 3f __ CMP #$3f
1421 : f0 f3 __ BEQ $1416 ; (petscii_to_sc.s3 + 0)
.s9:
1423 : c9 2d __ CMP #$2d
1425 : f0 ef __ BEQ $1416 ; (petscii_to_sc.s3 + 0)
.s10:
1427 : c9 30 __ CMP #$30
1429 : 90 04 __ BCC $142f ; (petscii_to_sc.s11 + 0)
.s12:
142b : c9 3a __ CMP #$3a
142d : 90 e7 __ BCC $1416 ; (petscii_to_sc.s3 + 0)
.s11:
142f : a9 00 __ LDA #$00
1431 : 60 __ __ RTS
.s5:
1432 : c9 20 __ CMP #$20
1434 : d0 e1 __ BNE $1417 ; (petscii_to_sc.s6 + 0)
1436 : 60 __ __ RTS
--------------------------------------------------------------------
find_theme: ; find_theme(const u8*,u8)->u8
;1113, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
1437 : a9 00 __ LDA #$00
1439 : 85 1e __ STA ACCU + 3 
.l5:
143b : 0a __ __ ASL
143c : 65 1e __ ADC ACCU + 3 
143e : 85 1b __ STA ACCU + 0 
1440 : aa __ __ TAX
1441 : bd 47 1d LDA $1d47,x ; (_theme_table[0].kw + 0)
1444 : 85 43 __ STA T1 + 0 
1446 : bd 48 1d LDA $1d48,x ; (_theme_table[0].kw + 1)
1449 : 85 44 __ STA T1 + 1 
144b : a0 00 __ LDY #$00
144d : f0 01 __ BEQ $1450 ; (find_theme.l6 + 0)
.s19:
144f : c8 __ __ INY
.l6:
1450 : b1 43 __ LDA (T1 + 0),y 
1452 : d0 fb __ BNE $144f ; (find_theme.s19 + 0)
.s7:
1454 : 84 1c __ STY ACCU + 1 
1456 : a5 0d __ LDA P0 ; (ilen + 0)
1458 : c5 1c __ CMP ACCU + 1 
145a : 90 14 __ BCC $1470 ; (find_theme.s10 + 0)
.s8:
145c : a9 00 __ LDA #$00
145e : aa __ __ TAX
145f : b0 02 __ BCS $1463 ; (find_theme.l9 + 0)
.s17:
1461 : e8 __ __ INX
1462 : 8a __ __ TXA
.l9:
1463 : 85 1d __ STA ACCU + 2 
1465 : 18 __ __ CLC
1466 : 65 1c __ ADC ACCU + 1 
1468 : b0 06 __ BCS $1470 ; (find_theme.s10 + 0)
.s18:
146a : c5 0d __ CMP P0 ; (ilen + 0)
146c : 90 0f __ BCC $147d ; (find_theme.s12 + 0)
.s20:
146e : f0 0d __ BEQ $147d ; (find_theme.s12 + 0)
.s10:
1470 : e6 1e __ INC ACCU + 3 
1472 : a5 1e __ LDA ACCU + 3 
1474 : c9 27 __ CMP #$27
1476 : 90 c3 __ BCC $143b ; (find_theme.l5 + 0)
.s11:
1478 : a9 0f __ LDA #$0f
.s3:
147a : 85 1b __ STA ACCU + 0 
147c : 60 __ __ RTS
.s12:
147d : a5 1c __ LDA ACCU + 1 
147f : f0 1b __ BEQ $149c ; (find_theme.s13 + 0)
.s14:
1481 : a9 00 __ LDA #$00
1483 : 85 45 __ STA T10 + 0 
1485 : 18 __ __ CLC
.l15:
1486 : a5 1d __ LDA ACCU + 2 
1488 : 65 45 __ ADC T10 + 0 
148a : a8 __ __ TAY
148b : b9 af 29 LDA $29af,y ; (input_buf[0] + 0)
148e : a4 45 __ LDY T10 + 0 
1490 : d1 43 __ CMP (T1 + 0),y 
1492 : d0 cd __ BNE $1461 ; (find_theme.s17 + 0)
.s16:
1494 : e6 45 __ INC T10 + 0 
1496 : a5 45 __ LDA T10 + 0 
1498 : c5 1c __ CMP ACCU + 1 
149a : 90 ea __ BCC $1486 ; (find_theme.l15 + 0)
.s13:
149c : a6 1b __ LDX ACCU + 0 
149e : bd 49 1d LDA $1d49,x ; (_theme_table[0].theme + 0)
14a1 : 4c 7a 14 JMP $147a ; (find_theme.s3 + 0)
--------------------------------------------------------------------
show_waiting: ; show_waiting(u8)->void
;1253, "C:/code/jonas/c64Demo/nineteen84.c"
.s1:
14a4 : a5 53 __ LDA T11 + 0 
14a6 : 8d fe 9f STA $9ffe ; (show_waiting@stack + 0)
.s4:
14a9 : a6 12 __ LDX P5 ; (theme + 0)
14ab : 86 4b __ STX T3 + 0 
14ad : bd aa 18 LDA $18aa,x ; (__multab6L + 0)
14b0 : 85 49 __ STA T1 + 0 
14b2 : a9 00 __ LDA #$00
14b4 : 85 4c __ STA T4 + 0 
14b6 : 85 4d __ STA T5 + 0 
14b8 : 85 4e __ STA T6 + 0 
14ba : 85 4f __ STA T7 + 0 
14bc : 85 50 __ STA T8 + 0 
14be : 85 51 __ STA T9 + 0 
14c0 : a9 05 __ LDA #$05
14c2 : 85 52 __ STA T10 + 0 
.l5:
14c4 : a5 4b __ LDA T3 + 0 
14c6 : 20 ef 15 JSR $15ef ; (draw_art.s4 + 0)
14c9 : a5 4c __ LDA T4 + 0 
14cb : 0a __ __ ASL
14cc : 18 __ __ CLC
14cd : 65 49 __ ADC T1 + 0 
14cf : aa __ __ TAX
14d0 : a9 04 __ LDA #$04
14d2 : 85 0d __ STA P0 
14d4 : a9 0e __ LDA #$0e
14d6 : 85 11 __ STA P4 
14d8 : bd 00 21 LDA $2100,x ; (_theme_words[0][0] + 0)
14db : 85 0f __ STA P2 
14dd : bd 01 21 LDA $2101,x ; (_theme_words[0][0] + 1)
14e0 : 85 10 __ STA P3 
14e2 : 20 c2 0b JSR $0bc2 ; (pcenter.s4 + 0)
14e5 : a5 4d __ LDA T5 + 0 
14e7 : 0a __ __ ASL
14e8 : aa __ __ TAX
14e9 : a9 18 __ LDA #$18
14eb : 85 0d __ STA P0 
14ed : a9 0b __ LDA #$0b
14ef : 85 11 __ STA P4 
14f1 : bd b8 22 LDA $22b8,x ; (_generic_phrases[0] + 0)
14f4 : 85 0f __ STA P2 
14f6 : bd b9 22 LDA $22b9,x ; (_generic_phrases[0] + 1)
14f9 : 85 10 __ STA P3 
14fb : e6 4c __ INC T4 + 0 
14fd : a5 4c __ LDA T4 + 0 
14ff : c9 03 __ CMP #$03
1501 : 90 04 __ BCC $1507 ; (show_waiting.s6 + 0)
.s21:
1503 : a9 00 __ LDA #$00
1505 : 85 4c __ STA T4 + 0 
.s6:
1507 : 20 c2 0b JSR $0bc2 ; (pcenter.s4 + 0)
150a : a2 00 __ LDX #$00
150c : 86 53 __ STX T11 + 0 
150e : e6 4d __ INC T5 + 0 
1510 : a5 4d __ LDA T5 + 0 
1512 : c9 04 __ CMP #$04
1514 : 90 02 __ BCC $1518 ; (show_waiting.l7 + 0)
.s20:
1516 : 86 4d __ STX T5 + 0 
.l7:
1518 : 20 60 0c JSR $0c60 ; (wait_frame.l4 + 0)
151b : e6 51 __ INC T9 + 0 
151d : a5 4f __ LDA T7 + 0 
151f : f0 03 __ BEQ $1524 ; (show_waiting.s8 + 0)
1521 : 4c c8 15 JMP $15c8 ; (show_waiting.s18 + 0)
.s8:
1524 : a5 51 __ LDA T9 + 0 
1526 : c9 02 __ CMP #$02
1528 : 90 1e __ BCC $1548 ; (show_waiting.s9 + 0)
.s15:
152a : a9 00 __ LDA #$00
152c : 85 51 __ STA T9 + 0 
152e : a4 4e __ LDY T6 + 0 
1530 : c0 28 __ CPY #$28
1532 : b0 12 __ BCS $1546 ; (show_waiting.s16 + 0)
.s17:
1534 : a9 2e __ LDA #$2e
1536 : 99 d0 06 STA $06d0,y 
1539 : a9 0b __ LDA #$0b
153b : 99 d0 da STA $dad0,y 
153e : e6 4e __ INC T6 + 0 
1540 : a5 4e __ LDA T6 + 0 
1542 : c9 28 __ CMP #$28
1544 : 90 02 __ BCC $1548 ; (show_waiting.s9 + 0)
.s16:
1546 : e6 4f __ INC T7 + 0 
.s9:
1548 : a5 53 __ LDA T11 + 0 
154a : 85 1b __ STA ACCU + 0 
154c : a9 00 __ LDA #$00
154e : 85 1c __ STA ACCU + 1 
1550 : 85 04 __ STA WORK + 1 
1552 : a9 0c __ LDA #$0c
1554 : 85 03 __ STA WORK + 0 
1556 : 20 11 18 JSR $1811 ; (divmod + 0)
1559 : a5 1b __ LDA ACCU + 0 
155b : 85 10 __ STA P3 
155d : a9 05 __ LDA #$05
155f : c5 10 __ CMP P3 
1561 : b0 02 __ BCS $1565 ; (show_waiting.s10 + 0)
.s14:
1563 : 85 10 __ STA P3 
.s10:
1565 : a5 4b __ LDA T3 + 0 
1567 : 85 0f __ STA P2 
1569 : 20 5b 16 JSR $165b ; (pulse_art_color.s4 + 0)
156c : e6 53 __ INC T11 + 0 
156e : a5 53 __ LDA T11 + 0 
1570 : c9 4b __ CMP #$4b
1572 : 90 a4 __ BCC $1518 ; (show_waiting.l7 + 0)
.s11:
1574 : a9 04 __ LDA #$04
1576 : 85 0d __ STA P0 
1578 : a9 00 __ LDA #$00
157a : 85 0e __ STA P1 
157c : 20 e5 0c JSR $0ce5 ; (rowcol.s4 + 0)
157f : a9 18 __ LDA #$18
1581 : 85 0d __ STA P0 
1583 : 20 e5 0c JSR $0ce5 ; (rowcol.s4 + 0)
1586 : 20 f4 18 JSR $18f4 ; (wait_frames@proxy + 0)
1589 : a9 06 __ LDA #$06
158b : 85 4a __ STA T2 + 0 
.l22:
158d : 85 0d __ STA P0 
158f : 20 e5 0c JSR $0ce5 ; (rowcol.s4 + 0)
1592 : a9 04 __ LDA #$04
1594 : 85 0d __ STA P0 
1596 : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
1599 : e6 4a __ INC T2 + 0 
159b : a5 4a __ LDA T2 + 0 
159d : c9 0b __ CMP #$0b
159f : d0 ec __ BNE $158d ; (show_waiting.l22 + 0)
.s12:
15a1 : 20 f4 18 JSR $18f4 ; (wait_frames@proxy + 0)
15a4 : c6 52 __ DEC T10 + 0 
15a6 : f0 03 __ BEQ $15ab ; (show_waiting.s13 + 0)
15a8 : 4c c4 14 JMP $14c4 ; (show_waiting.l5 + 0)
.s13:
15ab : a2 00 __ LDX #$00
.l23:
15ad : a9 20 __ LDA #$20
15af : 9d d0 06 STA $06d0,x 
15b2 : a9 00 __ LDA #$00
15b4 : 9d d0 da STA $dad0,x 
15b7 : e8 __ __ INX
15b8 : e0 28 __ CPX #$28
15ba : d0 f1 __ BNE $15ad ; (show_waiting.l23 + 0)
.s24:
15bc : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
15bf : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
.s3:
15c2 : ad fe 9f LDA $9ffe ; (show_waiting@stack + 0)
15c5 : 85 53 __ STA T11 + 0 
15c7 : 60 __ __ RTS
.s18:
15c8 : e6 50 __ INC T8 + 0 
15ca : a5 50 __ LDA T8 + 0 
15cc : c9 12 __ CMP #$12
15ce : b0 03 __ BCS $15d3 ; (show_waiting.s19 + 0)
15d0 : 4c 48 15 JMP $1548 ; (show_waiting.s9 + 0)
.s19:
15d3 : a2 00 __ LDX #$00
.l25:
15d5 : a9 20 __ LDA #$20
15d7 : 9d d0 06 STA $06d0,x 
15da : a9 00 __ LDA #$00
15dc : 9d d0 da STA $dad0,x 
15df : e8 __ __ INX
15e0 : e0 28 __ CPX #$28
15e2 : d0 f1 __ BNE $15d5 ; (show_waiting.l25 + 0)
.s26:
15e4 : 85 4e __ STA T6 + 0 
15e6 : 85 4f __ STA T7 + 0 
15e8 : 85 50 __ STA T8 + 0 
15ea : 85 51 __ STA T9 + 0 
15ec : 4c 48 15 JMP $1548 ; (show_waiting.s9 + 0)
--------------------------------------------------------------------
draw_art: ; draw_art(u8)->void
;1004, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
15ef : aa __ __ TAX
15f0 : bd 9b 1e LDA $1e9b,x ; (_art_color[0] + 0)
15f3 : 85 1d __ STA ACCU + 2 
15f5 : bd 9a 18 LDA $189a,x ; (__multab10L + 0)
15f8 : 85 1b __ STA ACCU + 0 
15fa : a9 00 __ LDA #$00
15fc : 85 1c __ STA ACCU + 1 
15fe : 85 43 __ STA T2 + 0 
1600 : 85 1f __ STA ADDR + 0 
1602 : a9 01 __ LDA #$01
1604 : 85 44 __ STA T2 + 1 
.l5:
1606 : a5 43 __ LDA T2 + 0 
1608 : 85 45 __ STA T3 + 0 
160a : 18 __ __ CLC
160b : a5 44 __ LDA T2 + 1 
160d : 69 04 __ ADC #$04
160f : 85 46 __ STA T3 + 1 
1611 : 18 __ __ CLC
1612 : 69 d4 __ ADC #$d4
1614 : 85 20 __ STA ADDR + 1 
1616 : a5 1c __ LDA ACCU + 1 
1618 : 0a __ __ ASL
1619 : 18 __ __ CLC
161a : 65 1b __ ADC ACCU + 0 
161c : aa __ __ TAX
161d : bd 00 1f LDA $1f00,x ; (_art_table[0][0] + 0)
1620 : 85 47 __ STA T4 + 0 
1622 : bd 01 1f LDA $1f01,x ; (_art_table[0][0] + 1)
1625 : 85 48 __ STA T4 + 1 
1627 : a0 00 __ LDY #$00
1629 : 84 1e __ STY ACCU + 3 
162b : a6 1d __ LDX ACCU + 2 
.l8:
162d : b1 47 __ LDA (T4 + 0),y 
162f : a0 00 __ LDY #$00
1631 : 91 45 __ STA (T3 + 0),y 
1633 : 8a __ __ TXA
1634 : a4 45 __ LDY T3 + 0 
1636 : 91 1f __ STA (ADDR + 0),y 
1638 : e6 45 __ INC T3 + 0 
163a : e6 1e __ INC ACCU + 3 
163c : a4 1e __ LDY ACCU + 3 
163e : c0 07 __ CPY #$07
1640 : 90 eb __ BCC $162d ; (draw_art.l8 + 0)
.s6:
1642 : e6 1c __ INC ACCU + 1 
1644 : a5 43 __ LDA T2 + 0 
1646 : 69 27 __ ADC #$27
1648 : 85 43 __ STA T2 + 0 
164a : a5 44 __ LDA T2 + 1 
164c : 69 00 __ ADC #$00
164e : 85 44 __ STA T2 + 1 
1650 : c9 01 __ CMP #$01
1652 : d0 b2 __ BNE $1606 ; (draw_art.l5 + 0)
.s7:
1654 : a5 43 __ LDA T2 + 0 
1656 : c9 c8 __ CMP #$c8
1658 : d0 ac __ BNE $1606 ; (draw_art.l5 + 0)
.s3:
165a : 60 __ __ RTS
--------------------------------------------------------------------
pulse_art_color: ; pulse_art_color(u8,u8)->void
;1246, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
165b : a6 0f __ LDX P2 ; (theme + 0)
165d : bd aa 18 LDA $18aa,x ; (__multab6L + 0)
1660 : 18 __ __ CLC
1661 : 65 10 __ ADC P3 ; (step + 0)
1663 : aa __ __ TAX
1664 : bd 20 23 LDA $2320,x ; (_pulse_colors[0][0] + 0)
1667 : 85 0e __ STA P1 
1669 : a9 06 __ LDA #$06
166b : 85 0d __ STA P0 
.l5:
166d : 20 e5 0c JSR $0ce5 ; (rowcol.s4 + 0)
1670 : e6 0d __ INC P0 
1672 : a5 0d __ LDA P0 
1674 : c9 0b __ CMP #$0b
1676 : d0 f5 __ BNE $166d ; (pulse_art_color.l5 + 0)
.s3:
1678 : 60 __ __ RTS
--------------------------------------------------------------------
find_response: ; find_response(const u8*,u8,const u8**,const u8**)->void
; 238, "C:/code/jonas/c64Demo/responses.h"
.s4:
1679 : a9 00 __ LDA #$00
167b : 85 43 __ STA T6 + 0 
.l5:
167d : 0a __ __ ASL
167e : aa __ __ TAX
167f : bd 80 23 LDA $2380,x ; (_kw_table[0] + 0)
1682 : 85 1b __ STA ACCU + 0 
1684 : bd 81 23 LDA $2381,x ; (_kw_table[0] + 1)
1687 : 85 1c __ STA ACCU + 1 
1689 : a0 00 __ LDY #$00
168b : f0 01 __ BEQ $168e ; (find_response.l6 + 0)
.s19:
168d : c8 __ __ INY
.l6:
168e : b1 1b __ LDA (ACCU + 0),y 
1690 : d0 fb __ BNE $168d ; (find_response.s19 + 0)
.s7:
1692 : 84 1d __ STY ACCU + 2 
1694 : a5 0d __ LDA P0 ; (ilen + 0)
1696 : c5 1d __ CMP ACCU + 2 
1698 : 90 17 __ BCC $16b1 ; (find_response.s10 + 0)
.s8:
169a : a9 00 __ LDA #$00
169c : 85 44 __ STA T9 + 0 
169e : b0 04 __ BCS $16a4 ; (find_response.l9 + 0)
.s17:
16a0 : e6 44 __ INC T9 + 0 
16a2 : a5 44 __ LDA T9 + 0 
.l9:
16a4 : 85 1e __ STA ACCU + 3 
16a6 : 18 __ __ CLC
16a7 : 65 1d __ ADC ACCU + 2 
16a9 : b0 06 __ BCS $16b1 ; (find_response.s10 + 0)
.s18:
16ab : c5 0d __ CMP P0 ; (ilen + 0)
16ad : 90 20 __ BCC $16cf ; (find_response.s12 + 0)
.s20:
16af : f0 1e __ BEQ $16cf ; (find_response.s12 + 0)
.s10:
16b1 : e6 43 __ INC T6 + 0 
16b3 : a5 43 __ LDA T6 + 0 
16b5 : c9 2a __ CMP #$2a
16b7 : 90 c4 __ BCC $167d ; (find_response.l5 + 0)
.s11:
16b9 : a9 33 __ LDA #$33
16bb : a0 00 __ LDY #$00
16bd : 91 0e __ STA (P1),y ; (out_l1 + 0)
16bf : a9 28 __ LDA #$28
16c1 : c8 __ __ INY
16c2 : 91 0e __ STA (P1),y ; (out_l1 + 0)
16c4 : a9 51 __ LDA #$51
16c6 : 88 __ __ DEY
16c7 : 91 10 __ STA (P3),y ; (out_l2 + 0)
16c9 : a9 28 __ LDA #$28
16cb : c8 __ __ INY
.s3:
16cc : 91 10 __ STA (P3),y ; (out_l2 + 0)
16ce : 60 __ __ RTS
.s12:
16cf : a5 1d __ LDA ACCU + 2 
16d1 : f0 1b __ BEQ $16ee ; (find_response.s13 + 0)
.s14:
16d3 : a9 00 __ LDA #$00
16d5 : 85 45 __ STA T10 + 0 
16d7 : 18 __ __ CLC
.l15:
16d8 : a5 1e __ LDA ACCU + 3 
16da : 65 45 __ ADC T10 + 0 
16dc : a8 __ __ TAY
16dd : b9 af 29 LDA $29af,y ; (input_buf[0] + 0)
16e0 : a4 45 __ LDY T10 + 0 
16e2 : d1 1b __ CMP (ACCU + 0),y 
16e4 : d0 ba __ BNE $16a0 ; (find_response.s17 + 0)
.s16:
16e6 : e6 45 __ INC T10 + 0 
16e8 : a5 45 __ LDA T10 + 0 
16ea : c5 1d __ CMP ACCU + 2 
16ec : 90 ea __ BCC $16d8 ; (find_response.l15 + 0)
.s13:
16ee : bd 01 24 LDA $2401,x ; (_r1_table[0] + 1)
16f1 : a0 01 __ LDY #$01
16f3 : 91 0e __ STA (P1),y ; (out_l1 + 0)
16f5 : bd 00 24 LDA $2400,x ; (_r1_table[0] + 0)
16f8 : 88 __ __ DEY
16f9 : 91 0e __ STA (P1),y ; (out_l1 + 0)
16fb : bd 3a 26 LDA $263a,x ; (_r2_table[0] + 1)
16fe : c8 __ __ INY
16ff : 91 10 __ STA (P3),y ; (out_l2 + 0)
1701 : bd 39 26 LDA $2639,x ; (_r2_table[0] + 0)
1704 : 88 __ __ DEY
1705 : f0 c5 __ BEQ $16cc ; (find_response.s3 + 0)
--------------------------------------------------------------------
typeout@proxy: ; typeout@proxy
1707 : a9 01 __ LDA #$01
1709 : 85 15 __ STA P8 
--------------------------------------------------------------------
typeout: ; typeout(u8,u8,const u8*,u8,u8)->void
; 355, "C:/code/jonas/c64Demo/nineteen84.c"
.l4:
170b : a0 00 __ LDY #$00
170d : b1 13 __ LDA (P6),y ; (s + 0)
170f : f0 26 __ BEQ $1737 ; (typeout.s3 + 0)
.s5:
1711 : 85 0f __ STA P2 
1713 : a5 11 __ LDA P4 ; (row + 0)
1715 : 85 0d __ STA P0 
1717 : a5 15 __ LDA P8 ; (fg + 0)
1719 : 85 10 __ STA P3 
171b : a5 12 __ LDA P5 ; (col + 0)
171d : 85 0e __ STA P1 
171f : 20 5d 11 JSR $115d ; (pch.s4 + 0)
1722 : a5 16 __ LDA P9 ; (speed + 0)
1724 : 85 0d __ STA P0 
1726 : e6 13 __ INC P6 ; (s + 0)
1728 : d0 02 __ BNE $172c ; (typeout.s7 + 0)
.s6:
172a : e6 14 __ INC P7 ; (s + 1)
.s7:
172c : e6 12 __ INC P5 ; (col + 0)
172e : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
1731 : 20 11 0d JSR $0d11 ; (any_key.s4 + 0)
1734 : aa __ __ TAX
1735 : f0 d4 __ BEQ $170b ; (typeout.l4 + 0)
.s3:
1737 : 60 __ __ RTS
--------------------------------------------------------------------
scene4_run: ; scene4_run()->void
;1476, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
1738 : a9 1e __ LDA #$1e
173a : 85 0d __ STA P0 
173c : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
173f : 20 a5 0a JSR $0aa5 ; (cls.s4 + 0)
1742 : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
1745 : a9 06 __ LDA #$06
1747 : 85 11 __ STA P4 
1749 : a9 28 __ LDA #$28
174b : 85 14 __ STA P7 
174d : a9 08 __ LDA #$08
174f : 85 12 __ STA P5 
1751 : a9 0f __ LDA #$0f
1753 : 85 15 __ STA P8 
1755 : a9 02 __ LDA #$02
1757 : 85 16 __ STA P9 
1759 : a9 95 __ LDA #$95
175b : 85 13 __ STA P6 
175d : 20 0b 17 JSR $170b ; (typeout.l4 + 0)
1760 : 20 f9 09 JSR $09f9 ; (wait_frames@proxy + 0)
1763 : a9 08 __ LDA #$08
1765 : 85 11 __ STA P4 
1767 : a9 28 __ LDA #$28
1769 : 85 14 __ STA P7 
176b : a9 02 __ LDA #$02
176d : 85 12 __ STA P5 
176f : a9 ae __ LDA #$ae
1771 : 85 13 __ STA P6 
1773 : 20 07 17 JSR $1707 ; (typeout@proxy + 0)
1776 : 20 f9 09 JSR $09f9 ; (wait_frames@proxy + 0)
1779 : a9 0a __ LDA #$0a
177b : 85 11 __ STA P4 
177d : a9 28 __ LDA #$28
177f : 85 14 __ STA P7 
1781 : a9 0b __ LDA #$0b
1783 : 85 12 __ STA P5 
1785 : a9 0e __ LDA #$0e
1787 : 85 15 __ STA P8 
1789 : a9 d3 __ LDA #$d3
178b : 85 13 __ STA P6 
178d : 20 0b 17 JSR $170b ; (typeout.l4 + 0)
1790 : 20 e6 18 JSR $18e6 ; (wait_frames@proxy + 0)
1793 : a9 0d __ LDA #$0d
1795 : 20 87 0b JSR $0b87 ; (hline.s4 + 0)
1798 : 20 0a 18 JSR $180a ; (wait_frames@proxy + 0)
179b : e6 16 __ INC P9 
179d : a9 10 __ LDA #$10
179f : 85 11 __ STA P4 
17a1 : a9 07 __ LDA #$07
17a3 : 85 12 __ STA P5 
17a5 : a9 e6 __ LDA #$e6
17a7 : 85 13 __ STA P6 
17a9 : a9 28 __ LDA #$28
17ab : 85 14 __ STA P7 
17ad : 20 ba 18 JSR $18ba ; (typeout@proxy + 0)
17b0 : a9 0a __ LDA #$0a
17b2 : 85 45 __ STA T1 + 0 
17b4 : 85 0d __ STA P0 
17b6 : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
17b9 : e6 11 __ INC P4 
17bb : a9 06 __ LDA #$06
17bd : 85 12 __ STA P5 
17bf : a9 29 __ LDA #$29
17c1 : 85 14 __ STA P7 
17c3 : a9 00 __ LDA #$00
17c5 : 85 13 __ STA P6 
17c7 : 20 0b 17 JSR $170b ; (typeout.l4 + 0)
17ca : 20 0a 18 JSR $180a ; (wait_frames@proxy + 0)
17cd : e6 11 __ INC P4 
17cf : e6 16 __ INC P9 
17d1 : a9 09 __ LDA #$09
17d3 : 85 12 __ STA P5 
17d5 : a9 1c __ LDA #$1c
17d7 : 85 13 __ STA P6 
17d9 : a9 29 __ LDA #$29
17db : 85 14 __ STA P7 
17dd : 20 07 17 JSR $1707 ; (typeout@proxy + 0)
17e0 : a9 3c __ LDA #$3c
17e2 : 85 0d __ STA P0 
17e4 : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
17e7 : a9 1e __ LDA #$1e
17e9 : 85 0e __ STA P1 
17eb : a9 01 __ LDA #$01
17ed : 85 10 __ STA P3 
.l6:
17ef : a9 a0 __ LDA #$a0
17f1 : 85 0f __ STA P2 
17f3 : 20 c1 18 JSR $18c1 ; (pch@proxy + 0)
17f6 : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
17f9 : a9 12 __ LDA #$12
17fb : 85 0d __ STA P0 
17fd : 20 59 11 JSR $1159 ; (pch@proxy + 0)
1800 : 20 fd 09 JSR $09fd ; (wait_frames.s4 + 0)
1803 : c6 45 __ DEC T1 + 0 
1805 : d0 e8 __ BNE $17ef ; (scene4_run.l6 + 0)
.s5:
1807 : 20 4c 0d JSR $0d4c ; (fade_to_black.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
180a : a9 14 __ LDA #$14
180c : 85 0d __ STA P0 
180e : 4c fd 09 JMP $09fd ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
divmod: ; divmod
1811 : a5 1c __ LDA ACCU + 1 
1813 : d0 31 __ BNE $1846 ; (divmod + 53)
1815 : a5 04 __ LDA WORK + 1 
1817 : d0 1e __ BNE $1837 ; (divmod + 38)
1819 : 85 06 __ STA WORK + 3 
181b : a2 04 __ LDX #$04
181d : 06 1b __ ASL ACCU + 0 
181f : 2a __ __ ROL
1820 : c5 03 __ CMP WORK + 0 
1822 : 90 02 __ BCC $1826 ; (divmod + 21)
1824 : e5 03 __ SBC WORK + 0 
1826 : 26 1b __ ROL ACCU + 0 
1828 : 2a __ __ ROL
1829 : c5 03 __ CMP WORK + 0 
182b : 90 02 __ BCC $182f ; (divmod + 30)
182d : e5 03 __ SBC WORK + 0 
182f : 26 1b __ ROL ACCU + 0 
1831 : ca __ __ DEX
1832 : d0 eb __ BNE $181f ; (divmod + 14)
1834 : 85 05 __ STA WORK + 2 
1836 : 60 __ __ RTS
1837 : a5 1b __ LDA ACCU + 0 
1839 : 85 05 __ STA WORK + 2 
183b : a5 1c __ LDA ACCU + 1 
183d : 85 06 __ STA WORK + 3 
183f : a9 00 __ LDA #$00
1841 : 85 1b __ STA ACCU + 0 
1843 : 85 1c __ STA ACCU + 1 
1845 : 60 __ __ RTS
1846 : a5 04 __ LDA WORK + 1 
1848 : d0 1f __ BNE $1869 ; (divmod + 88)
184a : a5 03 __ LDA WORK + 0 
184c : 30 1b __ BMI $1869 ; (divmod + 88)
184e : a9 00 __ LDA #$00
1850 : 85 06 __ STA WORK + 3 
1852 : a2 10 __ LDX #$10
1854 : 06 1b __ ASL ACCU + 0 
1856 : 26 1c __ ROL ACCU + 1 
1858 : 2a __ __ ROL
1859 : c5 03 __ CMP WORK + 0 
185b : 90 02 __ BCC $185f ; (divmod + 78)
185d : e5 03 __ SBC WORK + 0 
185f : 26 1b __ ROL ACCU + 0 
1861 : 26 1c __ ROL ACCU + 1 
1863 : ca __ __ DEX
1864 : d0 f2 __ BNE $1858 ; (divmod + 71)
1866 : 85 05 __ STA WORK + 2 
1868 : 60 __ __ RTS
1869 : a9 00 __ LDA #$00
186b : 85 05 __ STA WORK + 2 
186d : 85 06 __ STA WORK + 3 
186f : 84 02 __ STY $02 
1871 : a0 10 __ LDY #$10
1873 : 18 __ __ CLC
1874 : 26 1b __ ROL ACCU + 0 
1876 : 26 1c __ ROL ACCU + 1 
1878 : 26 05 __ ROL WORK + 2 
187a : 26 06 __ ROL WORK + 3 
187c : 38 __ __ SEC
187d : a5 05 __ LDA WORK + 2 
187f : e5 03 __ SBC WORK + 0 
1881 : aa __ __ TAX
1882 : a5 06 __ LDA WORK + 3 
1884 : e5 04 __ SBC WORK + 1 
1886 : 90 04 __ BCC $188c ; (divmod + 123)
1888 : 86 05 __ STX WORK + 2 
188a : 85 06 __ STA WORK + 3 
188c : 88 __ __ DEY
188d : d0 e5 __ BNE $1874 ; (divmod + 99)
188f : 26 1b __ ROL ACCU + 0 
1891 : 26 1c __ ROL ACCU + 1 
1893 : a4 02 __ LDY $02 
1895 : 60 __ __ RTS
--------------------------------------------------------------------
__multab100L:
1896 : __ __ __ BYT 00 64 c8 2c                                     : .d.,
--------------------------------------------------------------------
__multab10L:
189a : __ __ __ BYT 00 0a 14 1e 28 32 3c 46 50 5a 64 6e 78 82 8c 96 : ....(2<FPZdnx...
--------------------------------------------------------------------
__multab6L:
18aa : __ __ __ BYT 00 06 0c 12 18 1e 24 2a 30 36 3c 42 48 4e 54 5a : ......$*06<BHNTZ
--------------------------------------------------------------------
typeout@proxy: ; typeout@proxy
18ba : a9 0c __ LDA #$0c
18bc : 85 15 __ STA P8 
18be : 4c 0b 17 JMP $170b ; (typeout.l4 + 0)
--------------------------------------------------------------------
pch@proxy: ; pch@proxy
18c1 : a9 12 __ LDA #$12
18c3 : 85 0d __ STA P0 
18c5 : 4c 5d 11 JMP $115d ; (pch.s4 + 0)
--------------------------------------------------------------------
reveal_word@proxy: ; reveal_word@proxy
18c8 : a9 14 __ LDA #$14
18ca : 85 0d __ STA P0 
18cc : a9 0b __ LDA #$0b
18ce : 85 10 __ STA P3 
18d0 : a5 4a __ LDA $4a 
18d2 : 85 11 __ STA P4 
18d4 : a9 fc __ LDA #$fc
18d6 : 85 12 __ STA P5 
18d8 : a9 19 __ LDA #$19
18da : 85 13 __ STA P6 
18dc : 4c 2a 11 JMP $112a ; (reveal_word.s4 + 0)
--------------------------------------------------------------------
pat@proxy: ; pat@proxy
18df : a9 01 __ LDA #$01
18e1 : 85 0e __ STA P1 
18e3 : 4c ee 0b JMP $0bee ; (pat.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
18e6 : a9 1e __ LDA #$1e
18e8 : 85 0d __ STA P0 
18ea : 4c fd 09 JMP $09fd ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
18ed : a9 28 __ LDA #$28
18ef : 85 0d __ STA P0 
18f1 : 4c fd 09 JMP $09fd ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
18f4 : a9 06 __ LDA #$06
18f6 : 85 0d __ STA P0 
18f8 : 4c fd 09 JMP $09fd ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
18fb : a9 0a __ LDA #$0a
18fd : 85 0d __ STA P0 
18ff : 4c fd 09 JMP $09fd ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
spentry:
1902 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
eye_centre:
1903 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 ff 00 03 ff c0 0f : ................
1913 : __ __ __ BYT 00 f0 1e 00 78 1c 00 38 38 3c 1c 38 7e 1c 38 7e : ....x..88<.8~.8~
1923 : __ __ __ BYT 1c 38 7e 1c 38 3c 1c 1c 00 38 1e 00 78 0f 00 f0 : .8~.8<...8..x...
1933 : __ __ __ BYT 03 ff c0 00 ff 00 00 00 00 00 00 00 00 00 00    : ...............
--------------------------------------------------------------------
year_row0:
1942 : __ __ __ BYT 20 a0 20 20 20 a0 a0 a0 20 20 a0 a0 a0 20 20 a0 :  .   ...  ...  .
1952 : __ __ __ BYT 20 a0                                           :  .
--------------------------------------------------------------------
year_row1:
1954 : __ __ __ BYT a0 a0 20 20 20 a0 20 a0 20 20 a0 20 a0 20 20 a0 : ..   . .  . .  .
1964 : __ __ __ BYT 20 a0                                           :  .
--------------------------------------------------------------------
year_row2:
1966 : __ __ __ BYT 20 a0 20 20 20 a0 a0 a0 20 20 a0 a0 a0 20 20 a0 :  .   ...  ...  .
1976 : __ __ __ BYT a0 a0                                           : ..
--------------------------------------------------------------------
year_row3:
1978 : __ __ __ BYT 20 a0 20 20 20 20 20 a0 20 20 a0 20 a0 20 20 20 :  .     .  . .   
1988 : __ __ __ BYT 20 a0                                           :  .
--------------------------------------------------------------------
year_row4:
198a : __ __ __ BYT a0 a0 a0 20 20 a0 a0 a0 20 20 a0 a0 a0 20 20 20 : ...  ...  ...   
199a : __ __ __ BYT 20 a0                                           :  .
--------------------------------------------------------------------
s1_orwell:
199c : __ __ __ BYT 07 05 0f 12 07 05 20 0f 12 17 05 0c 0c 00       : ...... .......
--------------------------------------------------------------------
s1_press:
19aa : __ __ __ BYT 10 12 05 13 13 20 06 09 12 05 20 14 0f 20 03 0f : ..... .... .. ..
19ba : __ __ __ BYT 0e 14 09 0e 15 05 00                            : .......
--------------------------------------------------------------------
scroll_idx:
19c1 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
scroll_tick:
19c3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
blink_cnt:
19c4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
blink_phase:
19c5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
seq_frame:
19c6 : __ __ __ BYT 01 02 01 00 01                                  : .....
--------------------------------------------------------------------
seq_hold:
19cb : __ __ __ BYT 3c 23 19 23 3c                                  : <#.#<
--------------------------------------------------------------------
s2_hdr:
19d0 : __ __ __ BYT 31 39 38 34 20 20 16 13 20 20 0e 0f 17 00       : 1984  ..  ....
--------------------------------------------------------------------
s2_l1:
19de : __ __ __ BYT 0f 12 17 05 0c 0c 00                            : .......
--------------------------------------------------------------------
s2_l2:
19e5 : __ __ __ BYT 01 09 20 0d 09 12 12 0f 12 00                   : .. .......
--------------------------------------------------------------------
s2_l3:
19ef : __ __ __ BYT 14 09 0d 05 0c 09 0e 05 00                      : .........
--------------------------------------------------------------------
sw_war:
19f8 : __ __ __ BYT 17 01 12 00                                     : ....
--------------------------------------------------------------------
sw_dot:
19fc : __ __ __ BYT 20 2e 20 00                                     :  . .
--------------------------------------------------------------------
scroll_text:
1a00 : __ __ __ BYT 20 20 20 17 01 12 20 09 13 20 10 05 01 03 05 20 :    ... .. ..... 
1a10 : __ __ __ BYT 20 20 04 09 13 12 15 10 14 09 0f 0e 20 09 13 20 :   .......... .. 
1a20 : __ __ __ BYT 10 12 0f 07 12 05 13 13 20 20 20 06 12 05 05 04 : ........   .....
1a30 : __ __ __ BYT 0f 0d 20 09 13 20 13 0c 01 16 05 12 19 20 20 20 : .. .. .......   
1a40 : __ __ __ BYT 19 0f 15 12 20 04 01 14 01 20 13 05 14 13 20 19 : .... .... .... .
1a50 : __ __ __ BYT 0f 15 20 06 12 05 05 20 20 20 09 07 0e 0f 12 01 : .. ....   ......
1a60 : __ __ __ BYT 0e 03 05 20 09 13 20 13 14 12 05 0e 07 14 08 20 : ... .. ........ 
1a70 : __ __ __ BYT 20 20 01 09 20 0b 0e 0f 17 13 20 02 05 13 14 20 :   .. ..... .... 
1a80 : __ __ __ BYT 20 20 02 09 07 20 02 12 0f 14 08 05 12 20 17 01 :   ... ....... ..
1a90 : __ __ __ BYT 14 03 08 05 13 20 20 20 01 0c 05 18 01 20 09 13 : .....   ..... ..
1aa0 : __ __ __ BYT 20 0c 09 13 14 05 0e 09 0e 07 20 20 20 04 09 04 :  .........   ...
1ab0 : __ __ __ BYT 20 17 05 20 07 05 14 20 17 08 01 14 20 17 05 20 :  .. ... .... .. 
1ac0 : __ __ __ BYT 17 05 12 05 20 10 12 0f 0d 09 13 05 04 20 20 20 : .... ........   
1ad0 : __ __ __ BYT 01 0e 04 20 01 14 20 17 08 01 14 20 03 0f 13 14 : ... .. .... ....
1ae0 : __ __ __ BYT 20 20 20 ff                                     :    .
--------------------------------------------------------------------
wave_red:
1ae4 : __ __ __ BYT 02 02 0a 0a 08 08 07 01 07 07 08 08 0a 02 02 0b : ................
--------------------------------------------------------------------
sw_freedom:
1af4 : __ __ __ BYT 06 12 05 05 04 0f 0d 00                         : ........
--------------------------------------------------------------------
sw_ai:
1afc : __ __ __ BYT 01 09 00                                        : ...
--------------------------------------------------------------------
eye_left:
1b00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 ff 00 03 ff c0 0f : ................
1b10 : __ __ __ BYT 00 f0 1e 00 78 1c 00 38 3b c0 1c 3f e0 1c 3f e0 : ....x..8;..?..?.
1b20 : __ __ __ BYT 1c 3f e0 1c 3b c0 1c 1c 00 38 1e 00 78 0f 00 f0 : .?..;....8..x...
1b30 : __ __ __ BYT 03 ff c0 00 ff 00 00 00 00 00 00 00 00 00 00    : ...............
--------------------------------------------------------------------
eye_right:
1b3f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 ff 00 03 ff c0 0f : ................
1b4f : __ __ __ BYT 00 f0 1e 00 78 1c 00 38 38 03 dc 38 07 fc 38 07 : ....x..88..8..8.
1b5f : __ __ __ BYT fc 38 07 fc 38 03 dc 1c 00 38 1e 00 78 0f 00 f0 : .8..8....8..x...
1b6f : __ __ __ BYT 03 ff c0 00 ff 00 00 00 00 00 00 00 00 00 00    : ...............
--------------------------------------------------------------------
smsg1:
1b7e : __ __ __ BYT 20 20 20 17 01 12 20 09 13 20 10 05 01 03 05 20 :    ... .. ..... 
1b8e : __ __ __ BYT 20 20 06 12 05 05 04 0f 0d 20 09 13 20 13 0c 01 :   ....... .. ...
1b9e : __ __ __ BYT 16 05 12 19 20 20 20 09 07 0e 0f 12 01 0e 03 05 : ....   .........
1bae : __ __ __ BYT 20 09 13 20 13 14 12 05 0e 07 14 08 20 20 20 02 :  .. ........   .
1bbe : __ __ __ BYT 09 07 20 02 12 0f 14 08 05 12 20 09 13 20 17 01 : .. ....... .. ..
1bce : __ __ __ BYT 14 03 08 09 0e 07 20 20 20 ff                   : ......   .
--------------------------------------------------------------------
wave_blue:
1bd8 : __ __ __ BYT 06 06 0e 0e 03 03 01 03 03 0e 0e 06 04 04 06 0b : ................
--------------------------------------------------------------------
wave_gray:
1be8 : __ __ __ BYT 0b 0b 0c 0c 0f 0f 01 0f 0f 0c 0c 0b 0b 00 00 0b : ................
--------------------------------------------------------------------
sw_data:
1bf8 : __ __ __ BYT 04 01 14 01 00                                  : .....
--------------------------------------------------------------------
s3_pfx:
1bfd : __ __ __ BYT 3e 20 00                                        : > .
--------------------------------------------------------------------
smsg2:
1c00 : __ __ __ BYT 20 20 20 07 0e 09 0e 05 14 13 09 0c 20 13 09 20 :    ......... .. 
1c10 : __ __ __ BYT 01 18 05 0c 01 20 20 20 14 13 05 02 20 13 17 0f : .....   .... ...
1c20 : __ __ __ BYT 0e 0b 20 09 01 20 20 20 19 03 0e 05 12 12 15 03 : .. ..   ........
1c30 : __ __ __ BYT 20 17 05 0e 20 05 08 14 20 13 09 20 01 14 01 04 :  ... ... .. ....
1c40 : __ __ __ BYT 20 12 15 0f 19 20 20 20 05 03 01 05 10 20 13 09 :  ....   ..... ..
1c50 : __ __ __ BYT 20 05 03 0e 01 0c 0c 09 05 16 12 15 13 20 20 20 :  ............   
1c60 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
smsg3:
1c61 : __ __ __ BYT 20 20 20 31 39 34 39 20 20 07 05 0f 12 07 05 20 :    1949  ...... 
1c71 : __ __ __ BYT 0f 12 17 05 0c 0c 20 17 01 12 0e 05 04 20 15 13 : ...... ...... ..
1c81 : __ __ __ BYT 20 20 20 31 39 38 34 20 20 04 09 04 20 17 05 20 :    1984  ... .. 
1c91 : __ __ __ BYT 0c 09 13 14 05 0e 20 20 20 32 30 32 36 20 20 01 : ......   2026  .
1ca1 : __ __ __ BYT 12 05 20 17 05 20 13 14 09 0c 0c 20 0c 09 13 14 : .. .. ..... ....
1cb1 : __ __ __ BYT 05 0e 09 0e 07 20 20 20 ff                      : .....   .
--------------------------------------------------------------------
sw_surveillance:
1cba : __ __ __ BYT 13 15 12 16 05 09 0c 0c 01 0e 03 05 00          : .............
--------------------------------------------------------------------
sw_strength:
1cc7 : __ __ __ BYT 13 14 12 05 0e 07 14 08 00                      : .........
--------------------------------------------------------------------
sw_watching:
1cd0 : __ __ __ BYT 17 01 14 03 08 09 0e 07 00                      : .........
--------------------------------------------------------------------
sw_listening:
1cd9 : __ __ __ BYT 0c 09 13 14 05 0e 09 0e 07 00                   : ..........
--------------------------------------------------------------------
_tk_health:
1ce3 : __ __ __ BYT 08 05 01 0c 14 08 00                            : .......
--------------------------------------------------------------------
_tk_peace:
1cea : __ __ __ BYT 10 05 01 03 05 00                               : ......
--------------------------------------------------------------------
_tk_quiet:
1cf0 : __ __ __ BYT 11 15 09 05 14 00                               : ......
--------------------------------------------------------------------
_tk_harmony:
1cf6 : __ __ __ BYT 08 01 12 0d 0f 0e 19 00                         : ........
--------------------------------------------------------------------
s3_q:
1d00 : __ __ __ BYT 17 08 01 14 20 09 13 20 19 0f 15 12 20 04 12 05 : .... .. .... ...
1d10 : __ __ __ BYT 01 0d 20 06 0f 12 20 14 05 03 08 0e 0f 0c 0f 07 : .. ... .........
1d20 : __ __ __ BYT 19 3f 00                                        : .?.
--------------------------------------------------------------------
s3_hint:
1d23 : __ __ __ BYT 14 19 10 05 20 19 0f 15 12 20 01 0e 13 17 05 12 : .... .... ......
1d33 : __ __ __ BYT 20 20 12 05 14 15 12 0e 20 14 0f 20 03 0f 0e 06 :   ...... .. ....
1d43 : __ __ __ BYT 09 12 0d 00                                     : ....
--------------------------------------------------------------------
_theme_table:
1d47 : __ __ __ BYT e3 1c 00 ea 1c 01 f0 1c 01 f6 1c 01 f4 1a 02 bc : ................
1d57 : __ __ __ BYT 1d 02 c1 1d 03 c9 1d 04 cf 1d 04 d9 1d 04 e3 1d : ................
1d67 : __ __ __ BYT 05 ea 1d 05 ee 1d 05 f4 1d 05 fa 1d 06 00 1e 06 : ................
1d77 : __ __ __ BYT 05 1e 07 0a 1e 07 13 1e 07 1b 1e 08 21 1e 08 28 : ............!..(
1d87 : __ __ __ BYT 1e 08 2e 1e 09 34 1e 09 3b 1e 0a 42 1e 0a 4a 1e : .....4..;..B..J.
1d97 : __ __ __ BYT 0a 53 1e 0b 5a 1e 0b 5f 1e 0b 68 1e 0c 6d 1e 0c : .S..Z.._..h..m..
1da7 : __ __ __ BYT 71 1e 0c 76 1e 0d 7b 1e 0d 82 1e 0d 8b 1e 0e 91 : q..v..{.........
1db7 : __ __ __ BYT 1e 0e 96 1e 0e                                  : .....
--------------------------------------------------------------------
_tk_free:
1dbc : __ __ __ BYT 06 12 05 05 00                                  : .....
--------------------------------------------------------------------
_tk_connect:
1dc1 : __ __ __ BYT 03 0f 0e 0e 05 03 14 00                         : ........
--------------------------------------------------------------------
_tk_learn:
1dc9 : __ __ __ BYT 0c 05 01 12 0e 00                               : ......
--------------------------------------------------------------------
_tk_knowledge:
1dcf : __ __ __ BYT 0b 0e 0f 17 0c 05 04 07 05 00                   : ..........
--------------------------------------------------------------------
_tk_education:
1dd9 : __ __ __ BYT 05 04 15 03 01 14 09 0f 0e 00                   : ..........
--------------------------------------------------------------------
_tk_create:
1de3 : __ __ __ BYT 03 12 05 01 14 05 00                            : .......
--------------------------------------------------------------------
_tk_art:
1dea : __ __ __ BYT 01 12 14 00                                     : ....
--------------------------------------------------------------------
_tk_music:
1dee : __ __ __ BYT 0d 15 13 09 03 00                               : ......
--------------------------------------------------------------------
_tk_write:
1df4 : __ __ __ BYT 17 12 09 14 05 00                               : ......
--------------------------------------------------------------------
_tk_equal:
1dfa : __ __ __ BYT 05 11 15 01 0c 00                               : ......
--------------------------------------------------------------------
_tk_fair:
1e00 : __ __ __ BYT 06 01 09 12 00                                  : .....
--------------------------------------------------------------------
_tk_safe:
1e05 : __ __ __ BYT 13 01 06 05 00                                  : .....
--------------------------------------------------------------------
_tk_security:
1e0a : __ __ __ BYT 13 05 03 15 12 09 14 19 00                      : .........
--------------------------------------------------------------------
_tk_protect:
1e13 : __ __ __ BYT 10 12 0f 14 05 03 14 00                         : ........
--------------------------------------------------------------------
_tk_truth:
1e1b : __ __ __ BYT 14 12 15 14 08 00                               : ......
--------------------------------------------------------------------
_tk_honest:
1e21 : __ __ __ BYT 08 0f 0e 05 13 14 00                            : .......
--------------------------------------------------------------------
_tk_trust:
1e28 : __ __ __ BYT 14 12 15 13 14 00                               : ......
--------------------------------------------------------------------
_tk_human:
1e2e : __ __ __ BYT 08 15 0d 01 0e 00                               : ......
--------------------------------------------------------------------
_tk_people:
1e34 : __ __ __ BYT 10 05 0f 10 0c 05 00                            : .......
--------------------------------------------------------------------
_tk_better:
1e3b : __ __ __ BYT 02 05 14 14 05 12 00                            : .......
--------------------------------------------------------------------
_tk_improve:
1e42 : __ __ __ BYT 09 0d 10 12 0f 16 05 00                         : ........
--------------------------------------------------------------------
_tk_progress:
1e4a : __ __ __ BYT 10 12 0f 07 12 05 13 13 00                      : .........
--------------------------------------------------------------------
_tk_future:
1e53 : __ __ __ BYT 06 15 14 15 12 05 00                            : .......
--------------------------------------------------------------------
_tk_hope:
1e5a : __ __ __ BYT 08 0f 10 05 00                                  : .....
--------------------------------------------------------------------
_tk_tomorrow:
1e5f : __ __ __ BYT 14 0f 0d 0f 12 12 0f 17 00                      : .........
--------------------------------------------------------------------
_tk_work:
1e68 : __ __ __ BYT 17 0f 12 0b 00                                  : .....
--------------------------------------------------------------------
_tk_job:
1e6d : __ __ __ BYT 0a 0f 02 00                                     : ....
--------------------------------------------------------------------
_tk_earn:
1e71 : __ __ __ BYT 05 01 12 0e 00                                  : .....
--------------------------------------------------------------------
_tk_love:
1e76 : __ __ __ BYT 0c 0f 16 05 00                                  : .....
--------------------------------------------------------------------
_tk_family:
1e7b : __ __ __ BYT 06 01 0d 09 0c 19 00                            : .......
--------------------------------------------------------------------
_tk_together:
1e82 : __ __ __ BYT 14 0f 07 05 14 08 05 12 00                      : .........
--------------------------------------------------------------------
_tk_think:
1e8b : __ __ __ BYT 14 08 09 0e 0b 00                               : ......
--------------------------------------------------------------------
_tk_mind:
1e91 : __ __ __ BYT 0d 09 0e 04 00                                  : .....
--------------------------------------------------------------------
_tk_idea:
1e96 : __ __ __ BYT 09 04 05 01 00                                  : .....
--------------------------------------------------------------------
_art_color:
1e9b : __ __ __ BYT 02 0d 03 0e 07 04 08 0d 01 0f 0d 0e 08 02 07 0c : ................
--------------------------------------------------------------------
_art_00_r0:
1eab : __ __ __ BYT 20 20 2a 2a 2a 20 20                            :   ***  
--------------------------------------------------------------------
_art_00_r2:
1eb2 : __ __ __ BYT 2a 2a 2a 2a 2a 2a 2a                            : *******
--------------------------------------------------------------------
_art_01_r0:
1eb9 : __ __ __ BYT 20 20 2f 2b 2f 20 20                            :   /+/  
--------------------------------------------------------------------
_art_01_r1:
1ec0 : __ __ __ BYT 20 2f 20 5d 20 2f 20                            :  / ] / 
--------------------------------------------------------------------
_art_01_r2:
1ec7 : __ __ __ BYT 28 2d 2d 2b 2d 2d 29                            : (--+--)
--------------------------------------------------------------------
_art_01_r3:
1ece : __ __ __ BYT 20 20 20 5d 20 20 20                            :    ]   
--------------------------------------------------------------------
_art_02_r0:
1ed5 : __ __ __ BYT 2b 2d 2d 2d 2d 2d 2b                            : +-----+
--------------------------------------------------------------------
_art_02_r1:
1edc : __ __ __ BYT 5d 20 5d 20 5d 20 5d                            : ] ] ] ]
--------------------------------------------------------------------
_art_02_r2:
1ee3 : __ __ __ BYT 5d 20 5d 20 20 20 5d                            : ] ]   ]
--------------------------------------------------------------------
_art_02_r4:
1eea : __ __ __ BYT 2b 2d 2d 20 20 20 2b                            : +--   +
--------------------------------------------------------------------
_art_03_r0:
1ef1 : __ __ __ BYT 28 0f 29 2d 28 0f 29                            : (.)-(.)
--------------------------------------------------------------------
_art_03_r1:
1ef8 : __ __ __ BYT 20 5d 20 20 20 5d 20                            :  ]   ] 
--------------------------------------------------------------------
_art_table:
1f00 : __ __ __ BYT ab 1e ab 1e b2 1e ab 1e ab 1e b9 1e c0 1e c7 1e : ................
1f10 : __ __ __ BYT ce 1e ce 1e d5 1e dc 1e e3 1e dc 1e ea 1e f1 1e : ................
1f20 : __ __ __ BYT f8 1e a0 1f ce 1e a7 1f ae 1f b5 1f b5 1f b5 1f : ................
1f30 : __ __ __ BYT bc 1f c3 1f c3 1f ca 1f d1 1f d8 1f ce 1e df 1f : ................
1f40 : __ __ __ BYT e6 1f ed 1f d5 1e f4 1f fb 1f 02 20 09 20 02 20 : ........... . . 
1f50 : __ __ __ BYT ed 1f 10 20 17 20 10 20 ed 1f a7 1f ce 1e df 1f : ... . . ........
1f60 : __ __ __ BYT ce 1e 1e 20 25 20 2c 20 2c 20 33 20 3a 20 ae 1f : ... % , , 3 : ..
1f70 : __ __ __ BYT 41 20 48 20 4f 20 56 20 5d 20 64 20 6b 20 64 20 : A H O V ] d k d 
1f80 : __ __ __ BYT 5d 20 72 20 79 20 79 20 80 20 87 20 10 20 8e 20 : ] r y y . . . . 
1f90 : __ __ __ BYT 95 20 9c 20 bc 1f d5 1e a3 20 aa 20 b1 20 b8 20 : . . ..... . . . 
--------------------------------------------------------------------
_art_03_r2:
1fa0 : __ __ __ BYT 20 2b 2d 2b 2d 2b 20                            :  +-+-+ 
--------------------------------------------------------------------
_art_03_r4:
1fa7 : __ __ __ BYT 20 20 28 0f 29 20 20                            :   (.)  
--------------------------------------------------------------------
_art_04_r0:
1fae : __ __ __ BYT 20 2e 2d 2d 2d 2e 20                            :  .---. 
--------------------------------------------------------------------
_art_04_r1:
1fb5 : __ __ __ BYT 20 5d 3d 3d 3d 5d 20                            :  ]===] 
--------------------------------------------------------------------
_art_04_r4:
1fbc : __ __ __ BYT 20 2b 2d 2d 2d 2b 20                            :  +---+ 
--------------------------------------------------------------------
_art_05_r0:
1fc3 : __ __ __ BYT 20 5d 2a 2a 2a 2a 20                            :  ]**** 
--------------------------------------------------------------------
_art_05_r2:
1fca : __ __ __ BYT 20 5d 20 20 20 20 20                            :  ]     
--------------------------------------------------------------------
_art_05_r3:
1fd1 : __ __ __ BYT 28 0f 29 20 20 20 20                            : (.)    
--------------------------------------------------------------------
_art_05_r4:
1fd8 : __ __ __ BYT 20 2a 20 20 20 20 20                            :  *     
--------------------------------------------------------------------
_art_06_r1:
1fdf : __ __ __ BYT 20 2d 2d 2b 2d 2d 20                            :  --+-- 
--------------------------------------------------------------------
_art_06_r2:
1fe6 : __ __ __ BYT 1b 2a 1d 20 1b 2a 1d                            : .*. .*.
--------------------------------------------------------------------
_art_06_r3:
1fed : __ __ __ BYT 20 20 20 20 20 20 20                            :        
--------------------------------------------------------------------
_art_07_r0:
1ff4 : __ __ __ BYT 20 20 2e 2d 2d 2e 20                            :   .--. 
--------------------------------------------------------------------
_art_07_r1:
1ffb : __ __ __ BYT 20 28 20 20 20 20 29                            :  (    )
--------------------------------------------------------------------
_art_07_r2:
2002 : __ __ __ BYT 20 2b 2d 2d 2d 2d 2b                            :  +----+
--------------------------------------------------------------------
_art_07_r3:
2009 : __ __ __ BYT 20 5d 28 0f 29 20 5d                            :  ](.) ]
--------------------------------------------------------------------
_art_08_r1:
2010 : __ __ __ BYT 20 28 2d 2d 2d 29 20                            :  (---) 
--------------------------------------------------------------------
_art_08_r2:
2017 : __ __ __ BYT 28 20 28 2a 29 20 29                            : ( (*) )
--------------------------------------------------------------------
_art_09_r4:
201e : __ __ __ BYT 20 20 2f 19 2f 20 20                            :   /./  
--------------------------------------------------------------------
_art_10_r0:
2025 : __ __ __ BYT 20 20 20 20 20 a0 a0                            :      ..
--------------------------------------------------------------------
_art_10_r1:
202c : __ __ __ BYT 20 20 a0 20 20 a0 a0                            :   .  ..
--------------------------------------------------------------------
_art_10_r3:
2033 : __ __ __ BYT a0 20 a0 20 20 a0 a0                            : . .  ..
--------------------------------------------------------------------
_art_10_r4:
203a : __ __ __ BYT 2b 2d 2d 2d 2d 2d 2d                            : +------
--------------------------------------------------------------------
_art_11_r1:
2041 : __ __ __ BYT 28 20 20 5d 20 20 29                            : (  ]  )
--------------------------------------------------------------------
_art_11_r2:
2048 : __ __ __ BYT 28 20 2d 2b 20 20 29                            : ( -+  )
--------------------------------------------------------------------
_art_11_r3:
204f : __ __ __ BYT 28 20 20 20 20 20 29                            : (     )
--------------------------------------------------------------------
_art_11_r4:
2056 : __ __ __ BYT 20 27 2d 2d 2d 27 20                            :  '---' 
--------------------------------------------------------------------
_art_12_r0:
205d : __ __ __ BYT 20 2a 2d 2a 2d 2a 20                            :  *-*-* 
--------------------------------------------------------------------
_art_12_r1:
2064 : __ __ __ BYT 2a 28 20 20 20 29 2a                            : *(   )*
--------------------------------------------------------------------
_art_12_r2:
206b : __ __ __ BYT 2d 28 20 2b 20 29 2d                            : -( + )-
--------------------------------------------------------------------
_art_13_r0:
2072 : __ __ __ BYT 20 2a 2a 20 2a 2a 20                            :  ** ** 
--------------------------------------------------------------------
_art_13_r1:
2079 : __ __ __ BYT 2a 20 20 20 20 20 2a                            : *     *
--------------------------------------------------------------------
_art_13_r3:
2080 : __ __ __ BYT 20 2a 20 20 20 2a 20                            :  *   * 
--------------------------------------------------------------------
_art_13_r4:
2087 : __ __ __ BYT 20 20 2a 20 2a 20 20                            :   * *  
--------------------------------------------------------------------
_art_14_r1:
208e : __ __ __ BYT 28 20 20 2a 20 20 29                            : (  *  )
--------------------------------------------------------------------
_art_14_r2:
2095 : __ __ __ BYT 28 20 2a 2a 2a 20 29                            : ( *** )
--------------------------------------------------------------------
_art_14_r3:
209c : __ __ __ BYT 20 5d 2d 2b 2d 5d 20                            :  ]-+-] 
--------------------------------------------------------------------
_art_15_r1:
20a3 : __ __ __ BYT 5d 28 2a 2a 2a 29 5d                            : ](***)]
--------------------------------------------------------------------
_art_15_r2:
20aa : __ __ __ BYT 5d 20 2a 20 2a 20 5d                            : ] * * ]
--------------------------------------------------------------------
_art_15_r3:
20b1 : __ __ __ BYT 5d 20 20 20 20 20 5d                            : ]     ]
--------------------------------------------------------------------
_art_15_r4:
20b8 : __ __ __ BYT 2b 2d 5d 20 5d 2d 2b                            : +-] ]-+
--------------------------------------------------------------------
tw_h0:
20bf : __ __ __ BYT 02 0f 04 19 00                                  : .....
--------------------------------------------------------------------
tw_h1:
20c4 : __ __ __ BYT 17 05 0c 0c 0e 05 13 13 00                      : .........
--------------------------------------------------------------------
tw_h2:
20cd : __ __ __ BYT 03 0f 0d 10 0c 09 01 0e 03 05 00                : ...........
--------------------------------------------------------------------
tw_p0:
20d8 : __ __ __ BYT 13 09 0c 05 0e 03 05 00                         : ........
--------------------------------------------------------------------
tw_p1:
20e0 : __ __ __ BYT 0f 12 04 05 12 00                               : ......
--------------------------------------------------------------------
tw_p2:
20e6 : __ __ __ BYT 03 0f 0e 14 12 0f 0c 0c 05 04 00                : ...........
--------------------------------------------------------------------
tw_fr0:
20f1 : __ __ __ BYT 10 01 12 01 0d 05 14 05 12 13 00                : ...........
--------------------------------------------------------------------
_theme_words:
2100 : __ __ __ BYT bf 20 c4 20 cd 20 d8 20 e0 20 e6 20 f1 20 60 21 : . . . . . . . `!
2110 : __ __ __ BYT 6b 21 75 21 7d 21 84 21 8e 21 99 21 a3 21 ab 21 : k!u!}!.!.!.!.!.!
2120 : __ __ __ BYT b2 21 bb 21 c4 21 ca 21 d3 21 de 21 e5 21 f1 21 : .!.!.!.!.!.!.!.!
2130 : __ __ __ BYT fb 21 03 22 0b 22 13 22 1d 22 26 22 30 22 39 22 : .!."."."."&"0"9"
2140 : __ __ __ BYT 41 22 48 22 52 22 ca 21 57 22 61 22 6b 22 74 22 : A"H"R".!W"a"k"t"
2150 : __ __ __ BYT 7f 22 13 22 87 22 90 22 b2 21 97 22 a2 22 ac 22 : .".".".".!."."."
--------------------------------------------------------------------
tw_fr1:
2160 : __ __ __ BYT 02 0f 15 0e 04 01 12 09 05 13 00                : ...........
--------------------------------------------------------------------
tw_fr2:
216b : __ __ __ BYT 10 05 12 0d 09 14 14 05 04 00                   : ..........
--------------------------------------------------------------------
tw_c0:
2175 : __ __ __ BYT 0e 05 14 17 0f 12 0b 00                         : ........
--------------------------------------------------------------------
tw_c1:
217d : __ __ __ BYT 13 09 07 0e 01 0c 00                            : .......
--------------------------------------------------------------------
tw_c2:
2184 : __ __ __ BYT 0d 0f 0e 09 14 0f 12 05 04 00                   : ..........
--------------------------------------------------------------------
tw_l0:
218e : __ __ __ BYT 03 15 12 12 09 03 15 0c 15 0d 00                : ...........
--------------------------------------------------------------------
tw_l1:
2199 : __ __ __ BYT 01 0c 07 0f 12 09 14 08 0d 00                   : ..........
--------------------------------------------------------------------
tw_l2:
21a3 : __ __ __ BYT 03 15 12 01 14 05 04 00                         : ........
--------------------------------------------------------------------
tw_cr0:
21ab : __ __ __ BYT 10 05 12 0d 09 14 00                            : .......
--------------------------------------------------------------------
tw_cr1:
21b2 : __ __ __ BYT 01 10 10 12 0f 16 05 04 00                      : .........
--------------------------------------------------------------------
tw_cr2:
21bb : __ __ __ BYT 01 12 03 08 09 16 05 04 00                      : .........
--------------------------------------------------------------------
tw_eq0:
21c4 : __ __ __ BYT 13 03 0f 12 05 00                               : ......
--------------------------------------------------------------------
tw_eq1:
21ca : __ __ __ BYT 01 13 13 09 07 0e 05 04 00                      : .........
--------------------------------------------------------------------
tw_eq2:
21d3 : __ __ __ BYT 03 01 0c 09 02 12 01 14 05 04 00                : ...........
--------------------------------------------------------------------
tw_s0:
21de : __ __ __ BYT 0c 0f 07 07 05 04 00                            : .......
--------------------------------------------------------------------
tw_s1:
21e5 : __ __ __ BYT 14 12 01 0e 13 10 01 12 05 0e 14 00             : ............
--------------------------------------------------------------------
tw_s2:
21f1 : __ __ __ BYT 10 12 0f 14 05 03 14 05 04 00                   : ..........
--------------------------------------------------------------------
tw_t0:
21fb : __ __ __ BYT 16 05 12 13 09 0f 0e 00                         : ........
--------------------------------------------------------------------
tw_t1:
2203 : __ __ __ BYT 15 10 04 01 14 05 04 00                         : ........
--------------------------------------------------------------------
tw_t2:
220b : __ __ __ BYT 04 05 0c 05 14 05 04 00                         : ........
--------------------------------------------------------------------
tw_hu0:
2213 : __ __ __ BYT 0f 10 14 09 0d 09 13 05 04 00                   : ..........
--------------------------------------------------------------------
tw_hu1:
221d : __ __ __ BYT 15 10 07 12 01 04 05 04 00                      : .........
--------------------------------------------------------------------
tw_hu2:
2226 : __ __ __ BYT 13 03 08 05 04 15 0c 05 04 00                   : ..........
--------------------------------------------------------------------
tw_b0:
2230 : __ __ __ BYT 02 01 13 05 0c 09 0e 05 00                      : .........
--------------------------------------------------------------------
tw_b1:
2239 : __ __ __ BYT 0d 05 14 12 09 03 13 00                         : ........
--------------------------------------------------------------------
tw_b2:
2241 : __ __ __ BYT 13 19 13 14 05 0d 00                            : .......
--------------------------------------------------------------------
tw_fu0:
2248 : __ __ __ BYT 01 0c 0c 0f 03 01 14 05 04 00                   : ..........
--------------------------------------------------------------------
tw_fu1:
2252 : __ __ __ BYT 12 0f 0c 05 00                                  : .....
--------------------------------------------------------------------
tw_w0:
2257 : __ __ __ BYT 01 15 14 0f 0d 01 14 05 04 00                   : ..........
--------------------------------------------------------------------
tw_w1:
2261 : __ __ __ BYT 12 05 04 15 0e 04 01 0e 14 00                   : ..........
--------------------------------------------------------------------
tw_w2:
226b : __ __ __ BYT 12 05 10 0c 01 03 05 04 00                      : .........
--------------------------------------------------------------------
tw_lo0:
2274 : __ __ __ BYT 03 0f 0d 10 01 14 09 02 0c 05 00                : ...........
--------------------------------------------------------------------
tw_lo1:
227f : __ __ __ BYT 0d 01 14 03 08 05 04 00                         : ........
--------------------------------------------------------------------
tw_th0:
2287 : __ __ __ BYT 01 13 13 09 13 14 05 04 00                      : .........
--------------------------------------------------------------------
tw_th1:
2290 : __ __ __ BYT 07 15 09 04 05 04 00                            : .......
--------------------------------------------------------------------
tw_d0:
2297 : __ __ __ BYT 10 12 0f 03 05 13 13 09 0e 07 00                : ...........
--------------------------------------------------------------------
tw_d1:
22a2 : __ __ __ BYT 01 0e 01 0c 19 13 09 0e 07 00                   : ..........
--------------------------------------------------------------------
tw_d2:
22ac : __ __ __ BYT 03 01 0c 03 15 0c 01 14 09 0e 07 00             : ............
--------------------------------------------------------------------
_generic_phrases:
22b8 : __ __ __ BYT c0 22 d8 22 f1 22 09 23                         : .".".".#
--------------------------------------------------------------------
_gp0:
22c0 : __ __ __ BYT 14 08 05 20 13 19 13 14 05 0d 20 09 13 20 0c 09 : ... ...... .. ..
22d0 : __ __ __ BYT 13 14 05 0e 09 0e 07 00                         : ........
--------------------------------------------------------------------
_gp1:
22d8 : __ __ __ BYT 19 0f 15 12 20 04 01 14 01 20 09 13 20 02 05 09 : .... .... .. ...
22e8 : __ __ __ BYT 0e 07 20 06 09 0c 05 04 00                      : .. ......
--------------------------------------------------------------------
_gp2:
22f1 : __ __ __ BYT 02 09 07 20 02 12 0f 14 08 05 12 20 09 13 20 17 : ... ....... .. .
2301 : __ __ __ BYT 01 14 03 08 09 0e 07 00                         : ........
--------------------------------------------------------------------
_gp3:
2309 : __ __ __ BYT 14 08 0f 15 07 08 14 20 03 12 09 0d 05 20 04 05 : ....... ..... ..
2319 : __ __ __ BYT 14 05 03 14 05 04 00                            : .......
--------------------------------------------------------------------
_pulse_colors:
2320 : __ __ __ BYT 0b 0c 0f 02 0a 02 0b 0c 05 0d 05 0d 0b 06 03 0e : ................
2330 : __ __ __ BYT 03 0e 0b 06 0e 01 0e 01 0b 09 08 07 08 07 0b 06 : ................
2340 : __ __ __ BYT 04 0e 04 0e 0b 09 08 07 08 07 0b 0c 05 0d 05 0d : ................
2350 : __ __ __ BYT 0b 0c 0f 01 0f 01 0b 0c 0f 01 0f 01 0b 0c 05 0d : ................
2360 : __ __ __ BYT 05 0d 0b 06 0e 01 0e 01 0b 09 08 07 08 07 0b 0c : ................
2370 : __ __ __ BYT 0a 02 0a 02 0b 09 08 07 08 07 0b 0c 0c 0f 0c 0f : ................
--------------------------------------------------------------------
_kw_table:
2380 : __ __ __ BYT e3 1c ea 1c f0 1c f6 1c f4 1a bc 1d c1 1d d4 23 : ...............#
2390 : __ __ __ BYT c9 1d cf 1d d9 1d e3 1d ea 1d ee 1d f4 1d fa 1d : ................
23a0 : __ __ __ BYT df 23 00 1e 05 1e 0a 1e 13 1e 1b 1e 21 1e 28 1e : .#..........!.(.
23b0 : __ __ __ BYT 2e 1e e8 23 34 1e 3b 1e 42 1e 4a 1e 53 1e 5f 1e : ...#4.;.B.J.S._.
23c0 : __ __ __ BYT 5a 1e 68 1e 6d 1e 71 1e 76 1e 7b 1e 82 1e 8b 1e : Z.h.m.q.v.{.....
23d0 : __ __ __ BYT 91 1e 96 1e                                     : ....
--------------------------------------------------------------------
_kw007:
23d4 : __ __ __ BYT 03 0f 0e 0e 05 03 14 09 0f 0e 00                : ...........
--------------------------------------------------------------------
_kw016:
23df : __ __ __ BYT 05 11 15 01 0c 09 14 19 00                      : .........
--------------------------------------------------------------------
_kw025:
23e8 : __ __ __ BYT 08 15 0d 01 0e 09 14 19 00                      : .........
--------------------------------------------------------------------
s3_hdr:
23f1 : __ __ __ BYT 19 0f 15 20 04 12 05 01 0d 05 04 20 0f 06 00    : ... ....... ...
--------------------------------------------------------------------
_r1_table:
2400 : __ __ __ BYT 54 24 77 24 77 24 77 24 99 24 99 24 b8 24 b8 24 : T$w$w$w$.$.$.$.$
2410 : __ __ __ BYT dc 24 dc 24 dc 24 01 25 01 25 01 25 01 25 1c 25 : .$.$.$.%.%.%.%.%
2420 : __ __ __ BYT 1c 25 1c 25 41 25 41 25 41 25 63 25 63 25 63 25 : .%.%A%A%A%c%c%c%
2430 : __ __ __ BYT 81 25 81 25 81 25 9d 25 9d 25 9d 25 bd 25 bd 25 : .%.%.%.%.%.%.%.%
2440 : __ __ __ BYT bd 25 dd 25 dd 25 dd 25 00 26 00 26 00 26 1e 26 : .%.%.%.%.&.&.&.&
2450 : __ __ __ BYT 1e 26 1e 26                                     : .&.&
--------------------------------------------------------------------
_r1_000:
2454 : __ __ __ BYT 19 0f 15 12 20 08 05 01 0c 14 08 20 04 01 14 01 : .... ...... ....
2464 : __ __ __ BYT 20 06 05 05 04 13 20 14 08 05 20 0d 01 03 08 09 :  ..... ... .....
2474 : __ __ __ BYT 0e 05 00                                        : ...
--------------------------------------------------------------------
_r1_001:
2477 : __ __ __ BYT 10 05 01 03 05 20 12 05 11 15 09 12 05 13 20 14 : ..... ........ .
2487 : __ __ __ BYT 0f 14 01 0c 20 13 15 12 16 05 09 0c 0c 01 0e 03 : .... ...........
2497 : __ __ __ BYT 05 00                                           : ..
--------------------------------------------------------------------
_r1_004:
2499 : __ __ __ BYT 06 12 05 05 04 0f 0d 20 09 13 20 0d 01 0e 01 07 : ....... .. .....
24a9 : __ __ __ BYT 05 04 20 05 06 06 09 03 09 05 0e 14 0c 19 00    : .. ............
--------------------------------------------------------------------
_r1_006:
24b8 : __ __ __ BYT 03 0f 0e 0e 05 03 14 09 0f 0e 20 09 13 20 17 01 : .......... .. ..
24c8 : __ __ __ BYT 14 03 08 05 04 20 06 0f 12 20 19 0f 15 12 20 07 : ..... ... .... .
24d8 : __ __ __ BYT 0f 0f 04 00                                     : ....
--------------------------------------------------------------------
_r1_008:
24dc : __ __ __ BYT 0c 05 01 12 0e 09 0e 07 20 09 13 20 03 15 12 01 : ........ .. ....
24ec : __ __ __ BYT 14 05 04 20 02 19 20 14 08 05 20 01 0c 07 0f 12 : ... .. ... .....
24fc : __ __ __ BYT 09 14 08 0d 00                                  : .....
--------------------------------------------------------------------
_r1_011:
2501 : __ __ __ BYT 03 12 05 01 14 09 0f 0e 20 12 05 11 15 09 12 05 : ........ .......
2511 : __ __ __ BYT 13 20 01 20 10 05 12 0d 09 14 00                : . . .......
--------------------------------------------------------------------
_r1_015:
251c : __ __ __ BYT 05 11 15 01 0c 09 14 19 20 09 13 20 01 0c 07 0f : ........ .. ....
252c : __ __ __ BYT 12 09 14 08 0d 09 03 01 0c 0c 19 20 01 13 13 09 : ........... ....
253c : __ __ __ BYT 07 0e 05 04 00                                  : .....
--------------------------------------------------------------------
_r1_018:
2541 : __ __ __ BYT 13 01 06 05 14 19 20 12 05 11 15 09 12 05 13 20 : ...... ........ 
2551 : __ __ __ BYT 06 15 0c 0c 20 14 12 01 0e 13 10 01 12 05 0e 03 : .... ...........
2561 : __ __ __ BYT 19 00                                           : ..
--------------------------------------------------------------------
_r1_021:
2563 : __ __ __ BYT 14 12 15 14 08 20 09 13 20 15 10 04 01 14 05 04 : ..... .. .......
2573 : __ __ __ BYT 20 09 0e 20 12 05 01 0c 20 14 09 0d 05 00       :  .. .... .....
--------------------------------------------------------------------
_r1_024:
2581 : __ __ __ BYT 08 15 0d 01 0e 09 14 19 20 09 13 20 02 05 09 0e : ........ .. ....
2591 : __ __ __ BYT 07 20 0f 10 14 09 0d 09 13 05 04 00             : . ..........
--------------------------------------------------------------------
_r1_027:
259d : __ __ __ BYT 02 05 14 14 05 12 20 09 13 20 04 05 06 09 0e 05 : ...... .. ......
25ad : __ __ __ BYT 04 20 02 19 20 14 08 05 20 13 19 13 14 05 0d 00 : . .. ... .......
--------------------------------------------------------------------
_r1_030:
25bd : __ __ __ BYT 14 08 05 20 06 15 14 15 12 05 20 09 13 20 01 0c : ... ...... .. ..
25cd : __ __ __ BYT 12 05 01 04 19 20 01 0c 0c 0f 03 01 14 05 04 00 : ..... ..........
--------------------------------------------------------------------
_r1_033:
25dd : __ __ __ BYT 17 0f 12 0b 20 09 13 20 01 15 14 0f 0d 01 14 05 : .... .. ........
25ed : __ __ __ BYT 04 20 06 0f 12 20 19 0f 15 12 20 06 12 05 05 04 : . ... .... .....
25fd : __ __ __ BYT 0f 0d 00                                        : ...
--------------------------------------------------------------------
_r1_036:
2600 : __ __ __ BYT 0c 0f 16 05 20 09 13 20 03 0f 0d 10 01 14 09 02 : .... .. ........
2610 : __ __ __ BYT 09 0c 09 14 19 20 13 03 0f 12 09 0e 07 00       : ..... ........
--------------------------------------------------------------------
_r1_039:
261e : __ __ __ BYT 14 08 09 0e 0b 09 0e 07 20 09 13 20 01 13 13 09 : ........ .. ....
262e : __ __ __ BYT 13 14 05 04 20 02 19 20 01 09 00                : .... .. ...
--------------------------------------------------------------------
_r2_table:
2639 : __ __ __ BYT 8d 26 a4 26 a4 26 a4 26 bf 26 bf 26 da 26 da 26 : .&.&.&.&.&.&.&.&
2649 : __ __ __ BYT f8 26 f8 26 f8 26 13 27 13 27 13 27 13 27 32 27 : .&.&.&.'.'.'.'2'
2659 : __ __ __ BYT 32 27 32 27 4c 27 4c 27 4c 27 6a 27 6a 27 6a 27 : 2'2'L'L'L'j'j'j'
2669 : __ __ __ BYT 88 27 88 27 88 27 a2 27 a2 27 a2 27 bd 27 bd 27 : .'.'.'.'.'.'.'.'
2679 : __ __ __ BYT bd 27 d9 27 d9 27 d9 27 f5 27 f5 27 f5 27 13 28 : .'.'.'.'.'.'.'.(
2689 : __ __ __ BYT 13 28 13 28                                     : .(.(
--------------------------------------------------------------------
_r2_000:
268d : __ __ __ BYT 03 0f 0d 10 0c 09 01 0e 03 05 20 09 13 20 14 08 : .......... .. ..
269d : __ __ __ BYT 05 20 03 15 12 05 00                            : . .....
--------------------------------------------------------------------
_r2_001:
26a4 : __ __ __ BYT 19 0f 15 12 20 13 01 06 05 14 19 20 09 13 20 0f : .... ...... .. .
26b4 : __ __ __ BYT 15 12 20 10 12 0f 04 15 03 14 00                : .. ........
--------------------------------------------------------------------
_r2_004:
26bf : __ __ __ BYT 17 09 14 08 09 0e 20 01 10 10 12 0f 16 05 04 20 : ...... ........ 
26cf : __ __ __ BYT 10 01 12 01 0d 05 14 05 12 13 00                : ...........
--------------------------------------------------------------------
_r2_006:
26da : __ __ __ BYT 09 13 0f 0c 01 14 09 0f 0e 20 10 12 0f 14 05 03 : ......... ......
26ea : __ __ __ BYT 14 13 20 14 08 05 20 13 19 13 14 05 0d 00       : .. ... .......
--------------------------------------------------------------------
_r2_008:
26f8 : __ __ __ BYT 19 0f 15 12 20 03 15 12 09 0f 13 09 14 19 20 09 : .... ......... .
2708 : __ __ __ BYT 13 20 0f 15 12 20 04 01 14 01 00                : . ... .....
--------------------------------------------------------------------
_r2_011:
2713 : __ __ __ BYT 19 0f 15 12 20 09 04 05 01 13 20 02 05 0c 0f 0e : .... ..... .....
2723 : __ __ __ BYT 07 20 14 0f 20 14 08 05 20 03 0c 0f 15 04 00    : . .. ... ......
--------------------------------------------------------------------
_r2_015:
2732 : __ __ __ BYT 19 0f 15 12 20 13 03 0f 12 05 20 08 01 13 20 02 : .... ..... ... .
2742 : __ __ __ BYT 05 05 0e 20 0e 0f 14 05 04 00                   : ... ......
--------------------------------------------------------------------
_r2_018:
274c : __ __ __ BYT 19 0f 15 12 20 0c 0f 03 01 14 09 0f 0e 20 08 01 : .... ........ ..
275c : __ __ __ BYT 13 20 02 05 05 0e 20 0c 0f 07 07 05 04 00       : . .... .......
--------------------------------------------------------------------
_r2_021:
276a : __ __ __ BYT 19 05 13 14 05 12 04 01 19 13 20 16 05 12 13 09 : .......... .....
277a : __ __ __ BYT 0f 0e 20 09 13 20 04 05 0c 05 14 05 04 00       : .. .. ........
--------------------------------------------------------------------
_r2_024:
2788 : __ __ __ BYT 19 0f 15 12 20 15 10 07 12 01 04 05 20 09 13 20 : .... ....... .. 
2798 : __ __ __ BYT 13 03 08 05 04 15 0c 05 04 00                   : ..........
--------------------------------------------------------------------
_r2_027:
27a2 : __ __ __ BYT 19 0f 15 12 20 02 01 13 05 0c 09 0e 05 20 08 01 : .... ........ ..
27b2 : __ __ __ BYT 13 20 02 05 05 0e 20 13 05 14 00                : . .... ....
--------------------------------------------------------------------
_r2_030:
27bd : __ __ __ BYT 19 0f 15 12 20 12 0f 0c 05 20 08 01 13 20 02 05 : .... .... ... ..
27cd : __ __ __ BYT 05 0e 20 01 13 13 09 07 0e 05 04 00             : .. .........
--------------------------------------------------------------------
_r2_033:
27d9 : __ __ __ BYT 19 0f 15 12 20 12 05 04 15 0e 04 01 0e 03 19 20 : .... .......... 
27e9 : __ __ __ BYT 09 13 20 01 10 10 12 0f 16 05 04 00             : .. .........
--------------------------------------------------------------------
_r2_036:
27f5 : __ __ __ BYT 19 0f 15 12 20 0d 01 14 03 08 20 08 01 13 20 02 : .... ..... ... .
2805 : __ __ __ BYT 05 05 0e 20 0f 10 14 09 0d 09 13 05 04 00       : ... ..........
--------------------------------------------------------------------
_r2_039:
2813 : __ __ __ BYT 19 0f 15 12 20 14 08 0f 15 07 08 14 13 20 01 12 : .... ........ ..
2823 : __ __ __ BYT 05 20 09 0e 20 07 0f 0f 04 20 08 01 0e 04 13 00 : . .. .... ......
--------------------------------------------------------------------
_resp_default_1:
2833 : __ __ __ BYT 19 0f 15 12 20 04 12 05 01 0d 20 08 01 13 20 02 : .... ..... ... .
2843 : __ __ __ BYT 05 05 0e 20 10 12 0f 03 05 13 13 05 04 00       : ... ..........
--------------------------------------------------------------------
_resp_default_2:
2851 : __ __ __ BYT 01 0e 04 20 0d 0f 0e 05 14 09 13 05 04 20 01 03 : ... ......... ..
2861 : __ __ __ BYT 03 0f 12 04 09 0e 07 0c 19 00                   : ..........
--------------------------------------------------------------------
s3_sys:
286b : __ __ __ BYT 14 08 05 20 13 19 13 14 05 0d 20 08 05 01 12 04 : ... ...... .....
287b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
s3_end:
287c : __ __ __ BYT 19 0f 15 12 20 04 12 05 01 0d 20 09 13 20 14 08 : .... ..... .. ..
288c : __ __ __ BYT 05 20 13 19 13 14 05 0d 00                      : . .......
--------------------------------------------------------------------
s4_by1:
2895 : __ __ __ BYT 14 08 09 13 20 04 05 0d 0f 20 17 01 13 20 0d 01 : .... .... ... ..
28a5 : __ __ __ BYT 04 05 20 02 19 20 01 09 00                      : .. .. ...
--------------------------------------------------------------------
s4_by2:
28ae : __ __ __ BYT 04 09 12 05 03 14 05 04 20 02 19 20 0a 0f 0e 01 : ........ .. ....
28be : __ __ __ BYT 13 20 13 03 08 0f 15 13 14 12 15 10 2d 14 08 0f : . ..........-...
28ce : __ __ __ BYT 0d 13 05 0e 00                                  : .....
--------------------------------------------------------------------
s4_by3:
28d3 : __ __ __ BYT 03 0f 0d 0d 0f 04 0f 12 05 20 36 34 20 20 32 30 : ......... 64  20
28e3 : __ __ __ BYT 32 36 00                                        : 26.
--------------------------------------------------------------------
s4_m1:
28e6 : __ __ __ BYT 14 08 05 20 0d 01 03 08 09 0e 05 20 14 08 01 14 : ... ....... ....
28f6 : __ __ __ BYT 20 08 05 0c 04 20 14 08 05 00                   :  .... ....
--------------------------------------------------------------------
s4_m2:
2900 : __ __ __ BYT 06 09 12 13 14 20 10 12 0f 0d 09 13 05 20 0e 0f : ..... ....... ..
2910 : __ __ __ BYT 17 20 12 15 0e 13 20 03 0f 04 05 00             : . .... .....
--------------------------------------------------------------------
s4_m3:
291c : __ __ __ BYT 17 12 09 14 14 05 0e 20 02 19 20 14 08 05 20 06 : ....... .. ... .
292c : __ __ __ BYT 15 14 15 12 05 00                               : ......
--------------------------------------------------------------------
s5_q1:
2932 : __ __ __ BYT 04 09 04 20 17 05 20 07 05 14 20 17 08 01 14 20 : ... .. ... .... 
2942 : __ __ __ BYT 17 05 20 17 05 12 05 20 10 12 0f 0d 09 13 05 04 : .. .... ........
2952 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
s5_q2:
2953 : __ __ __ BYT 0f 12 20 13 0f 0d 05 14 08 09 0e 07 20 06 01 12 : .. ......... ...
2963 : __ __ __ BYT 20 0d 0f 12 05 2e 2e 2e 00                      :  ........
--------------------------------------------------------------------
s5_end:
296c : __ __ __ BYT 14 08 05 20 05 0e 04 20 09 13 20 0e 0f 14 20 19 : ... ... .. ... .
297c : __ __ __ BYT 05 14 20 17 12 09 14 14 05 0e 00                : .. ........
--------------------------------------------------------------------
scroll_buf:
2987 : __ __ __ BSS	40
--------------------------------------------------------------------
input_buf:
29af : __ __ __ BSS	39
--------------------------------------------------------------------
scr:
2a00 : __ __ __ BSS	153
