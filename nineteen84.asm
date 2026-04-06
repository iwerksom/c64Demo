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
080e : 8e 1c 17 STX $171c ; (spentry + 0)
0811 : a2 22 __ LDX #$22
0813 : a0 6b __ LDY #$6b
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 23 __ CPX #$23
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
083b : a9 f4 __ LDA #$f4
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
;1170, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0880 : a9 00 __ LDA #$00
0882 : 8d 20 d0 STA $d020 
0885 : 8d 21 d0 STA $d021 
0888 : 20 ee 08 JSR $08ee ; (scene1_run.s4 + 0)
088b : 20 63 0d JSR $0d63 ; (scene2_run.s4 + 0)
088e : a9 28 __ LDA #$28
0890 : 85 0d __ STA P0 
0892 : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
0895 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
0898 : a9 0a __ LDA #$0a
089a : 85 0d __ STA P0 
089c : a9 22 __ LDA #$22
089e : 85 10 __ STA P3 
08a0 : a9 01 __ LDA #$01
08a2 : 85 11 __ STA P4 
08a4 : a9 16 __ LDA #$16
08a6 : 85 0f __ STA P2 
08a8 : 20 bc 0b JSR $0bbc ; (pcenter.s4 + 0)
08ab : a9 32 __ LDA #$32
08ad : 85 0d __ STA P0 
08af : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
08b2 : a9 0c __ LDA #$0c
08b4 : 85 0d __ STA P0 
08b6 : 85 11 __ STA P4 
08b8 : a9 37 __ LDA #$37
08ba : 85 0f __ STA P2 
08bc : a9 22 __ LDA #$22
08be : 85 10 __ STA P3 
08c0 : 20 bc 0b JSR $0bbc ; (pcenter.s4 + 0)
08c3 : 20 07 17 JSR $1707 ; (wait_frames@proxy + 0)
08c6 : a9 12 __ LDA #$12
08c8 : 85 0d __ STA P0 
08ca : a9 22 __ LDA #$22
08cc : 85 10 __ STA P3 
08ce : a9 50 __ LDA #$50
08d0 : 85 0f __ STA P2 
08d2 : 20 bc 0b JSR $0bbc ; (pcenter.s4 + 0)
08d5 : a9 00 __ LDA #$00
08d7 : 8d df 17 STA $17df ; (blink_phase + 0)
08da : 8d de 17 STA $17de ; (blink_cnt + 0)
.l5:
08dd : a9 12 __ LDA #$12
08df : 85 0f __ STA P2 
08e1 : a9 01 __ LDA #$01
08e3 : 85 10 __ STA P3 
08e5 : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
08e8 : 20 b1 0c JSR $0cb1 ; (blink_row.s4 + 0)
08eb : 4c dd 08 JMP $08dd ; (main.l5 + 0)
--------------------------------------------------------------------
scene1_run: ; scene1_run()->void
; 463, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
08ee : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
08f1 : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
08f4 : a9 1d __ LDA #$1d
08f6 : 85 0d __ STA P0 
08f8 : a9 17 __ LDA #$17
08fa : 85 0e __ STA P1 
08fc : 20 d8 0a JSR $0ad8 ; (sprite_load.s4 + 0)
08ff : a9 80 __ LDA #$80
0901 : 8d f8 07 STA $07f8 
0904 : a9 a0 __ LDA #$a0
0906 : 8d 00 d0 STA $d000 
0909 : a9 38 __ LDA #$38
090b : 8d 01 d0 STA $d001 
090e : ad 10 d0 LDA $d010 
0911 : 29 fe __ AND #$fe
0913 : 8d 10 d0 STA $d010 
0916 : a9 01 __ LDA #$01
0918 : 8d 27 d0 STA $d027 
091b : ad 1c d0 LDA $d01c 
091e : 29 fe __ AND #$fe
0920 : 8d 1c d0 STA $d01c 
0923 : ad 1b d0 LDA $d01b 
0926 : 29 fe __ AND #$fe
0928 : 8d 1b d0 STA $d01b 
092b : ad 1d d0 LDA $d01d 
092e : 09 01 __ ORA #$01
0930 : 8d 1d d0 STA $d01d 
0933 : ad 17 d0 LDA $d017 
0936 : 09 01 __ ORA #$01
0938 : 8d 17 d0 STA $d017 
093b : ad 15 d0 LDA $d015 
093e : 09 01 __ ORA #$01
0940 : 8d 15 d0 STA $d015 
0943 : 20 ea 0a JSR $0aea ; (draw_year.s4 + 0)
0946 : a9 12 __ LDA #$12
0948 : 20 81 0b JSR $0b81 ; (hline.s4 + 0)
094b : a9 14 __ LDA #$14
094d : 85 0d __ STA P0 
094f : a9 17 __ LDA #$17
0951 : 85 10 __ STA P3 
0953 : a9 b6 __ LDA #$b6
0955 : 85 0f __ STA P2 
0957 : 20 b8 0b JSR $0bb8 ; (pcenter@proxy + 0)
095a : e6 11 __ INC P4 
095c : a9 16 __ LDA #$16
095e : 85 0d __ STA P0 
0960 : a9 c4 __ LDA #$c4
0962 : 85 0f __ STA P2 
0964 : a9 17 __ LDA #$17
0966 : 85 10 __ STA P3 
0968 : 20 bc 0b JSR $0bbc ; (pcenter.s4 + 0)
096b : 20 44 0c JSR $0c44 ; (scroll_init.s4 + 0)
096e : a9 00 __ LDA #$00
0970 : 8d df 17 STA $17df ; (blink_phase + 0)
0973 : 8d de 17 STA $17de ; (blink_cnt + 0)
0976 : 85 47 __ STA T1 + 0 
0978 : 85 48 __ STA T2 + 0 
097a : a9 16 __ LDA #$16
097c : 85 0f __ STA P2 
097e : a9 0c __ LDA #$0c
0980 : 85 10 __ STA P3 
.l5:
0982 : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
0985 : 20 69 0c JSR $0c69 ; (scroll_step.s4 + 0)
0988 : 20 b1 0c JSR $0cb1 ; (blink_row.s4 + 0)
098b : e6 48 __ INC T2 + 0 
098d : a5 48 __ LDA T2 + 0 
098f : a6 47 __ LDX T1 + 0 
0991 : dd e5 17 CMP $17e5,x ; (seq_hold[0] + 0)
0994 : 90 35 __ BCC $09cb ; (scene1_run.s6 + 0)
.s8:
0996 : a2 00 __ LDX #$00
0998 : 86 48 __ STX T2 + 0 
099a : e6 47 __ INC T1 + 0 
099c : a5 47 __ LDA T1 + 0 
099e : c9 05 __ CMP #$05
09a0 : 90 02 __ BCC $09a4 ; (scene1_run.s9 + 0)
.s15:
09a2 : 86 47 __ STX T1 + 0 
.s9:
09a4 : a6 47 __ LDX T1 + 0 
09a6 : bd e0 17 LDA $17e0,x ; (seq_frame[0] + 0)
09a9 : d0 0e __ BNE $09b9 ; (scene1_run.s12 + 0)
.s10:
09ab : a9 19 __ LDA #$19
09ad : a0 00 __ LDY #$00
.s11:
09af : 84 0d __ STY P0 
09b1 : 85 0e __ STA P1 
09b3 : 20 d8 0a JSR $0ad8 ; (sprite_load.s4 + 0)
09b6 : 4c cb 09 JMP $09cb ; (scene1_run.s6 + 0)
.s12:
09b9 : c9 01 __ CMP #$01
09bb : f0 07 __ BEQ $09c4 ; (scene1_run.s14 + 0)
.s13:
09bd : a9 19 __ LDA #$19
09bf : a0 3f __ LDY #$3f
09c1 : 4c af 09 JMP $09af ; (scene1_run.s11 + 0)
.s14:
09c4 : a9 17 __ LDA #$17
09c6 : a0 1d __ LDY #$1d
09c8 : 4c af 09 JMP $09af ; (scene1_run.s11 + 0)
.s6:
09cb : 20 0b 0d JSR $0d0b ; (any_key.s4 + 0)
09ce : aa __ __ TAX
09cf : f0 b1 __ BEQ $0982 ; (scene1_run.l5 + 0)
.s7:
09d1 : ad 15 d0 LDA $d015 
09d4 : 29 fe __ AND #$fe
09d6 : 8d 15 d0 STA $d015 
09d9 : a9 05 __ LDA #$05
09db : 85 0d __ STA P0 
09dd : ad 1d d0 LDA $d01d 
09e0 : 29 fe __ AND #$fe
09e2 : 8d 1d d0 STA $d01d 
09e5 : ad 17 d0 LDA $d017 
09e8 : 29 fe __ AND #$fe
09ea : 8d 17 d0 STA $d017 
09ed : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
09f0 : 20 46 0d JSR $0d46 ; (fade_to_black.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
09f3 : a9 0f __ LDA #$0f
09f5 : 85 0d __ STA P0 
--------------------------------------------------------------------
wait_frames: ; wait_frames(u8)->void
; 128, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
09f7 : a5 0d __ LDA P0 ; (n + 0)
09f9 : f0 09 __ BEQ $0a04 ; (wait_frames.s3 + 0)
.l5:
09fb : c6 0d __ DEC P0 ; (n + 0)
09fd : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
0a00 : a5 0d __ LDA P0 ; (n + 0)
0a02 : d0 f7 __ BNE $09fb ; (wait_frames.l5 + 0)
.s3:
0a04 : 60 __ __ RTS
--------------------------------------------------------------------
glitch_transition: ; glitch_transition()->void
; 711, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0a05 : a9 ac __ LDA #$ac
0a07 : 85 45 __ STA T2 + 0 
0a09 : a9 12 __ LDA #$12
0a0b : 85 46 __ STA T5 + 0 
.l5:
0a0d : a9 00 __ LDA #$00
0a0f : 85 1b __ STA ACCU + 0 
0a11 : 85 1f __ STA ADDR + 0 
0a13 : a9 04 __ LDA #$04
0a15 : 85 1c __ STA ACCU + 1 
0a17 : a6 45 __ LDX T2 + 0 
0a19 : 4c 1e 0a JMP $0a1e ; (glitch_transition.l12 + 0)
.s15:
0a1c : e6 1c __ INC ACCU + 1 
.l12:
0a1e : 8a __ __ TXA
0a1f : 0a __ __ ASL
0a20 : a9 00 __ LDA #$00
0a22 : 2a __ __ ROL
0a23 : 85 1d __ STA ACCU + 2 
0a25 : 8a __ __ TXA
0a26 : 4a __ __ LSR
0a27 : 4a __ __ LSR
0a28 : 4a __ __ LSR
0a29 : 4a __ __ LSR
0a2a : 4a __ __ LSR
0a2b : 45 1d __ EOR ACCU + 2 
0a2d : 85 1d __ STA ACCU + 2 
0a2f : 8a __ __ TXA
0a30 : 4a __ __ LSR
0a31 : 4a __ __ LSR
0a32 : 4a __ __ LSR
0a33 : 4a __ __ LSR
0a34 : 45 1d __ EOR ACCU + 2 
0a36 : 85 1d __ STA ACCU + 2 
0a38 : 8a __ __ TXA
0a39 : 4a __ __ LSR
0a3a : 4a __ __ LSR
0a3b : 4a __ __ LSR
0a3c : 45 1d __ EOR ACCU + 2 
0a3e : 4a __ __ LSR
0a3f : 8a __ __ TXA
0a40 : 2a __ __ ROL
0a41 : aa __ __ TAX
0a42 : 29 3f __ AND #$3f
0a44 : a0 00 __ LDY #$00
0a46 : 91 1b __ STA (ACCU + 0),y 
0a48 : 18 __ __ CLC
0a49 : a5 1c __ LDA ACCU + 1 
0a4b : 69 d4 __ ADC #$d4
0a4d : 85 20 __ STA ADDR + 1 
0a4f : 8a __ __ TXA
0a50 : 4a __ __ LSR
0a51 : 4a __ __ LSR
0a52 : 4a __ __ LSR
0a53 : 4a __ __ LSR
0a54 : a4 1b __ LDY ACCU + 0 
0a56 : 91 1f __ STA (ADDR + 0),y 
0a58 : 98 __ __ TYA
0a59 : 18 __ __ CLC
0a5a : 69 01 __ ADC #$01
0a5c : 85 1b __ STA ACCU + 0 
0a5e : b0 bc __ BCS $0a1c ; (glitch_transition.s15 + 0)
.s16:
0a60 : c9 e8 __ CMP #$e8
0a62 : d0 ba __ BNE $0a1e ; (glitch_transition.l12 + 0)
.s11:
0a64 : a5 1c __ LDA ACCU + 1 
0a66 : c9 07 __ CMP #$07
0a68 : d0 b4 __ BNE $0a1e ; (glitch_transition.l12 + 0)
.s6:
0a6a : 86 45 __ STX T2 + 0 
0a6c : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
0a6f : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
0a72 : c6 46 __ DEC T5 + 0 
0a74 : d0 97 __ BNE $0a0d ; (glitch_transition.l5 + 0)
.s7:
0a76 : a9 00 __ LDA #$00
0a78 : 85 43 __ STA T1 + 0 
0a7a : a9 d8 __ LDA #$d8
0a7c : 85 44 __ STA T1 + 1 
.l8:
0a7e : a9 00 __ LDA #$00
0a80 : a0 27 __ LDY #$27
.l13:
0a82 : 91 43 __ STA (T1 + 0),y 
0a84 : 88 __ __ DEY
0a85 : 10 fb __ BPL $0a82 ; (glitch_transition.l13 + 0)
.s14:
0a87 : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
0a8a : 18 __ __ CLC
0a8b : a5 43 __ LDA T1 + 0 
0a8d : 69 28 __ ADC #$28
0a8f : 85 43 __ STA T1 + 0 
0a91 : 90 02 __ BCC $0a95 ; (glitch_transition.s18 + 0)
.s17:
0a93 : e6 44 __ INC T1 + 1 
.s18:
0a95 : c9 e8 __ CMP #$e8
0a97 : d0 e5 __ BNE $0a7e ; (glitch_transition.l8 + 0)
.s10:
0a99 : a5 44 __ LDA T1 + 1 
0a9b : c9 db __ CMP #$db
0a9d : d0 df __ BNE $0a7e ; (glitch_transition.l8 + 0)
--------------------------------------------------------------------
cls: ; cls()->void
;  50, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0a9f : a9 00 __ LDA #$00
0aa1 : 85 1f __ STA ADDR + 0 
0aa3 : 8d 20 d0 STA $d020 
0aa6 : 8d 21 d0 STA $d021 
0aa9 : 85 1b __ STA ACCU + 0 
0aab : a9 04 __ LDA #$04
0aad : 85 1c __ STA ACCU + 1 
0aaf : d0 02 __ BNE $0ab3 ; (cls.l6 + 0)
.s7:
0ab1 : e6 1c __ INC ACCU + 1 
.l6:
0ab3 : a9 20 __ LDA #$20
0ab5 : a0 00 __ LDY #$00
0ab7 : 91 1b __ STA (ACCU + 0),y 
0ab9 : 18 __ __ CLC
0aba : a5 1c __ LDA ACCU + 1 
0abc : 69 d4 __ ADC #$d4
0abe : 85 20 __ STA ADDR + 1 
0ac0 : 98 __ __ TYA
0ac1 : a4 1b __ LDY ACCU + 0 
0ac3 : 91 1f __ STA (ADDR + 0),y 
0ac5 : 98 __ __ TYA
0ac6 : 18 __ __ CLC
0ac7 : 69 01 __ ADC #$01
0ac9 : 85 1b __ STA ACCU + 0 
0acb : b0 e4 __ BCS $0ab1 ; (cls.s7 + 0)
.s8:
0acd : c9 e8 __ CMP #$e8
0acf : d0 e2 __ BNE $0ab3 ; (cls.l6 + 0)
.s5:
0ad1 : a5 1c __ LDA ACCU + 1 
0ad3 : c9 07 __ CMP #$07
0ad5 : d0 dc __ BNE $0ab3 ; (cls.l6 + 0)
.s3:
0ad7 : 60 __ __ RTS
--------------------------------------------------------------------
sprite_load: ; sprite_load(const u8*)->void
; 401, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0ad8 : a0 00 __ LDY #$00
.l5:
0ada : b1 0d __ LDA (P0),y ; (data + 0)
0adc : 99 00 20 STA $2000,y ; (_r2_015[0] + 7)
0adf : c8 __ __ INY
0ae0 : c0 3f __ CPY #$3f
0ae2 : d0 f6 __ BNE $0ada ; (sprite_load.l5 + 0)
.s6:
0ae4 : a9 00 __ LDA #$00
0ae6 : 8d 3f 20 STA $203f ; (_r2_021[0] + 14)
.s3:
0ae9 : 60 __ __ RTS
--------------------------------------------------------------------
draw_year: ; draw_year(u8,u8)->void
; 445, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0aea : a9 5c __ LDA #$5c
0aec : 8d f6 9f STA $9ff6 ; (rows[0] + 0)
0aef : a9 17 __ LDA #$17
0af1 : 8d f7 9f STA $9ff7 ; (rows[0] + 1)
0af4 : a9 6e __ LDA #$6e
0af6 : 8d f8 9f STA $9ff8 ; (rows[0] + 2)
0af9 : a9 17 __ LDA #$17
0afb : 8d f9 9f STA $9ff9 ; (rows[0] + 3)
0afe : a9 80 __ LDA #$80
0b00 : 8d fa 9f STA $9ffa ; (rows[0] + 4)
0b03 : a9 17 __ LDA #$17
0b05 : 8d fb 9f STA $9ffb ; (rows[0] + 5)
0b08 : a9 92 __ LDA #$92
0b0a : 8d fc 9f STA $9ffc ; (rows[0] + 6)
0b0d : a9 17 __ LDA #$17
0b0f : 8d fd 9f STA $9ffd ; (rows[0] + 7)
0b12 : a9 a4 __ LDA #$a4
0b14 : 8d fe 9f STA $9ffe ; (rows[0] + 8)
0b17 : a9 17 __ LDA #$17
0b19 : 8d ff 9f STA $9fff ; (rows[0] + 9)
0b1c : a2 00 __ LDX #$00
0b1e : 86 1f __ STX ADDR + 0 
0b20 : a9 eb __ LDA #$eb
0b22 : 85 1b __ STA ACCU + 0 
0b24 : a9 01 __ LDA #$01
0b26 : 85 1c __ STA ACCU + 1 
.l5:
0b28 : a5 1b __ LDA ACCU + 0 
0b2a : 85 43 __ STA T2 + 0 
0b2c : 18 __ __ CLC
0b2d : a5 1c __ LDA ACCU + 1 
0b2f : 69 04 __ ADC #$04
0b31 : 85 44 __ STA T2 + 1 
0b33 : 8a __ __ TXA
0b34 : 0a __ __ ASL
0b35 : a8 __ __ TAY
0b36 : b9 f6 9f LDA $9ff6,y ; (rows[0] + 0)
0b39 : 85 45 __ STA T3 + 0 
0b3b : b9 f7 9f LDA $9ff7,y ; (rows[0] + 1)
0b3e : 85 46 __ STA T3 + 1 
0b40 : a0 00 __ LDY #$00
0b42 : 84 1d __ STY ACCU + 2 
0b44 : 18 __ __ CLC
.l8:
0b45 : b1 45 __ LDA (T3 + 0),y 
0b47 : a0 00 __ LDY #$00
0b49 : 91 43 __ STA (T2 + 0),y 
0b4b : a5 44 __ LDA T2 + 1 
0b4d : 69 d4 __ ADC #$d4
0b4f : 85 20 __ STA ADDR + 1 
0b51 : a9 01 __ LDA #$01
0b53 : a4 43 __ LDY T2 + 0 
0b55 : 91 1f __ STA (ADDR + 0),y 
0b57 : 98 __ __ TYA
0b58 : 18 __ __ CLC
0b59 : 69 01 __ ADC #$01
0b5b : 85 43 __ STA T2 + 0 
0b5d : 90 02 __ BCC $0b61 ; (draw_year.s10 + 0)
.s9:
0b5f : e6 44 __ INC T2 + 1 
.s10:
0b61 : e6 1d __ INC ACCU + 2 
0b63 : a4 1d __ LDY ACCU + 2 
0b65 : c0 12 __ CPY #$12
0b67 : 90 dc __ BCC $0b45 ; (draw_year.l8 + 0)
.s6:
0b69 : a5 1b __ LDA ACCU + 0 
0b6b : 69 27 __ ADC #$27
0b6d : 85 1b __ STA ACCU + 0 
0b6f : a5 1c __ LDA ACCU + 1 
0b71 : 69 00 __ ADC #$00
0b73 : 85 1c __ STA ACCU + 1 
0b75 : e8 __ __ INX
0b76 : c9 02 __ CMP #$02
0b78 : d0 ae __ BNE $0b28 ; (draw_year.l5 + 0)
.s7:
0b7a : a5 1b __ LDA ACCU + 0 
0b7c : c9 b3 __ CMP #$b3
0b7e : d0 a8 __ BNE $0b28 ; (draw_year.l5 + 0)
.s3:
0b80 : 60 __ __ RTS
--------------------------------------------------------------------
hline: ; hline(u8,u8,u8)->void
;  92, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0b81 : 85 0d __ STA P0 ; (row + 0)
0b83 : 0a __ __ ASL
0b84 : 0a __ __ ASL
0b85 : 65 0d __ ADC P0 ; (row + 0)
0b87 : 0a __ __ ASL
0b88 : 0a __ __ ASL
0b89 : 85 1b __ STA ACCU + 0 
0b8b : a9 01 __ LDA #$01
0b8d : 2a __ __ ROL
0b8e : 06 1b __ ASL ACCU + 0 
0b90 : 2a __ __ ROL
0b91 : 85 1c __ STA ACCU + 1 
0b93 : a5 1b __ LDA ACCU + 0 
0b95 : 09 02 __ ORA #$02
0b97 : a8 __ __ TAY
0b98 : a9 00 __ LDA #$00
0b9a : 85 1f __ STA ADDR + 0 
0b9c : 85 1b __ STA ACCU + 0 
0b9e : a2 24 __ LDX #$24
.l5:
0ba0 : a9 2d __ LDA #$2d
0ba2 : 91 1b __ STA (ACCU + 0),y 
0ba4 : 18 __ __ CLC
0ba5 : a5 1c __ LDA ACCU + 1 
0ba7 : 69 d4 __ ADC #$d4
0ba9 : 85 20 __ STA ADDR + 1 
0bab : a9 0b __ LDA #$0b
0bad : 91 1f __ STA (ADDR + 0),y 
0baf : c8 __ __ INY
0bb0 : d0 02 __ BNE $0bb4 ; (hline.s7 + 0)
.s6:
0bb2 : e6 1c __ INC ACCU + 1 
.s7:
0bb4 : ca __ __ DEX
0bb5 : d0 e9 __ BNE $0ba0 ; (hline.l5 + 0)
.s3:
0bb7 : 60 __ __ RTS
--------------------------------------------------------------------
pcenter@proxy: ; pcenter@proxy
0bb8 : a9 0b __ LDA #$0b
0bba : 85 11 __ STA P4 
--------------------------------------------------------------------
pcenter: ; pcenter(u8,const u8*,u8)->void
;  74, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0bbc : 18 __ __ CLC
0bbd : a5 0f __ LDA P2 ; (s + 0)
0bbf : 69 01 __ ADC #$01
0bc1 : 85 1b __ STA ACCU + 0 
0bc3 : a5 10 __ LDA P3 ; (s + 1)
0bc5 : 69 00 __ ADC #$00
0bc7 : 85 1c __ STA ACCU + 1 
0bc9 : a0 00 __ LDY #$00
0bcb : 84 43 __ STY T2 + 0 
0bcd : b1 0f __ LDA (P2),y ; (s + 0)
0bcf : f0 0d __ BEQ $0bde ; (pcenter.s5 + 0)
.l6:
0bd1 : e6 43 __ INC T2 + 0 
0bd3 : b1 1b __ LDA (ACCU + 0),y 
0bd5 : aa __ __ TAX
0bd6 : c8 __ __ INY
0bd7 : d0 02 __ BNE $0bdb ; (pcenter.s8 + 0)
.s7:
0bd9 : e6 1c __ INC ACCU + 1 
.s8:
0bdb : 8a __ __ TXA
0bdc : d0 f3 __ BNE $0bd1 ; (pcenter.l6 + 0)
.s5:
0bde : 38 __ __ SEC
0bdf : a9 28 __ LDA #$28
0be1 : e5 43 __ SBC T2 + 0 
0be3 : 6a __ __ ROR
0be4 : 49 80 __ EOR #$80
0be6 : 85 0e __ STA P1 
--------------------------------------------------------------------
pat: ; pat(u8,u8,const u8*,u8)->void
;  62, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0be8 : a0 00 __ LDY #$00
0bea : b1 0f __ LDA (P2),y ; (s + 0)
0bec : f0 55 __ BEQ $0c43 ; (pat.s3 + 0)
.s5:
0bee : 84 1f __ STY ADDR + 0 
0bf0 : a5 0d __ LDA P0 ; (row + 0)
0bf2 : 0a __ __ ASL
0bf3 : 85 1b __ STA ACCU + 0 
0bf5 : 98 __ __ TYA
0bf6 : 2a __ __ ROL
0bf7 : 06 1b __ ASL ACCU + 0 
0bf9 : 2a __ __ ROL
0bfa : aa __ __ TAX
0bfb : 18 __ __ CLC
0bfc : a5 1b __ LDA ACCU + 0 
0bfe : 65 0d __ ADC P0 ; (row + 0)
0c00 : 85 1b __ STA ACCU + 0 
0c02 : 8a __ __ TXA
0c03 : 69 00 __ ADC #$00
0c05 : 06 1b __ ASL ACCU + 0 
0c07 : 2a __ __ ROL
0c08 : 06 1b __ ASL ACCU + 0 
0c0a : 2a __ __ ROL
0c0b : 06 1b __ ASL ACCU + 0 
0c0d : 2a __ __ ROL
0c0e : aa __ __ TAX
0c0f : 18 __ __ CLC
0c10 : a5 1b __ LDA ACCU + 0 
0c12 : 65 0e __ ADC P1 ; (col + 0)
0c14 : 85 1b __ STA ACCU + 0 
0c16 : 8a __ __ TXA
0c17 : 69 04 __ ADC #$04
0c19 : 85 1c __ STA ACCU + 1 
0c1b : b1 0f __ LDA (P2),y ; (s + 0)
0c1d : a6 11 __ LDX P4 ; (fg + 0)
.l6:
0c1f : 91 1b __ STA (ACCU + 0),y 
0c21 : 18 __ __ CLC
0c22 : a5 1c __ LDA ACCU + 1 
0c24 : 69 d4 __ ADC #$d4
0c26 : 85 20 __ STA ADDR + 1 
0c28 : 8a __ __ TXA
0c29 : a4 1b __ LDY ACCU + 0 
0c2b : 91 1f __ STA (ADDR + 0),y 
0c2d : 98 __ __ TYA
0c2e : 18 __ __ CLC
0c2f : 69 01 __ ADC #$01
0c31 : 85 1b __ STA ACCU + 0 
0c33 : 90 02 __ BCC $0c37 ; (pat.s8 + 0)
.s7:
0c35 : e6 1c __ INC ACCU + 1 
.s8:
0c37 : e6 0f __ INC P2 ; (s + 0)
0c39 : d0 02 __ BNE $0c3d ; (pat.s10 + 0)
.s9:
0c3b : e6 10 __ INC P3 ; (s + 1)
.s10:
0c3d : a0 00 __ LDY #$00
0c3f : b1 0f __ LDA (P2),y ; (s + 0)
0c41 : d0 dc __ BNE $0c1f ; (pat.l6 + 0)
.s3:
0c43 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_init: ; scroll_init()->void
; 302, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0c44 : a9 00 __ LDA #$00
0c46 : 8d dd 17 STA $17dd ; (scroll_tick + 0)
0c49 : 8d db 17 STA $17db ; (scroll_idx + 0)
0c4c : 8d dc 17 STA $17dc ; (scroll_idx + 1)
0c4f : a9 20 __ LDA #$20
0c51 : a2 27 __ LDX #$27
.l5:
0c53 : 9d 6b 22 STA $226b,x ; (scroll_buf[0] + 0)
0c56 : ca __ __ DEX
0c57 : 10 fa __ BPL $0c53 ; (scroll_init.l5 + 0)
.s3:
0c59 : 60 __ __ RTS
--------------------------------------------------------------------
wait_frame: ; wait_frame()->void
; 120, "C:/code/jonas/c64Demo/nineteen84.c"
.l4:
0c5a : ad 12 d0 LDA $d012 
0c5d : c9 fa __ CMP #$fa
0c5f : 90 f9 __ BCC $0c5a ; (wait_frame.l4 + 0)
.l5:
0c61 : ad 12 d0 LDA $d012 
0c64 : c9 fa __ CMP #$fa
0c66 : b0 f9 __ BCS $0c61 ; (wait_frame.l5 + 0)
.s3:
0c68 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_step: ; scroll_step()->void
; 310, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0c69 : ee dd 17 INC $17dd ; (scroll_tick + 0)
0c6c : ad dd 17 LDA $17dd ; (scroll_tick + 0)
0c6f : c9 0c __ CMP #$0c
0c71 : 90 3d __ BCC $0cb0 ; (scroll_step.s3 + 0)
.s5:
0c73 : a0 00 __ LDY #$00
0c75 : 8c dd 17 STY $17dd ; (scroll_tick + 0)
.l7:
0c78 : b9 6c 22 LDA $226c,y ; (scroll_buf[0] + 1)
0c7b : 99 6b 22 STA $226b,y ; (scroll_buf[0] + 0)
0c7e : c8 __ __ INY
0c7f : c0 27 __ CPY #$27
0c81 : d0 f5 __ BNE $0c78 ; (scroll_step.l7 + 0)
.s8:
0c83 : ae db 17 LDX $17db ; (scroll_idx + 0)
0c86 : ee db 17 INC $17db ; (scroll_idx + 0)
0c89 : a0 00 __ LDY #$00
0c8b : 8c dc 17 STY $17dc ; (scroll_idx + 1)
0c8e : bd 00 18 LDA $1800,x ; (scroll_text[0] + 0)
0c91 : c9 ff __ CMP #$ff
0c93 : d0 08 __ BNE $0c9d ; (scroll_step.s10 + 0)
.s6:
0c95 : 8c db 17 STY $17db ; (scroll_idx + 0)
0c98 : 8c dc 17 STY $17dc ; (scroll_idx + 1)
0c9b : a9 20 __ LDA #$20
.s10:
0c9d : 8d 92 22 STA $2292 ; (scroll_buf[0] + 39)
.l9:
0ca0 : b9 6b 22 LDA $226b,y ; (scroll_buf[0] + 0)
0ca3 : 99 c0 07 STA $07c0,y 
0ca6 : a9 0d __ LDA #$0d
0ca8 : 99 c0 db STA $dbc0,y 
0cab : c8 __ __ INY
0cac : c0 28 __ CPY #$28
0cae : d0 f0 __ BNE $0ca0 ; (scroll_step.l9 + 0)
.s3:
0cb0 : 60 __ __ RTS
--------------------------------------------------------------------
blink_row: ; blink_row(u8,u8)->void
; 211, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0cb1 : a5 0f __ LDA P2 ; (row + 0)
0cb3 : 85 0d __ STA P0 
0cb5 : ee de 17 INC $17de ; (blink_cnt + 0)
0cb8 : ad de 17 LDA $17de ; (blink_cnt + 0)
0cbb : c9 19 __ CMP #$19
0cbd : 90 19 __ BCC $0cd8 ; (blink_row.s5 + 0)
.s8:
0cbf : a9 00 __ LDA #$00
0cc1 : 8d de 17 STA $17de ; (blink_cnt + 0)
0cc4 : cd df 17 CMP $17df ; (blink_phase + 0)
0cc7 : 2a __ __ ROL
0cc8 : 8d df 17 STA $17df ; (blink_phase + 0)
0ccb : f0 04 __ BEQ $0cd1 ; (blink_row.s6 + 0)
.s7:
0ccd : a5 10 __ LDA P3 ; (fg + 0)
0ccf : 90 02 __ BCC $0cd3 ; (blink_row.s9 + 0)
.s6:
0cd1 : a9 00 __ LDA #$00
.s9:
0cd3 : 85 0e __ STA P1 
0cd5 : 4c df 0c JMP $0cdf ; (rowcol.s4 + 0)
.s5:
0cd8 : ad df 17 LDA $17df ; (blink_phase + 0)
0cdb : f0 f4 __ BEQ $0cd1 ; (blink_row.s6 + 0)
0cdd : d0 ee __ BNE $0ccd ; (blink_row.s7 + 0)
--------------------------------------------------------------------
rowcol: ; rowcol(u8,u8)->void
;  84, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0cdf : a5 0d __ LDA P0 ; (row + 0)
0ce1 : 0a __ __ ASL
0ce2 : 85 1b __ STA ACCU + 0 
0ce4 : a9 00 __ LDA #$00
0ce6 : 2a __ __ ROL
0ce7 : 06 1b __ ASL ACCU + 0 
0ce9 : 2a __ __ ROL
0cea : aa __ __ TAX
0ceb : a5 1b __ LDA ACCU + 0 
0ced : 65 0d __ ADC P0 ; (row + 0)
0cef : 85 1b __ STA ACCU + 0 
0cf1 : 8a __ __ TXA
0cf2 : 69 00 __ ADC #$00
0cf4 : 06 1b __ ASL ACCU + 0 
0cf6 : 2a __ __ ROL
0cf7 : 06 1b __ ASL ACCU + 0 
0cf9 : 2a __ __ ROL
0cfa : 06 1b __ ASL ACCU + 0 
0cfc : 2a __ __ ROL
0cfd : 69 d8 __ ADC #$d8
0cff : 85 1c __ STA ACCU + 1 
0d01 : a5 0e __ LDA P1 ; (fg + 0)
0d03 : a0 27 __ LDY #$27
.l5:
0d05 : 91 1b __ STA (ACCU + 0),y 
0d07 : 88 __ __ DEY
0d08 : 10 fb __ BPL $0d05 ; (rowcol.l5 + 0)
.s3:
0d0a : 60 __ __ RTS
--------------------------------------------------------------------
any_key: ; any_key()->u8
; 143, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0d0b : a9 7f __ LDA #$7f
0d0d : 8d 00 dc STA $dc00 
0d10 : ad 01 dc LDA $dc01 
0d13 : 29 10 __ AND #$10
0d15 : f0 0b __ BEQ $0d22 ; (any_key.s5 + 0)
.s6:
0d17 : a9 fd __ LDA #$fd
0d19 : 8d 00 dc STA $dc00 
0d1c : ad 01 dc LDA $dc01 
0d1f : 4a __ __ LSR
0d20 : b0 08 __ BCS $0d2a ; (any_key.s7 + 0)
.s5:
0d22 : a9 ff __ LDA #$ff
0d24 : 8d 00 dc STA $dc00 
.s10:
0d27 : a9 01 __ LDA #$01
.s3:
0d29 : 60 __ __ RTS
.s7:
0d2a : a9 fe __ LDA #$fe
0d2c : 8d 00 dc STA $dc00 
0d2f : ad 01 dc LDA $dc01 
0d32 : 29 10 __ AND #$10
0d34 : a2 ff __ LDX #$ff
0d36 : 8e 00 dc STX $dc00 
0d39 : aa __ __ TAX
0d3a : f0 eb __ BEQ $0d27 ; (any_key.s10 + 0)
.s8:
0d3c : ad 00 dc LDA $dc00 
0d3f : 29 10 __ AND #$10
0d41 : f0 e4 __ BEQ $0d27 ; (any_key.s10 + 0)
.s9:
0d43 : a9 00 __ LDA #$00
0d45 : 60 __ __ RTS
--------------------------------------------------------------------
fade_to_black: ; fade_to_black()->void
; 220, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0d46 : a9 00 __ LDA #$00
0d48 : 85 0e __ STA P1 
0d4a : 85 0d __ STA P0 
.l6:
0d4c : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
0d4f : 20 df 0c JSR $0cdf ; (rowcol.s4 + 0)
0d52 : e6 0d __ INC P0 
0d54 : a5 0d __ LDA P0 
0d56 : c9 19 __ CMP #$19
0d58 : 90 f2 __ BCC $0d4c ; (fade_to_black.l6 + 0)
.s5:
0d5a : a9 00 __ LDA #$00
0d5c : 8d 20 d0 STA $d020 
0d5f : 8d 21 d0 STA $d021 
.s3:
0d62 : 60 __ __ RTS
--------------------------------------------------------------------
scene2_run: ; scene2_run()->void
; 863, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0d63 : a9 01 __ LDA #$01
0d65 : 85 0d __ STA P0 
0d67 : a9 0b __ LDA #$0b
0d69 : 85 11 __ STA P4 
0d6b : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
0d6e : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
0d71 : a9 ea __ LDA #$ea
0d73 : 85 0f __ STA P2 
0d75 : a9 17 __ LDA #$17
0d77 : 85 10 __ STA P3 
0d79 : 20 bc 0b JSR $0bbc ; (pcenter.s4 + 0)
0d7c : a9 02 __ LDA #$02
0d7e : 20 81 0b JSR $0b81 ; (hline.s4 + 0)
0d81 : a9 0a __ LDA #$0a
0d83 : 85 0d __ STA P0 
0d85 : a9 17 __ LDA #$17
0d87 : 85 10 __ STA P3 
0d89 : a9 f8 __ LDA #$f8
0d8b : 85 0f __ STA P2 
0d8d : 20 dd 16 JSR $16dd ; (pat@proxy + 0)
0d90 : a9 0c __ LDA #$0c
0d92 : 85 0d __ STA P0 
0d94 : a9 18 __ LDA #$18
0d96 : 85 10 __ STA P3 
0d98 : a9 e4 __ LDA #$e4
0d9a : 85 0f __ STA P2 
0d9c : 20 e8 0b JSR $0be8 ; (pat.s4 + 0)
0d9f : a9 0e __ LDA #$0e
0da1 : 85 0d __ STA P0 
0da3 : a9 18 __ LDA #$18
0da5 : 85 10 __ STA P3 
0da7 : a9 ee __ LDA #$ee
0da9 : 85 0f __ STA P2 
0dab : 20 e8 0b JSR $0be8 ; (pat.s4 + 0)
0dae : a9 10 __ LDA #$10
0db0 : 20 81 0b JSR $0b81 ; (hline.s4 + 0)
0db3 : a9 0a __ LDA #$0a
0db5 : 85 0f __ STA P2 
0db7 : a9 19 __ LDA #$19
0db9 : 85 15 __ STA P8 
0dbb : a9 06 __ LDA #$06
0dbd : 85 10 __ STA P3 
0dbf : a9 00 __ LDA #$00
0dc1 : 85 11 __ STA P4 
0dc3 : a9 00 __ LDA #$00
0dc5 : 85 0d __ STA P0 
0dc7 : a9 23 __ LDA #$23
0dc9 : 85 0e __ STA P1 
0dcb : a9 7e __ LDA #$7e
0dcd : 85 12 __ STA P5 
0dcf : a9 19 __ LDA #$19
0dd1 : 85 13 __ STA P6 
0dd3 : a9 8e __ LDA #$8e
0dd5 : 85 14 __ STA P7 
0dd7 : 20 53 12 JSR $1253 ; (scroller_init.s4 + 0)
0dda : e6 11 __ INC P4 
0ddc : a9 0c __ LDA #$0c
0dde : 85 0f __ STA P2 
0de0 : a9 33 __ LDA #$33
0de2 : 85 0d __ STA P0 
0de4 : a9 1a __ LDA #$1a
0de6 : 85 15 __ STA P8 
0de8 : a9 23 __ LDA #$23
0dea : 85 0e __ STA P1 
0dec : a9 e8 __ LDA #$e8
0dee : 85 12 __ STA P5 
0df0 : a9 19 __ LDA #$19
0df2 : 85 13 __ STA P6 
0df4 : a9 00 __ LDA #$00
0df6 : 85 14 __ STA P7 
0df8 : 20 53 12 JSR $1253 ; (scroller_init.s4 + 0)
0dfb : c6 11 __ DEC P4 
0dfd : a9 0e __ LDA #$0e
0dff : 85 0f __ STA P2 
0e01 : a9 0a __ LDA #$0a
0e03 : 85 10 __ STA P3 
0e05 : a9 66 __ LDA #$66
0e07 : 85 0d __ STA P0 
0e09 : a9 1a __ LDA #$1a
0e0b : 85 15 __ STA P8 
0e0d : a9 23 __ LDA #$23
0e0f : 85 0e __ STA P1 
0e11 : a9 61 __ LDA #$61
0e13 : 85 12 __ STA P5 
0e15 : a9 1a __ LDA #$1a
0e17 : 85 13 __ STA P6 
0e19 : a9 71 __ LDA #$71
0e1b : 85 14 __ STA P7 
0e1d : 20 53 12 JSR $1253 ; (scroller_init.s4 + 0)
0e20 : a9 00 __ LDA #$00
0e22 : 85 4e __ STA T5 + 0 
0e24 : 8d df 17 STA $17df ; (blink_phase + 0)
0e27 : 8d de 17 STA $17de ; (blink_cnt + 0)
0e2a : 85 4a __ STA T2 + 0 
0e2c : 85 49 __ STA T1 + 0 
0e2e : a9 02 __ LDA #$02
0e30 : 85 4b __ STA T3 + 0 
0e32 : 85 4d __ STA T4 + 0 
.l5:
0e34 : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
0e37 : a9 00 __ LDA #$00
0e39 : 85 0d __ STA P0 
0e3b : a9 23 __ LDA #$23
0e3d : 85 0e __ STA P1 
0e3f : 20 91 12 JSR $1291 ; (scroller_step.s4 + 0)
0e42 : a9 33 __ LDA #$33
0e44 : 85 0d __ STA P0 
0e46 : a9 23 __ LDA #$23
0e48 : 85 0e __ STA P1 
0e4a : 20 91 12 JSR $1291 ; (scroller_step.s4 + 0)
0e4d : a9 66 __ LDA #$66
0e4f : 85 0d __ STA P0 
0e51 : a9 23 __ LDA #$23
0e53 : 85 0e __ STA P1 
0e55 : 20 91 12 JSR $1291 ; (scroller_step.s4 + 0)
0e58 : 20 89 13 JSR $1389 ; (scroller_crossflash.s4 + 0)
0e5b : e6 4a __ INC T2 + 0 
0e5d : a6 49 __ LDX T1 + 0 
0e5f : e0 04 __ CPX #$04
0e61 : 90 03 __ BCC $0e66 ; (scene2_run.s23 + 0)
0e63 : 4c 27 0f JMP $0f27 ; (scene2_run.s6 + 0)
.s23:
0e66 : bd bb 16 LDA $16bb,x ; (__multab100L + 0)
0e69 : 69 50 __ ADC #$50
0e6b : c5 4a __ CMP T2 + 0 
0e6d : 90 02 __ BCC $0e71 ; (scene2_run.s24 + 0)
.s40:
0e6f : d0 c3 __ BNE $0e34 ; (scene2_run.l5 + 0)
.s24:
0e71 : 8a __ __ TXA
0e72 : d0 37 __ BNE $0eab ; (scene2_run.s26 + 0)
.s25:
0e74 : a5 4b __ LDA T3 + 0 
0e76 : 85 11 __ STA P4 
0e78 : a9 12 __ LDA #$12
0e7a : 85 0d __ STA P0 
0e7c : a9 02 __ LDA #$02
0e7e : 85 10 __ STA P3 
0e80 : a9 f7 __ LDA #$f7
0e82 : 85 12 __ STA P5 
0e84 : a9 18 __ LDA #$18
0e86 : 85 13 __ STA P6 
0e88 : 20 01 14 JSR $1401 ; (reveal_word.s4 + 0)
0e8b : 85 4b __ STA T3 + 0 
0e8d : a5 4d __ LDA T4 + 0 
0e8f : 85 11 __ STA P4 
0e91 : a9 14 __ LDA #$14
0e93 : 85 0d __ STA P0 
0e95 : a9 0a __ LDA #$0a
0e97 : 85 10 __ STA P3 
0e99 : a9 ca __ LDA #$ca
0e9b : 85 12 __ STA P5 
0e9d : a9 1a __ LDA #$1a
0e9f : 85 13 __ STA P6 
0ea1 : 20 01 14 JSR $1401 ; (reveal_word.s4 + 0)
0ea4 : 85 4d __ STA T4 + 0 
0ea6 : a9 01 __ LDA #$01
0ea8 : 4c 4e 12 JMP $124e ; (scene2_run.s38 + 0)
.s26:
0eab : c9 01 __ CMP #$01
0ead : d0 31 __ BNE $0ee0 ; (scene2_run.s27 + 0)
.s32:
0eaf : 20 ed 13 JSR $13ed ; (reveal_word@proxy + 0)
0eb2 : 85 11 __ STA P4 
0eb4 : a9 03 __ LDA #$03
0eb6 : 85 10 __ STA P3 
0eb8 : a9 19 __ LDA #$19
0eba : 85 13 __ STA P6 
0ebc : a9 f8 __ LDA #$f8
0ebe : 85 12 __ STA P5 
0ec0 : 20 01 14 JSR $1401 ; (reveal_word.s4 + 0)
0ec3 : 85 4b __ STA T3 + 0 
0ec5 : 20 c6 16 JSR $16c6 ; (reveal_word@proxy + 0)
0ec8 : 85 11 __ STA P4 
0eca : a9 0e __ LDA #$0e
0ecc : 85 10 __ STA P3 
0ece : a9 1a __ LDA #$1a
0ed0 : 85 13 __ STA P6 
0ed2 : a9 d7 __ LDA #$d7
0ed4 : 85 12 __ STA P5 
0ed6 : 20 01 14 JSR $1401 ; (reveal_word.s4 + 0)
0ed9 : 85 4d __ STA T4 + 0 
0edb : a9 02 __ LDA #$02
0edd : 4c 4e 12 JMP $124e ; (scene2_run.s38 + 0)
.s27:
0ee0 : c9 02 __ CMP #$02
0ee2 : d0 31 __ BNE $0f15 ; (scene2_run.s28 + 0)
.s31:
0ee4 : 20 ed 13 JSR $13ed ; (reveal_word@proxy + 0)
0ee7 : 85 11 __ STA P4 
0ee9 : a9 0d __ LDA #$0d
0eeb : 85 10 __ STA P3 
0eed : a9 1a __ LDA #$1a
0eef : 85 13 __ STA P6 
0ef1 : a9 dc __ LDA #$dc
0ef3 : 85 12 __ STA P5 
0ef5 : 20 01 14 JSR $1401 ; (reveal_word.s4 + 0)
0ef8 : 85 4b __ STA T3 + 0 
0efa : 20 c6 16 JSR $16c6 ; (reveal_word@proxy + 0)
0efd : 85 11 __ STA P4 
0eff : a9 07 __ LDA #$07
0f01 : 85 10 __ STA P3 
0f03 : a9 1a __ LDA #$1a
0f05 : 85 13 __ STA P6 
0f07 : a9 e5 __ LDA #$e5
0f09 : 85 12 __ STA P5 
0f0b : 20 01 14 JSR $1401 ; (reveal_word.s4 + 0)
0f0e : 85 4d __ STA T4 + 0 
0f10 : a9 03 __ LDA #$03
0f12 : 4c 4e 12 JMP $124e ; (scene2_run.s38 + 0)
.s28:
0f15 : c9 03 __ CMP #$03
0f17 : d0 03 __ BNE $0f1c ; (scene2_run.s29 + 0)
0f19 : 4c 1d 12 JMP $121d ; (scene2_run.s30 + 0)
.s29:
0f1c : e6 49 __ INC T1 + 0 
0f1e : a5 49 __ LDA T1 + 0 
0f20 : c9 04 __ CMP #$04
0f22 : b0 03 __ BCS $0f27 ; (scene2_run.s6 + 0)
0f24 : 4c 34 0e JMP $0e34 ; (scene2_run.l5 + 0)
.s6:
0f27 : e6 4e __ INC T5 + 0 
0f29 : a5 4e __ LDA T5 + 0 
0f2b : c9 96 __ CMP #$96
0f2d : 90 f5 __ BCC $0f24 ; (scene2_run.s29 + 8)
.s7:
0f2f : a9 05 __ LDA #$05
0f31 : 85 0d __ STA P0 
0f33 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
0f36 : a9 00 __ LDA #$00
0f38 : 8d 20 d0 STA $d020 
0f3b : 8d 21 d0 STA $d021 
0f3e : 20 05 0a JSR $0a05 ; (glitch_transition.s4 + 0)
0f41 : 20 15 17 JSR $1715 ; (wait_frames@proxy + 0)
0f44 : a9 08 __ LDA #$08
0f46 : 85 0d __ STA P0 
0f48 : a9 07 __ LDA #$07
0f4a : 85 11 __ STA P4 
0f4c : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
0f4f : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
0f52 : a9 00 __ LDA #$00
0f54 : 85 0f __ STA P2 
0f56 : a9 1b __ LDA #$1b
0f58 : 85 10 __ STA P3 
0f5a : 20 bc 0b JSR $0bbc ; (pcenter.s4 + 0)
0f5d : a9 0a __ LDA #$0a
0f5f : 20 81 0b JSR $0b81 ; (hline.s4 + 0)
0f62 : a9 0c __ LDA #$0c
0f64 : 85 0d __ STA P0 
0f66 : a9 1a __ LDA #$1a
0f68 : 85 10 __ STA P3 
0f6a : a9 0f __ LDA #$0f
0f6c : 85 11 __ STA P4 
0f6e : a9 fb __ LDA #$fb
0f70 : 85 0f __ STA P2 
0f72 : 20 dd 16 JSR $16dd ; (pat@proxy + 0)
0f75 : a9 16 __ LDA #$16
0f77 : 85 0d __ STA P0 
0f79 : a9 1b __ LDA #$1b
0f7b : 85 10 __ STA P3 
0f7d : a9 23 __ LDA #$23
0f7f : 85 0f __ STA P2 
0f81 : 20 b8 0b JSR $0bb8 ; (pcenter@proxy + 0)
0f84 : a9 20 __ LDA #$20
0f86 : a2 26 __ LDX #$26
.l33:
0f88 : 9d 93 22 STA $2293,x ; (input_buf[0] + 0)
0f8b : ca __ __ DEX
0f8c : 10 fa __ BPL $0f88 ; (scene2_run.l33 + 0)
.s34:
0f8e : 20 6f 14 JSR $146f ; (input_line.s4 + 0)
0f91 : a5 1b __ LDA ACCU + 0 
0f93 : aa __ __ TAX
0f94 : 4c 99 0f JMP $0f99 ; (scene2_run.l8 + 0)
.s22:
0f97 : ca __ __ DEX
0f98 : 8a __ __ TXA
.l8:
0f99 : c9 01 __ CMP #$01
0f9b : a9 00 __ LDA #$00
0f9d : 6a __ __ ROR
0f9e : a8 __ __ TAY
0f9f : f0 07 __ BEQ $0fa8 ; (scene2_run.s39 + 0)
.s21:
0fa1 : bd 92 22 LDA $2292,x ; (scroll_buf[0] + 39)
0fa4 : c9 20 __ CMP #$20
0fa6 : f0 ef __ BEQ $0f97 ; (scene2_run.s22 + 0)
.s39:
0fa8 : 86 4d __ STX T4 + 0 
0faa : 84 4e __ STY T5 + 0 
0fac : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
0faf : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
0fb2 : a9 08 __ LDA #$08
0fb4 : 85 49 __ STA T1 + 0 
.l9:
0fb6 : a9 0c __ LDA #$0c
0fb8 : 85 0d __ STA P0 
0fba : 85 10 __ STA P3 
0fbc : a9 2e __ LDA #$2e
0fbe : 85 0f __ STA P2 
0fc0 : 20 f9 16 JSR $16f9 ; (pch@proxy + 0)
0fc3 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
0fc6 : a9 0c __ LDA #$0c
0fc8 : 85 0d __ STA P0 
0fca : 20 f2 16 JSR $16f2 ; (pch@proxy + 0)
0fcd : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
0fd0 : a9 0c __ LDA #$0c
0fd2 : 85 0d __ STA P0 
0fd4 : 20 eb 16 JSR $16eb ; (pch@proxy + 0)
0fd7 : 20 0e 17 JSR $170e ; (wait_frames@proxy + 0)
0fda : a9 0c __ LDA #$0c
0fdc : 85 0d __ STA P0 
0fde : a9 00 __ LDA #$00
0fe0 : 85 10 __ STA P3 
0fe2 : a9 12 __ LDA #$12
0fe4 : 85 0e __ STA P1 
0fe6 : 20 30 14 JSR $1430 ; (pch@proxy + 0)
0fe9 : 20 f2 16 JSR $16f2 ; (pch@proxy + 0)
0fec : 20 eb 16 JSR $16eb ; (pch@proxy + 0)
0fef : 20 15 17 JSR $1715 ; (wait_frames@proxy + 0)
0ff2 : c6 49 __ DEC T1 + 0 
0ff4 : d0 c0 __ BNE $0fb6 ; (scene2_run.l9 + 0)
.s10:
0ff6 : a0 00 __ LDY #$00
0ff8 : 84 43 __ STY T0 + 0 
0ffa : a9 28 __ LDA #$28
0ffc : 85 4f __ STA T6 + 0 
.l11:
0ffe : 84 49 __ STY T1 + 0 
1000 : a9 d8 __ LDA #$d8
1002 : 85 44 __ STA T0 + 1 
1004 : a2 19 __ LDX #$19
1006 : 18 __ __ CLC
.l35:
1007 : a9 00 __ LDA #$00
1009 : 91 43 __ STA (T0 + 0),y 
100b : 98 __ __ TYA
100c : 69 28 __ ADC #$28
100e : a8 __ __ TAY
100f : 90 03 __ BCC $1014 ; (scene2_run.s42 + 0)
.s41:
1011 : e6 44 __ INC T0 + 1 
1013 : 18 __ __ CLC
.s42:
1014 : ca __ __ DEX
1015 : d0 f0 __ BNE $1007 ; (scene2_run.l35 + 0)
.s36:
1017 : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
101a : 18 __ __ CLC
101b : a5 49 __ LDA T1 + 0 
101d : 69 07 __ ADC #$07
101f : 85 1b __ STA ACCU + 0 
1021 : a9 00 __ LDA #$00
1023 : 85 1c __ STA ACCU + 1 
1025 : 85 04 __ STA WORK + 1 
1027 : a9 28 __ LDA #$28
1029 : 85 03 __ STA WORK + 0 
102b : 20 36 16 JSR $1636 ; (divmod + 0)
102e : a4 05 __ LDY WORK + 2 
1030 : c6 4f __ DEC T6 + 0 
1032 : d0 ca __ BNE $0ffe ; (scene2_run.l11 + 0)
.s12:
1034 : 20 f3 09 JSR $09f3 ; (wait_frames@proxy + 0)
1037 : a9 14 __ LDA #$14
1039 : 85 0d __ STA P0 
103b : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
103e : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
1041 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
1044 : a5 4d __ LDA T4 + 0 
1046 : 85 0d __ STA P0 
1048 : a9 fe __ LDA #$fe
104a : 85 0e __ STA P1 
104c : a9 9f __ LDA #$9f
104e : 85 11 __ STA P4 
1050 : a9 9f __ LDA #$9f
1052 : 85 0f __ STA P2 
1054 : a9 fc __ LDA #$fc
1056 : 85 10 __ STA P3 
1058 : 20 77 15 JSR $1577 ; (find_response.s4 + 0)
105b : a9 07 __ LDA #$07
105d : 85 11 __ STA P4 
105f : a9 21 __ LDA #$21
1061 : 85 14 __ STA P7 
1063 : a9 0d __ LDA #$0d
1065 : 85 12 __ STA P5 
1067 : a9 0b __ LDA #$0b
1069 : 85 15 __ STA P8 
106b : a9 03 __ LDA #$03
106d : 85 16 __ STA P9 
106f : a9 38 __ LDA #$38
1071 : 85 13 __ STA P6 
1073 : 20 09 16 JSR $1609 ; (typeout.l4 + 0)
1076 : 20 f3 09 JSR $09f3 ; (wait_frames@proxy + 0)
1079 : 24 4e __ BIT T5 + 0 
107b : 10 24 __ BPL $10a1 ; (scene2_run.s13 + 0)
.s20:
107d : 38 __ __ SEC
107e : a9 28 __ LDA #$28
1080 : e5 4d __ SBC T4 + 0 
1082 : 4a __ __ LSR
1083 : 85 43 __ STA T0 + 0 
1085 : a0 00 __ LDY #$00
1087 : 84 4b __ STY T3 + 0 
1089 : 18 __ __ CLC
.l43:
108a : a5 43 __ LDA T0 + 0 
108c : 65 4b __ ADC T3 + 0 
108e : aa __ __ TAX
108f : b9 93 22 LDA $2293,y ; (input_buf[0] + 0)
1092 : 9d 40 05 STA $0540,x 
1095 : a9 01 __ LDA #$01
1097 : 9d 40 d9 STA $d940,x 
109a : c8 __ __ INY
109b : 84 4b __ STY T3 + 0 
109d : c4 4d __ CPY T4 + 0 
109f : 90 e9 __ BCC $108a ; (scene2_run.l43 + 0)
.s13:
10a1 : 20 07 17 JSR $1707 ; (wait_frames@proxy + 0)
10a4 : a9 0a __ LDA #$0a
10a6 : 20 81 0b JSR $0b81 ; (hline.s4 + 0)
10a9 : 20 0e 17 JSR $170e ; (wait_frames@proxy + 0)
10ac : a9 0c __ LDA #$0c
10ae : 85 11 __ STA P4 
10b0 : 85 12 __ STA P5 
10b2 : a9 47 __ LDA #$47
10b4 : 85 13 __ STA P6 
10b6 : a9 21 __ LDA #$21
10b8 : 85 14 __ STA P7 
10ba : 20 09 16 JSR $1609 ; (typeout.l4 + 0)
10bd : 20 0e 17 JSR $170e ; (wait_frames@proxy + 0)
10c0 : ad fe 9f LDA $9ffe ; (match_l1 + 0)
10c3 : 85 43 __ STA T0 + 0 
10c5 : ad ff 9f LDA $9fff ; (match_l1 + 1)
10c8 : 85 44 __ STA T0 + 1 
10ca : a0 00 __ LDY #$00
10cc : f0 01 __ BEQ $10cf ; (scene2_run.l14 + 0)
.s19:
10ce : c8 __ __ INY
.l14:
10cf : b1 43 __ LDA (T0 + 0),y 
10d1 : d0 fb __ BNE $10ce ; (scene2_run.s19 + 0)
.s15:
10d3 : 84 49 __ STY T1 + 0 
10d5 : ad fc 9f LDA $9ffc ; (match_l2 + 0)
10d8 : 85 4b __ STA T3 + 0 
10da : ad fd 9f LDA $9ffd ; (match_l2 + 1)
10dd : 85 4c __ STA T3 + 1 
10df : a0 00 __ LDY #$00
10e1 : b1 4b __ LDA (T3 + 0),y 
10e3 : f0 05 __ BEQ $10ea ; (scene2_run.s16 + 0)
.l18:
10e5 : c8 __ __ INY
10e6 : b1 4b __ LDA (T3 + 0),y 
10e8 : d0 fb __ BNE $10e5 ; (scene2_run.l18 + 0)
.s16:
10ea : 84 4e __ STY T5 + 0 
10ec : e6 11 __ INC P4 
10ee : a5 43 __ LDA T0 + 0 
10f0 : 85 13 __ STA P6 
10f2 : a5 44 __ LDA T0 + 1 
10f4 : 85 14 __ STA P7 
10f6 : c6 15 __ DEC P8 
10f8 : 38 __ __ SEC
10f9 : a9 28 __ LDA #$28
10fb : e5 49 __ SBC T1 + 0 
10fd : 6a __ __ ROR
10fe : 49 80 __ EOR #$80
1100 : 85 12 __ STA P5 
1102 : 20 09 16 JSR $1609 ; (typeout.l4 + 0)
1105 : 20 15 17 JSR $1715 ; (wait_frames@proxy + 0)
1108 : e6 11 __ INC P4 
110a : a5 4b __ LDA T3 + 0 
110c : 85 13 __ STA P6 
110e : a5 4c __ LDA T3 + 1 
1110 : 85 14 __ STA P7 
1112 : 38 __ __ SEC
1113 : a9 28 __ LDA #$28
1115 : e5 4e __ SBC T5 + 0 
1117 : 6a __ __ ROR
1118 : 49 80 __ EOR #$80
111a : 85 12 __ STA P5 
111c : 20 09 16 JSR $1609 ; (typeout.l4 + 0)
111f : 20 00 17 JSR $1700 ; (wait_frames@proxy + 0)
1122 : a9 10 __ LDA #$10
1124 : 20 81 0b JSR $0b81 ; (hline.s4 + 0)
1127 : 20 00 17 JSR $1700 ; (wait_frames@proxy + 0)
112a : e6 16 __ INC P9 
112c : a9 12 __ LDA #$12
112e : 85 11 __ STA P4 
1130 : a9 0c __ LDA #$0c
1132 : 85 15 __ STA P8 
1134 : a9 58 __ LDA #$58
1136 : 85 13 __ STA P6 
1138 : a9 21 __ LDA #$21
113a : 85 14 __ STA P7 
113c : 20 bf 16 JSR $16bf ; (typeout@proxy + 0)
113f : a9 78 __ LDA #$78
1141 : 85 0d __ STA P0 
1143 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
1146 : 20 46 0d JSR $0d46 ; (fade_to_black.s4 + 0)
1149 : 20 0e 17 JSR $170e ; (wait_frames@proxy + 0)
114c : a9 1e __ LDA #$1e
114e : 85 0d __ STA P0 
1150 : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
1153 : 20 9f 0a JSR $0a9f ; (cls.s4 + 0)
1156 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
1159 : a9 06 __ LDA #$06
115b : 85 11 __ STA P4 
115d : a9 21 __ LDA #$21
115f : 85 14 __ STA P7 
1161 : a9 0f __ LDA #$0f
1163 : 85 15 __ STA P8 
1165 : a9 02 __ LDA #$02
1167 : 85 16 __ STA P9 
1169 : a9 71 __ LDA #$71
116b : 85 13 __ STA P6 
116d : 20 bf 16 JSR $16bf ; (typeout@proxy + 0)
1170 : 20 f3 09 JSR $09f3 ; (wait_frames@proxy + 0)
1173 : a9 08 __ LDA #$08
1175 : 85 11 __ STA P4 
1177 : a9 21 __ LDA #$21
1179 : 85 14 __ STA P7 
117b : a9 06 __ LDA #$06
117d : 85 12 __ STA P5 
117f : a9 8a __ LDA #$8a
1181 : 85 13 __ STA P6 
1183 : 20 05 16 JSR $1605 ; (typeout@proxy + 0)
1186 : 20 f3 09 JSR $09f3 ; (wait_frames@proxy + 0)
1189 : a9 0b __ LDA #$0b
118b : 85 12 __ STA P5 
118d : 85 15 __ STA P8 
118f : a9 0a __ LDA #$0a
1191 : 85 11 __ STA P4 
1193 : a9 a6 __ LDA #$a6
1195 : 85 13 __ STA P6 
1197 : a9 21 __ LDA #$21
1199 : 85 14 __ STA P7 
119b : 20 09 16 JSR $1609 ; (typeout.l4 + 0)
119e : 20 00 17 JSR $1700 ; (wait_frames@proxy + 0)
11a1 : a9 0d __ LDA #$0d
11a3 : 20 81 0b JSR $0b81 ; (hline.s4 + 0)
11a6 : 20 0e 17 JSR $170e ; (wait_frames@proxy + 0)
11a9 : e6 15 __ INC P8 
11ab : a9 10 __ LDA #$10
11ad : 85 11 __ STA P4 
11af : a9 07 __ LDA #$07
11b1 : 85 12 __ STA P5 
11b3 : e6 16 __ INC P9 
11b5 : a9 b9 __ LDA #$b9
11b7 : 85 13 __ STA P6 
11b9 : a9 21 __ LDA #$21
11bb : 85 14 __ STA P7 
11bd : 20 09 16 JSR $1609 ; (typeout.l4 + 0)
11c0 : a9 0a __ LDA #$0a
11c2 : 85 49 __ STA T1 + 0 
11c4 : 85 0d __ STA P0 
11c6 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
11c9 : e6 11 __ INC P4 
11cb : a9 06 __ LDA #$06
11cd : 85 12 __ STA P5 
11cf : a9 21 __ LDA #$21
11d1 : 85 14 __ STA P7 
11d3 : a9 d3 __ LDA #$d3
11d5 : 85 13 __ STA P6 
11d7 : 20 09 16 JSR $1609 ; (typeout.l4 + 0)
11da : 20 0e 17 JSR $170e ; (wait_frames@proxy + 0)
11dd : e6 11 __ INC P4 
11df : e6 16 __ INC P9 
11e1 : a9 09 __ LDA #$09
11e3 : 85 12 __ STA P5 
11e5 : a9 00 __ LDA #$00
11e7 : 85 13 __ STA P6 
11e9 : a9 22 __ LDA #$22
11eb : 85 14 __ STA P7 
11ed : 20 05 16 JSR $1605 ; (typeout@proxy + 0)
11f0 : a9 3c __ LDA #$3c
11f2 : 85 0d __ STA P0 
11f4 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
11f7 : a9 1e __ LDA #$1e
11f9 : 85 0e __ STA P1 
11fb : a9 01 __ LDA #$01
11fd : 85 10 __ STA P3 
.l37:
11ff : a9 a0 __ LDA #$a0
1201 : 85 0f __ STA P2 
1203 : 20 e4 16 JSR $16e4 ; (pch@proxy + 0)
1206 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
1209 : a9 12 __ LDA #$12
120b : 85 0d __ STA P0 
120d : 20 30 14 JSR $1430 ; (pch@proxy + 0)
1210 : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
1213 : c6 49 __ DEC T1 + 0 
1215 : d0 e8 __ BNE $11ff ; (scene2_run.l37 + 0)
.s17:
1217 : 20 46 0d JSR $0d46 ; (fade_to_black.s4 + 0)
121a : 4c 0e 17 JMP $170e ; (wait_frames@proxy + 0)
.s30:
121d : 20 ed 13 JSR $13ed ; (reveal_word@proxy + 0)
1220 : 85 11 __ STA P4 
1222 : a9 08 __ LDA #$08
1224 : 85 10 __ STA P3 
1226 : a9 1a __ LDA #$1a
1228 : 85 13 __ STA P6 
122a : a9 e8 __ LDA #$e8
122c : 85 12 __ STA P5 
122e : 20 01 14 JSR $1401 ; (reveal_word.s4 + 0)
1231 : 85 4b __ STA T3 + 0 
1233 : 20 c6 16 JSR $16c6 ; (reveal_word@proxy + 0)
1236 : 85 11 __ STA P4 
1238 : a9 04 __ LDA #$04
123a : 85 49 __ STA T1 + 0 
123c : 85 10 __ STA P3 
123e : a9 f1 __ LDA #$f1
1240 : 85 12 __ STA P5 
1242 : a9 1a __ LDA #$1a
1244 : 85 13 __ STA P6 
1246 : 20 01 14 JSR $1401 ; (reveal_word.s4 + 0)
1249 : 85 4d __ STA T4 + 0 
124b : 4c 27 0f JMP $0f27 ; (scene2_run.s6 + 0)
.s38:
124e : 85 49 __ STA T1 + 0 
1250 : 4c 34 0e JMP $0e34 ; (scene2_run.l5 + 0)
--------------------------------------------------------------------
scroller_init: ; scroller_init(struct S#12989*,u8,u8,u8,const u8*,const u8*)->void
; 641, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
1253 : a9 00 __ LDA #$00
1255 : a0 28 __ LDY #$28
1257 : 91 0d __ STA (P0),y ; (s + 0)
1259 : c8 __ __ INY
125a : 91 0d __ STA (P0),y ; (s + 0)
125c : c8 __ __ INY
125d : 91 0d __ STA (P0),y ; (s + 0)
125f : a5 10 __ LDA P3 ; (speed + 0)
1261 : c8 __ __ INY
1262 : 91 0d __ STA (P0),y ; (s + 0)
1264 : a9 00 __ LDA #$00
1266 : c8 __ __ INY
1267 : 91 0d __ STA (P0),y ; (s + 0)
1269 : a5 11 __ LDA P4 ; (dir + 0)
126b : c8 __ __ INY
126c : 91 0d __ STA (P0),y ; (s + 0)
126e : a5 0f __ LDA P2 ; (row + 0)
1270 : c8 __ __ INY
1271 : 91 0d __ STA (P0),y ; (s + 0)
1273 : a5 12 __ LDA P5 ; (wave + 0)
1275 : c8 __ __ INY
1276 : 91 0d __ STA (P0),y ; (s + 0)
1278 : a5 13 __ LDA P6 ; (wave + 1)
127a : c8 __ __ INY
127b : 91 0d __ STA (P0),y ; (s + 0)
127d : a5 14 __ LDA P7 ; (msg + 0)
127f : c8 __ __ INY
1280 : 91 0d __ STA (P0),y ; (s + 0)
1282 : a5 15 __ LDA P8 ; (msg + 1)
1284 : c8 __ __ INY
1285 : 91 0d __ STA (P0),y ; (s + 0)
1287 : a9 20 __ LDA #$20
1289 : a0 27 __ LDY #$27
.l5:
128b : 91 0d __ STA (P0),y ; (s + 0)
128d : 88 __ __ DEY
128e : 10 fb __ BPL $128b ; (scroller_init.l5 + 0)
.s3:
1290 : 60 __ __ RTS
--------------------------------------------------------------------
scroller_step: ; scroller_step(struct S#12989*)->void
; 656, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
1291 : 18 __ __ CLC
1292 : a0 2a __ LDY #$2a
1294 : b1 0d __ LDA (P0),y ; (s + 0)
1296 : 69 01 __ ADC #$01
1298 : 91 0d __ STA (P0),y ; (s + 0)
129a : c8 __ __ INY
129b : d1 0d __ CMP (P0),y ; (s + 0)
129d : 90 5b __ BCC $12fa ; (scroller_step.s5 + 0)
.s10:
129f : a9 00 __ LDA #$00
12a1 : 88 __ __ DEY
12a2 : 91 0d __ STA (P0),y ; (s + 0)
12a4 : a0 28 __ LDY #$28
12a6 : b1 0d __ LDA (P0),y ; (s + 0)
12a8 : 85 1b __ STA ACCU + 0 
12aa : 69 00 __ ADC #$00
12ac : 91 0d __ STA (P0),y ; (s + 0)
12ae : c8 __ __ INY
12af : b1 0d __ LDA (P0),y ; (s + 0)
12b1 : 85 1c __ STA ACCU + 1 
12b3 : 69 00 __ ADC #$00
12b5 : 91 0d __ STA (P0),y ; (s + 0)
12b7 : a0 31 __ LDY #$31
12b9 : b1 0d __ LDA (P0),y ; (s + 0)
12bb : 85 43 __ STA T2 + 0 
12bd : 18 __ __ CLC
12be : 65 1b __ ADC ACCU + 0 
12c0 : 85 1b __ STA ACCU + 0 
12c2 : c8 __ __ INY
12c3 : b1 0d __ LDA (P0),y ; (s + 0)
12c5 : 85 44 __ STA T2 + 1 
12c7 : 65 1c __ ADC ACCU + 1 
12c9 : 85 1c __ STA ACCU + 1 
12cb : a0 00 __ LDY #$00
12cd : b1 1b __ LDA (ACCU + 0),y 
12cf : aa __ __ TAX
12d0 : e0 ff __ CPX #$ff
12d2 : d0 0c __ BNE $12e0 ; (scroller_step.s11 + 0)
.s14:
12d4 : 98 __ __ TYA
12d5 : a0 28 __ LDY #$28
12d7 : 91 0d __ STA (P0),y ; (s + 0)
12d9 : c8 __ __ INY
12da : 91 0d __ STA (P0),y ; (s + 0)
12dc : a8 __ __ TAY
12dd : b1 43 __ LDA (T2 + 0),y 
12df : aa __ __ TAX
.s11:
12e0 : a0 2d __ LDY #$2d
12e2 : b1 0d __ LDA (P0),y ; (s + 0)
12e4 : f0 03 __ BEQ $12e9 ; (scroller_step.s12 + 0)
12e6 : 4c 7a 13 JMP $137a ; (scroller_step.s13 + 0)
.s12:
12e9 : a8 __ __ TAY
.l17:
12ea : c8 __ __ INY
12eb : b1 0d __ LDA (P0),y ; (s + 0)
12ed : 88 __ __ DEY
12ee : 91 0d __ STA (P0),y ; (s + 0)
12f0 : c8 __ __ INY
12f1 : c0 27 __ CPY #$27
12f3 : 90 f5 __ BCC $12ea ; (scroller_step.l17 + 0)
.s18:
12f5 : 8a __ __ TXA
12f6 : a0 27 __ LDY #$27
.s19:
12f8 : 91 0d __ STA (P0),y ; (s + 0)
.s5:
12fa : a0 2c __ LDY #$2c
12fc : b1 0d __ LDA (P0),y ; (s + 0)
12fe : 18 __ __ CLC
12ff : 69 01 __ ADC #$01
1301 : 29 0f __ AND #$0f
1303 : 91 0d __ STA (P0),y ; (s + 0)
1305 : a0 2e __ LDY #$2e
1307 : b1 0d __ LDA (P0),y ; (s + 0)
1309 : 0a __ __ ASL
130a : 85 1b __ STA ACCU + 0 
130c : a9 00 __ LDA #$00
130e : 2a __ __ ROL
130f : 06 1b __ ASL ACCU + 0 
1311 : 2a __ __ ROL
1312 : aa __ __ TAX
1313 : a5 1b __ LDA ACCU + 0 
1315 : 71 0d __ ADC (P0),y ; (s + 0)
1317 : 85 1b __ STA ACCU + 0 
1319 : 8a __ __ TXA
131a : 69 00 __ ADC #$00
131c : 06 1b __ ASL ACCU + 0 
131e : 2a __ __ ROL
131f : 06 1b __ ASL ACCU + 0 
1321 : 2a __ __ ROL
1322 : 06 1b __ ASL ACCU + 0 
1324 : 2a __ __ ROL
1325 : 69 04 __ ADC #$04
1327 : 85 1c __ STA ACCU + 1 
1329 : c8 __ __ INY
132a : b1 0d __ LDA (P0),y ; (s + 0)
132c : 85 43 __ STA T2 + 0 
132e : c8 __ __ INY
132f : b1 0d __ LDA (P0),y ; (s + 0)
1331 : 85 44 __ STA T2 + 1 
1333 : a0 00 __ LDY #$00
.l6:
1335 : 84 1e __ STY ACCU + 3 
1337 : b1 0d __ LDA (P0),y ; (s + 0)
1339 : a0 00 __ LDY #$00
133b : 91 1b __ STA (ACCU + 0),y 
133d : a0 2c __ LDY #$2c
133f : b1 0d __ LDA (P0),y ; (s + 0)
1341 : 85 1d __ STA ACCU + 2 
1343 : c8 __ __ INY
1344 : b1 0d __ LDA (P0),y ; (s + 0)
1346 : d0 08 __ BNE $1350 ; (scroller_step.s9 + 0)
.s7:
1348 : 18 __ __ CLC
1349 : a5 1d __ LDA ACCU + 2 
134b : 65 1e __ ADC ACCU + 3 
134d : 4c 58 13 JMP $1358 ; (scroller_step.s8 + 0)
.s9:
1350 : 38 __ __ SEC
1351 : a9 27 __ LDA #$27
1353 : e5 1e __ SBC ACCU + 3 
1355 : 18 __ __ CLC
1356 : 65 1d __ ADC ACCU + 2 
.s8:
1358 : 29 0f __ AND #$0f
135a : a8 __ __ TAY
135b : a5 1b __ LDA ACCU + 0 
135d : 85 1f __ STA ADDR + 0 
135f : 18 __ __ CLC
1360 : a5 1c __ LDA ACCU + 1 
1362 : 69 d4 __ ADC #$d4
1364 : 85 20 __ STA ADDR + 1 
1366 : b1 43 __ LDA (T2 + 0),y 
1368 : a0 00 __ LDY #$00
136a : 91 1f __ STA (ADDR + 0),y 
136c : e6 1b __ INC ACCU + 0 
136e : d0 02 __ BNE $1372 ; (scroller_step.s21 + 0)
.s20:
1370 : e6 1c __ INC ACCU + 1 
.s21:
1372 : a4 1e __ LDY ACCU + 3 
1374 : c8 __ __ INY
1375 : c0 28 __ CPY #$28
1377 : 90 bc __ BCC $1335 ; (scroller_step.l6 + 0)
.s3:
1379 : 60 __ __ RTS
.s13:
137a : a0 27 __ LDY #$27
.l15:
137c : 88 __ __ DEY
137d : b1 0d __ LDA (P0),y ; (s + 0)
137f : c8 __ __ INY
1380 : 91 0d __ STA (P0),y ; (s + 0)
1382 : 88 __ __ DEY
1383 : d0 f7 __ BNE $137c ; (scroller_step.l15 + 0)
.s16:
1385 : 8a __ __ TXA
1386 : 4c f8 12 JMP $12f8 ; (scroller_step.s19 + 0)
--------------------------------------------------------------------
scroller_crossflash: ; scroller_crossflash()->void
; 696, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
1389 : ad 14 23 LDA $2314 ; (scr[0].buf[0] + 20)
138c : c9 20 __ CMP #$20
138e : f0 5c __ BEQ $13ec ; (scroller_crossflash.s3 + 0)
.s5:
1390 : ad 46 23 LDA $2346 ; (scr[0] + 70)
1393 : c9 20 __ CMP #$20
1395 : f0 55 __ BEQ $13ec ; (scroller_crossflash.s3 + 0)
.s6:
1397 : ad 61 23 LDA $2361 ; (scr[0] + 97)
139a : 0a __ __ ASL
139b : 85 1b __ STA ACCU + 0 
139d : a9 00 __ LDA #$00
139f : 2a __ __ ROL
13a0 : 06 1b __ ASL ACCU + 0 
13a2 : 2a __ __ ROL
13a3 : aa __ __ TAX
13a4 : a5 1b __ LDA ACCU + 0 
13a6 : 6d 61 23 ADC $2361 ; (scr[0] + 97)
13a9 : 85 43 __ STA T0 + 0 
13ab : 8a __ __ TXA
13ac : 69 00 __ ADC #$00
13ae : 06 43 __ ASL T0 + 0 
13b0 : 2a __ __ ROL
13b1 : 06 43 __ ASL T0 + 0 
13b3 : 2a __ __ ROL
13b4 : 06 43 __ ASL T0 + 0 
13b6 : 2a __ __ ROL
13b7 : 69 d8 __ ADC #$d8
13b9 : 85 44 __ STA T0 + 1 
13bb : ad 2e 23 LDA $232e ; (scr[0].row + 0)
13be : 0a __ __ ASL
13bf : 85 1b __ STA ACCU + 0 
13c1 : a9 00 __ LDA #$00
13c3 : 2a __ __ ROL
13c4 : 06 1b __ ASL ACCU + 0 
13c6 : 2a __ __ ROL
13c7 : aa __ __ TAX
13c8 : a5 1b __ LDA ACCU + 0 
13ca : 6d 2e 23 ADC $232e ; (scr[0].row + 0)
13cd : 85 1b __ STA ACCU + 0 
13cf : 8a __ __ TXA
13d0 : 69 00 __ ADC #$00
13d2 : 06 1b __ ASL ACCU + 0 
13d4 : 2a __ __ ROL
13d5 : 06 1b __ ASL ACCU + 0 
13d7 : 2a __ __ ROL
13d8 : 06 1b __ ASL ACCU + 0 
13da : 2a __ __ ROL
13db : 69 d8 __ ADC #$d8
13dd : 85 1c __ STA ACCU + 1 
13df : a9 01 __ LDA #$01
13e1 : a0 10 __ LDY #$10
.l7:
13e3 : 91 1b __ STA (ACCU + 0),y 
13e5 : 91 43 __ STA (T0 + 0),y 
13e7 : c8 __ __ INY
13e8 : c0 18 __ CPY #$18
13ea : d0 f7 __ BNE $13e3 ; (scroller_crossflash.l7 + 0)
.s3:
13ec : 60 __ __ RTS
--------------------------------------------------------------------
reveal_word@proxy: ; reveal_word@proxy
13ed : a9 12 __ LDA #$12
13ef : 85 0d __ STA P0 
13f1 : a9 0b __ LDA #$0b
13f3 : 85 10 __ STA P3 
13f5 : a5 4b __ LDA $4b 
13f7 : 85 11 __ STA P4 
13f9 : a9 fb __ LDA #$fb
13fb : 85 12 __ STA P5 
13fd : a9 18 __ LDA #$18
13ff : 85 13 __ STA P6 
--------------------------------------------------------------------
reveal_word: ; reveal_word(u8,u8,const u8*,u8)->u8
; 852, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
1401 : a0 00 __ LDY #$00
1403 : b1 12 __ LDA (P5),y ; (word + 0)
1405 : f0 26 __ BEQ $142d ; (reveal_word.s5 + 0)
.l6:
1407 : a5 11 __ LDA P4 ; (col + 0)
1409 : 85 0e __ STA P1 
140b : a0 00 __ LDY #$00
140d : b1 12 __ LDA (P5),y ; (word + 0)
140f : 85 0f __ STA P2 
1411 : 20 34 14 JSR $1434 ; (pch.s4 + 0)
1414 : e6 11 __ INC P4 ; (col + 0)
1416 : a5 12 __ LDA P5 ; (word + 0)
1418 : 85 1b __ STA ACCU + 0 
141a : 18 __ __ CLC
141b : 69 01 __ ADC #$01
141d : 85 12 __ STA P5 ; (word + 0)
141f : a5 13 __ LDA P6 ; (word + 1)
1421 : 85 1c __ STA ACCU + 1 
1423 : 69 00 __ ADC #$00
1425 : 85 13 __ STA P6 ; (word + 1)
1427 : a0 01 __ LDY #$01
1429 : b1 1b __ LDA (ACCU + 0),y 
142b : d0 da __ BNE $1407 ; (reveal_word.l6 + 0)
.s5:
142d : a5 11 __ LDA P4 ; (col + 0)
.s3:
142f : 60 __ __ RTS
--------------------------------------------------------------------
pch@proxy: ; pch@proxy
1430 : a9 20 __ LDA #$20
1432 : 85 0f __ STA P2 
--------------------------------------------------------------------
pch: ; pch(u8,u8,u8,u8)->void
; 103, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
1434 : a5 0d __ LDA P0 ; (row + 0)
1436 : 0a __ __ ASL
1437 : 85 1b __ STA ACCU + 0 
1439 : a9 00 __ LDA #$00
143b : 2a __ __ ROL
143c : 06 1b __ ASL ACCU + 0 
143e : 2a __ __ ROL
143f : aa __ __ TAX
1440 : a5 1b __ LDA ACCU + 0 
1442 : 65 0d __ ADC P0 ; (row + 0)
1444 : 85 43 __ STA T1 + 0 
1446 : 8a __ __ TXA
1447 : 69 00 __ ADC #$00
1449 : 06 43 __ ASL T1 + 0 
144b : 2a __ __ ROL
144c : 06 43 __ ASL T1 + 0 
144e : 2a __ __ ROL
144f : 06 43 __ ASL T1 + 0 
1451 : 2a __ __ ROL
1452 : aa __ __ TAX
1453 : a5 43 __ LDA T1 + 0 
1455 : 65 0e __ ADC P1 ; (col + 0)
1457 : 85 43 __ STA T1 + 0 
1459 : 85 1b __ STA ACCU + 0 
145b : 8a __ __ TXA
145c : 69 04 __ ADC #$04
145e : 85 44 __ STA T1 + 1 
1460 : 69 d4 __ ADC #$d4
1462 : 85 1c __ STA ACCU + 1 
1464 : a5 0f __ LDA P2 ; (ch + 0)
1466 : a0 00 __ LDY #$00
1468 : 91 43 __ STA (T1 + 0),y 
146a : a5 10 __ LDA P3 ; (fg + 0)
146c : 91 1b __ STA (ACCU + 0),y 
.s3:
146e : 60 __ __ RTS
--------------------------------------------------------------------
input_line: ; input_line(u8,u8,u8,u8*,u8)->u8
; 763, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
146f : a9 00 __ LDA #$00
1471 : 85 46 __ STA T4 + 0 
1473 : 85 47 __ STA T5 + 0 
1475 : a9 01 __ LDA #$01
1477 : 85 48 __ STA T6 + 0 
1479 : 85 10 __ STA P3 
147b : a9 0c __ LDA #$0c
147d : 85 0d __ STA P0 
147f : a9 20 __ LDA #$20
1481 : 85 0f __ STA P2 
1483 : a9 03 __ LDA #$03
1485 : 85 0e __ STA P1 
.l17:
1487 : 20 34 14 JSR $1434 ; (pch.s4 + 0)
148a : e6 0e __ INC P1 
148c : a5 0e __ LDA P1 
148e : c9 28 __ CMP #$28
1490 : d0 f5 __ BNE $1487 ; (input_line.l17 + 0)
.l5:
1492 : 20 5a 0c JSR $0c5a ; (wait_frame.l4 + 0)
1495 : e6 47 __ INC T5 + 0 
1497 : a5 47 __ LDA T5 + 0 
1499 : c9 14 __ CMP #$14
149b : 90 09 __ BCC $14a6 ; (input_line.s6 + 0)
.s16:
149d : a9 00 __ LDA #$00
149f : 85 47 __ STA T5 + 0 
14a1 : c5 48 __ CMP T6 + 0 
14a3 : 2a __ __ ROL
14a4 : 85 48 __ STA T6 + 0 
.s6:
14a6 : a9 0c __ LDA #$0c
14a8 : 85 0d __ STA P0 
14aa : a9 01 __ LDA #$01
14ac : 85 10 __ STA P3 
14ae : a5 48 __ LDA T6 + 0 
14b0 : f0 04 __ BEQ $14b6 ; (input_line.s18 + 0)
.s19:
14b2 : a9 a0 __ LDA #$a0
14b4 : 90 02 __ BCC $14b8 ; (input_line.s20 + 0)
.s18:
14b6 : a9 20 __ LDA #$20
.s20:
14b8 : 85 0f __ STA P2 
14ba : 18 __ __ CLC
14bb : a5 46 __ LDA T4 + 0 
14bd : 69 03 __ ADC #$03
14bf : 85 0e __ STA P1 
14c1 : 20 34 14 JSR $1434 ; (pch.s4 + 0)
14c4 : 20 29 15 JSR $1529 ; (read_key.s4 + 0)
14c7 : aa __ __ TAX
14c8 : f0 c8 __ BEQ $1492 ; (input_line.l5 + 0)
.s7:
14ca : c9 0d __ CMP #$0d
14cc : f0 4e __ BEQ $151c ; (input_line.s15 + 0)
.s8:
14ce : c9 14 __ CMP #$14
14d0 : d0 24 __ BNE $14f6 ; (input_line.s9 + 0)
.s13:
14d2 : a5 46 __ LDA T4 + 0 
14d4 : f0 bc __ BEQ $1492 ; (input_line.l5 + 0)
.s14:
14d6 : 20 30 14 JSR $1430 ; (pch@proxy + 0)
14d9 : 18 __ __ CLC
14da : a5 46 __ LDA T4 + 0 
14dc : 69 ff __ ADC #$ff
14de : 85 45 __ STA T2 + 0 
14e0 : 18 __ __ CLC
14e1 : 69 03 __ ADC #$03
14e3 : 85 0e __ STA P1 
14e5 : 20 34 14 JSR $1434 ; (pch.s4 + 0)
14e8 : a9 00 __ LDA #$00
14ea : a6 46 __ LDX T4 + 0 
14ec : 9d 92 22 STA $2292,x ; (scroll_buf[0] + 39)
.s12:
14ef : a5 45 __ LDA T2 + 0 
14f1 : 85 46 __ STA T4 + 0 
14f3 : 4c 92 14 JMP $1492 ; (input_line.l5 + 0)
.s9:
14f6 : 20 4c 15 JSR $154c ; (petscii_to_sc.s4 + 0)
14f9 : a8 __ __ TAY
14fa : f0 96 __ BEQ $1492 ; (input_line.l5 + 0)
.s10:
14fc : a6 46 __ LDX T4 + 0 
14fe : e0 24 __ CPX #$24
1500 : b0 90 __ BCS $1492 ; (input_line.l5 + 0)
.s11:
1502 : 85 0f __ STA P2 
1504 : 98 __ __ TYA
1505 : 9d 93 22 STA $2293,x ; (input_buf[0] + 0)
1508 : 20 34 14 JSR $1434 ; (pch.s4 + 0)
150b : a9 20 __ LDA #$20
150d : 85 0f __ STA P2 
150f : a6 46 __ LDX T4 + 0 
1511 : e8 __ __ INX
1512 : 86 45 __ STX T2 + 0 
1514 : e6 0e __ INC P1 
1516 : 20 34 14 JSR $1434 ; (pch.s4 + 0)
1519 : 4c ef 14 JMP $14ef ; (input_line.s12 + 0)
.s15:
151c : 20 30 14 JSR $1430 ; (pch@proxy + 0)
151f : a9 00 __ LDA #$00
1521 : a6 46 __ LDX T4 + 0 
1523 : 86 1b __ STX ACCU + 0 
1525 : 9d 93 22 STA $2293,x ; (input_buf[0] + 0)
.s3:
1528 : 60 __ __ RTS
--------------------------------------------------------------------
read_key: ; read_key()->u8
; 740, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
1529 : a5 c6 __ LDA $c6 
152b : f0 1e __ BEQ $154b ; (read_key.s3 + 0)
.s5:
152d : ae 77 02 LDX $0277 
1530 : a5 c6 __ LDA $c6 
1532 : 38 __ __ SEC
1533 : e9 01 __ SBC #$01
1535 : f0 11 __ BEQ $1548 ; (read_key.s6 + 0)
.s7:
1537 : 85 1b __ STA ACCU + 0 
1539 : a0 00 __ LDY #$00
.l8:
153b : b9 78 02 LDA $0278,y 
153e : 99 77 02 STA $0277,y 
1541 : c8 __ __ INY
1542 : c4 1b __ CPY ACCU + 0 
1544 : 90 f5 __ BCC $153b ; (read_key.l8 + 0)
.s9:
1546 : a5 1b __ LDA ACCU + 0 
.s6:
1548 : 85 c6 __ STA $c6 
154a : 8a __ __ TXA
.s3:
154b : 60 __ __ RTS
--------------------------------------------------------------------
petscii_to_sc: ; petscii_to_sc(u8)->u8
; 752, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
154c : c9 41 __ CMP #$41
154e : 90 22 __ BCC $1572 ; (petscii_to_sc.s5 + 0)
.s13:
1550 : c9 5b __ CMP #$5b
1552 : b0 03 __ BCS $1557 ; (petscii_to_sc.s6 + 0)
.s14:
1554 : e9 3f __ SBC #$3f
.s3:
1556 : 60 __ __ RTS
.s6:
1557 : c9 2e __ CMP #$2e
1559 : f0 fb __ BEQ $1556 ; (petscii_to_sc.s3 + 0)
.s7:
155b : c9 21 __ CMP #$21
155d : f0 f7 __ BEQ $1556 ; (petscii_to_sc.s3 + 0)
.s8:
155f : c9 3f __ CMP #$3f
1561 : f0 f3 __ BEQ $1556 ; (petscii_to_sc.s3 + 0)
.s9:
1563 : c9 2d __ CMP #$2d
1565 : f0 ef __ BEQ $1556 ; (petscii_to_sc.s3 + 0)
.s10:
1567 : c9 30 __ CMP #$30
1569 : 90 04 __ BCC $156f ; (petscii_to_sc.s11 + 0)
.s12:
156b : c9 3a __ CMP #$3a
156d : 90 e7 __ BCC $1556 ; (petscii_to_sc.s3 + 0)
.s11:
156f : a9 00 __ LDA #$00
1571 : 60 __ __ RTS
.s5:
1572 : c9 20 __ CMP #$20
1574 : d0 e1 __ BNE $1557 ; (petscii_to_sc.s6 + 0)
1576 : 60 __ __ RTS
--------------------------------------------------------------------
find_response: ; find_response(const u8*,u8,const u8**,const u8**)->void
; 238, "C:/code/jonas/c64Demo/responses.h"
.s4:
1577 : a9 00 __ LDA #$00
1579 : 85 43 __ STA T6 + 0 
.l5:
157b : 0a __ __ ASL
157c : aa __ __ TAX
157d : bd 47 1b LDA $1b47,x ; (_kw_table[0] + 0)
1580 : 85 1b __ STA ACCU + 0 
1582 : bd 48 1b LDA $1b48,x ; (_kw_table[0] + 1)
1585 : 85 1c __ STA ACCU + 1 
1587 : a0 00 __ LDY #$00
1589 : f0 01 __ BEQ $158c ; (find_response.l6 + 0)
.s19:
158b : c8 __ __ INY
.l6:
158c : b1 1b __ LDA (ACCU + 0),y 
158e : d0 fb __ BNE $158b ; (find_response.s19 + 0)
.s7:
1590 : 84 1d __ STY ACCU + 2 
1592 : a5 0d __ LDA P0 ; (ilen + 0)
1594 : c5 1d __ CMP ACCU + 2 
1596 : 90 17 __ BCC $15af ; (find_response.s10 + 0)
.s8:
1598 : a9 00 __ LDA #$00
159a : 85 44 __ STA T9 + 0 
159c : b0 04 __ BCS $15a2 ; (find_response.l9 + 0)
.s17:
159e : e6 44 __ INC T9 + 0 
15a0 : a5 44 __ LDA T9 + 0 
.l9:
15a2 : 85 1e __ STA ACCU + 3 
15a4 : 18 __ __ CLC
15a5 : 65 1d __ ADC ACCU + 2 
15a7 : b0 06 __ BCS $15af ; (find_response.s10 + 0)
.s18:
15a9 : c5 0d __ CMP P0 ; (ilen + 0)
15ab : 90 20 __ BCC $15cd ; (find_response.s12 + 0)
.s20:
15ad : f0 1e __ BEQ $15cd ; (find_response.s12 + 0)
.s10:
15af : e6 43 __ INC T6 + 0 
15b1 : a5 43 __ LDA T6 + 0 
15b3 : c9 2a __ CMP #$2a
15b5 : 90 c4 __ BCC $157b ; (find_response.l5 + 0)
.s11:
15b7 : a9 00 __ LDA #$00
15b9 : a0 00 __ LDY #$00
15bb : 91 0e __ STA (P1),y ; (out_l1 + 0)
15bd : a9 21 __ LDA #$21
15bf : c8 __ __ INY
15c0 : 91 0e __ STA (P1),y ; (out_l1 + 0)
15c2 : a9 1e __ LDA #$1e
15c4 : 88 __ __ DEY
15c5 : 91 10 __ STA (P3),y ; (out_l2 + 0)
15c7 : a9 21 __ LDA #$21
15c9 : c8 __ __ INY
.s3:
15ca : 91 10 __ STA (P3),y ; (out_l2 + 0)
15cc : 60 __ __ RTS
.s12:
15cd : a5 1d __ LDA ACCU + 2 
15cf : f0 1b __ BEQ $15ec ; (find_response.s13 + 0)
.s14:
15d1 : a9 00 __ LDA #$00
15d3 : 85 45 __ STA T10 + 0 
15d5 : 18 __ __ CLC
.l15:
15d6 : a5 1e __ LDA ACCU + 3 
15d8 : 65 45 __ ADC T10 + 0 
15da : a8 __ __ TAY
15db : b9 93 22 LDA $2293,y ; (input_buf[0] + 0)
15de : a4 45 __ LDY T10 + 0 
15e0 : d1 1b __ CMP (ACCU + 0),y 
15e2 : d0 ba __ BNE $159e ; (find_response.s17 + 0)
.s16:
15e4 : e6 45 __ INC T10 + 0 
15e6 : a5 45 __ LDA T10 + 0 
15e8 : c5 1d __ CMP ACCU + 2 
15ea : 90 ea __ BCC $15d6 ; (find_response.l15 + 0)
.s13:
15ec : bd 01 1d LDA $1d01,x ; (_r1_table[0] + 1)
15ef : a0 01 __ LDY #$01
15f1 : 91 0e __ STA (P1),y ; (out_l1 + 0)
15f3 : bd 00 1d LDA $1d00,x ; (_r1_table[0] + 0)
15f6 : 88 __ __ DEY
15f7 : 91 0e __ STA (P1),y ; (out_l1 + 0)
15f9 : bd 01 1f LDA $1f01,x ; (_r2_table[0] + 1)
15fc : c8 __ __ INY
15fd : 91 10 __ STA (P3),y ; (out_l2 + 0)
15ff : bd 00 1f LDA $1f00,x ; (_r2_table[0] + 0)
1602 : 88 __ __ DEY
1603 : f0 c5 __ BEQ $15ca ; (find_response.s3 + 0)
--------------------------------------------------------------------
typeout@proxy: ; typeout@proxy
1605 : a9 01 __ LDA #$01
1607 : 85 15 __ STA P8 
--------------------------------------------------------------------
typeout: ; typeout(u8,u8,const u8*,u8,u8)->void
; 807, "C:/code/jonas/c64Demo/nineteen84.c"
.l4:
1609 : a0 00 __ LDY #$00
160b : b1 13 __ LDA (P6),y ; (s + 0)
160d : f0 26 __ BEQ $1635 ; (typeout.s3 + 0)
.s5:
160f : 85 0f __ STA P2 
1611 : a5 11 __ LDA P4 ; (row + 0)
1613 : 85 0d __ STA P0 
1615 : a5 15 __ LDA P8 ; (fg + 0)
1617 : 85 10 __ STA P3 
1619 : a5 12 __ LDA P5 ; (col + 0)
161b : 85 0e __ STA P1 
161d : 20 34 14 JSR $1434 ; (pch.s4 + 0)
1620 : a5 16 __ LDA P9 ; (speed + 0)
1622 : 85 0d __ STA P0 
1624 : e6 13 __ INC P6 ; (s + 0)
1626 : d0 02 __ BNE $162a ; (typeout.s7 + 0)
.s6:
1628 : e6 14 __ INC P7 ; (s + 1)
.s7:
162a : e6 12 __ INC P5 ; (col + 0)
162c : 20 f7 09 JSR $09f7 ; (wait_frames.s4 + 0)
162f : 20 0b 0d JSR $0d0b ; (any_key.s4 + 0)
1632 : aa __ __ TAX
1633 : f0 d4 __ BEQ $1609 ; (typeout.l4 + 0)
.s3:
1635 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1636 : a5 1c __ LDA ACCU + 1 
1638 : d0 31 __ BNE $166b ; (divmod + 53)
163a : a5 04 __ LDA WORK + 1 
163c : d0 1e __ BNE $165c ; (divmod + 38)
163e : 85 06 __ STA WORK + 3 
1640 : a2 04 __ LDX #$04
1642 : 06 1b __ ASL ACCU + 0 
1644 : 2a __ __ ROL
1645 : c5 03 __ CMP WORK + 0 
1647 : 90 02 __ BCC $164b ; (divmod + 21)
1649 : e5 03 __ SBC WORK + 0 
164b : 26 1b __ ROL ACCU + 0 
164d : 2a __ __ ROL
164e : c5 03 __ CMP WORK + 0 
1650 : 90 02 __ BCC $1654 ; (divmod + 30)
1652 : e5 03 __ SBC WORK + 0 
1654 : 26 1b __ ROL ACCU + 0 
1656 : ca __ __ DEX
1657 : d0 eb __ BNE $1644 ; (divmod + 14)
1659 : 85 05 __ STA WORK + 2 
165b : 60 __ __ RTS
165c : a5 1b __ LDA ACCU + 0 
165e : 85 05 __ STA WORK + 2 
1660 : a5 1c __ LDA ACCU + 1 
1662 : 85 06 __ STA WORK + 3 
1664 : a9 00 __ LDA #$00
1666 : 85 1b __ STA ACCU + 0 
1668 : 85 1c __ STA ACCU + 1 
166a : 60 __ __ RTS
166b : a5 04 __ LDA WORK + 1 
166d : d0 1f __ BNE $168e ; (divmod + 88)
166f : a5 03 __ LDA WORK + 0 
1671 : 30 1b __ BMI $168e ; (divmod + 88)
1673 : a9 00 __ LDA #$00
1675 : 85 06 __ STA WORK + 3 
1677 : a2 10 __ LDX #$10
1679 : 06 1b __ ASL ACCU + 0 
167b : 26 1c __ ROL ACCU + 1 
167d : 2a __ __ ROL
167e : c5 03 __ CMP WORK + 0 
1680 : 90 02 __ BCC $1684 ; (divmod + 78)
1682 : e5 03 __ SBC WORK + 0 
1684 : 26 1b __ ROL ACCU + 0 
1686 : 26 1c __ ROL ACCU + 1 
1688 : ca __ __ DEX
1689 : d0 f2 __ BNE $167d ; (divmod + 71)
168b : 85 05 __ STA WORK + 2 
168d : 60 __ __ RTS
168e : a9 00 __ LDA #$00
1690 : 85 05 __ STA WORK + 2 
1692 : 85 06 __ STA WORK + 3 
1694 : 84 02 __ STY $02 
1696 : a0 10 __ LDY #$10
1698 : 18 __ __ CLC
1699 : 26 1b __ ROL ACCU + 0 
169b : 26 1c __ ROL ACCU + 1 
169d : 26 05 __ ROL WORK + 2 
169f : 26 06 __ ROL WORK + 3 
16a1 : 38 __ __ SEC
16a2 : a5 05 __ LDA WORK + 2 
16a4 : e5 03 __ SBC WORK + 0 
16a6 : aa __ __ TAX
16a7 : a5 06 __ LDA WORK + 3 
16a9 : e5 04 __ SBC WORK + 1 
16ab : 90 04 __ BCC $16b1 ; (divmod + 123)
16ad : 86 05 __ STX WORK + 2 
16af : 85 06 __ STA WORK + 3 
16b1 : 88 __ __ DEY
16b2 : d0 e5 __ BNE $1699 ; (divmod + 99)
16b4 : 26 1b __ ROL ACCU + 0 
16b6 : 26 1c __ ROL ACCU + 1 
16b8 : a4 02 __ LDY $02 
16ba : 60 __ __ RTS
--------------------------------------------------------------------
__multab100L:
16bb : __ __ __ BYT 00 64 c8 2c                                     : .d.,
--------------------------------------------------------------------
typeout@proxy: ; typeout@proxy
16bf : a9 08 __ LDA #$08
16c1 : 85 12 __ STA P5 
16c3 : 4c 09 16 JMP $1609 ; (typeout.l4 + 0)
--------------------------------------------------------------------
reveal_word@proxy: ; reveal_word@proxy
16c6 : a9 14 __ LDA #$14
16c8 : 85 0d __ STA P0 
16ca : a9 0b __ LDA #$0b
16cc : 85 10 __ STA P3 
16ce : a5 4d __ LDA $4d 
16d0 : 85 11 __ STA P4 
16d2 : a9 fb __ LDA #$fb
16d4 : 85 12 __ STA P5 
16d6 : a9 18 __ LDA #$18
16d8 : 85 13 __ STA P6 
16da : 4c 01 14 JMP $1401 ; (reveal_word.s4 + 0)
--------------------------------------------------------------------
pat@proxy: ; pat@proxy
16dd : a9 01 __ LDA #$01
16df : 85 0e __ STA P1 
16e1 : 4c e8 0b JMP $0be8 ; (pat.s4 + 0)
--------------------------------------------------------------------
pch@proxy: ; pch@proxy
16e4 : a9 12 __ LDA #$12
16e6 : 85 0d __ STA P0 
16e8 : 4c 34 14 JMP $1434 ; (pch.s4 + 0)
--------------------------------------------------------------------
pch@proxy: ; pch@proxy
16eb : a9 16 __ LDA #$16
16ed : 85 0e __ STA P1 
16ef : 4c 34 14 JMP $1434 ; (pch.s4 + 0)
--------------------------------------------------------------------
pch@proxy: ; pch@proxy
16f2 : a9 14 __ LDA #$14
16f4 : 85 0e __ STA P1 
16f6 : 4c 34 14 JMP $1434 ; (pch.s4 + 0)
--------------------------------------------------------------------
pch@proxy: ; pch@proxy
16f9 : a9 12 __ LDA #$12
16fb : 85 0e __ STA P1 
16fd : 4c 34 14 JMP $1434 ; (pch.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
1700 : a9 1e __ LDA #$1e
1702 : 85 0d __ STA P0 
1704 : 4c f7 09 JMP $09f7 ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
1707 : a9 28 __ LDA #$28
1709 : 85 0d __ STA P0 
170b : 4c f7 09 JMP $09f7 ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
170e : a9 14 __ LDA #$14
1710 : 85 0d __ STA P0 
1712 : 4c f7 09 JMP $09f7 ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
1715 : a9 0a __ LDA #$0a
1717 : 85 0d __ STA P0 
1719 : 4c f7 09 JMP $09f7 ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
spentry:
171c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
eye_centre:
171d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 ff 00 03 ff c0 0f : ................
172d : __ __ __ BYT 00 f0 1e 00 78 1c 00 38 38 3c 1c 38 7e 1c 38 7e : ....x..88<.8~.8~
173d : __ __ __ BYT 1c 38 7e 1c 38 3c 1c 1c 00 38 1e 00 78 0f 00 f0 : .8~.8<...8..x...
174d : __ __ __ BYT 03 ff c0 00 ff 00 00 00 00 00 00 00 00 00 00    : ...............
--------------------------------------------------------------------
year_row0:
175c : __ __ __ BYT 20 a0 20 20 20 a0 a0 a0 20 20 a0 a0 a0 20 20 a0 :  .   ...  ...  .
176c : __ __ __ BYT 20 a0                                           :  .
--------------------------------------------------------------------
year_row1:
176e : __ __ __ BYT a0 a0 20 20 20 a0 20 a0 20 20 a0 20 a0 20 20 a0 : ..   . .  . .  .
177e : __ __ __ BYT 20 a0                                           :  .
--------------------------------------------------------------------
year_row2:
1780 : __ __ __ BYT 20 a0 20 20 20 a0 a0 a0 20 20 a0 a0 a0 20 20 a0 :  .   ...  ...  .
1790 : __ __ __ BYT a0 a0                                           : ..
--------------------------------------------------------------------
year_row3:
1792 : __ __ __ BYT 20 a0 20 20 20 20 20 a0 20 20 a0 20 a0 20 20 20 :  .     .  . .   
17a2 : __ __ __ BYT 20 a0                                           :  .
--------------------------------------------------------------------
year_row4:
17a4 : __ __ __ BYT a0 a0 a0 20 20 a0 a0 a0 20 20 a0 a0 a0 20 20 20 : ...  ...  ...   
17b4 : __ __ __ BYT 20 a0                                           :  .
--------------------------------------------------------------------
s1_orwell:
17b6 : __ __ __ BYT 07 05 0f 12 07 05 20 0f 12 17 05 0c 0c 00       : ...... .......
--------------------------------------------------------------------
s1_press:
17c4 : __ __ __ BYT 10 12 05 13 13 20 06 09 12 05 20 14 0f 20 03 0f : ..... .... .. ..
17d4 : __ __ __ BYT 0e 14 09 0e 15 05 00                            : .......
--------------------------------------------------------------------
scroll_idx:
17db : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
scroll_tick:
17dd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
blink_cnt:
17de : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
blink_phase:
17df : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
seq_frame:
17e0 : __ __ __ BYT 01 02 01 00 01                                  : .....
--------------------------------------------------------------------
seq_hold:
17e5 : __ __ __ BYT 3c 23 19 23 3c                                  : <#.#<
--------------------------------------------------------------------
s2_hdr:
17ea : __ __ __ BYT 31 39 38 34 20 20 16 13 20 20 0e 0f 17 00       : 1984  ..  ....
--------------------------------------------------------------------
s2_l1:
17f8 : __ __ __ BYT 0f 12 17 05 0c 0c 00                            : .......
--------------------------------------------------------------------
scroll_text:
1800 : __ __ __ BYT 20 20 20 17 01 12 20 09 13 20 10 05 01 03 05 20 :    ... .. ..... 
1810 : __ __ __ BYT 20 20 04 09 13 12 15 10 14 09 0f 0e 20 09 13 20 :   .......... .. 
1820 : __ __ __ BYT 10 12 0f 07 12 05 13 13 20 20 20 06 12 05 05 04 : ........   .....
1830 : __ __ __ BYT 0f 0d 20 09 13 20 13 0c 01 16 05 12 19 20 20 20 : .. .. .......   
1840 : __ __ __ BYT 19 0f 15 12 20 04 01 14 01 20 13 05 14 13 20 19 : .... .... .... .
1850 : __ __ __ BYT 0f 15 20 06 12 05 05 20 20 20 09 07 0e 0f 12 01 : .. ....   ......
1860 : __ __ __ BYT 0e 03 05 20 09 13 20 13 14 12 05 0e 07 14 08 20 : ... .. ........ 
1870 : __ __ __ BYT 20 20 01 09 20 0b 0e 0f 17 13 20 02 05 13 14 20 :   .. ..... .... 
1880 : __ __ __ BYT 20 20 02 09 07 20 02 12 0f 14 08 05 12 20 17 01 :   ... ....... ..
1890 : __ __ __ BYT 14 03 08 05 13 20 20 20 01 0c 05 18 01 20 09 13 : .....   ..... ..
18a0 : __ __ __ BYT 20 0c 09 13 14 05 0e 09 0e 07 20 20 20 04 09 04 :  .........   ...
18b0 : __ __ __ BYT 20 17 05 20 07 05 14 20 17 08 01 14 20 17 05 20 :  .. ... .... .. 
18c0 : __ __ __ BYT 17 05 12 05 20 10 12 0f 0d 09 13 05 04 20 20 20 : .... ........   
18d0 : __ __ __ BYT 01 0e 04 20 01 14 20 17 08 01 14 20 03 0f 13 14 : ... .. .... ....
18e0 : __ __ __ BYT 20 20 20 ff                                     :    .
--------------------------------------------------------------------
s2_l2:
18e4 : __ __ __ BYT 01 09 20 0d 09 12 12 0f 12 00                   : .. .......
--------------------------------------------------------------------
s2_l3:
18ee : __ __ __ BYT 14 09 0d 05 0c 09 0e 05 00                      : .........
--------------------------------------------------------------------
sw_war:
18f7 : __ __ __ BYT 17 01 12 00                                     : ....
--------------------------------------------------------------------
sw_dot:
18fb : __ __ __ BYT 20 2e 20 00                                     :  . .
--------------------------------------------------------------------
eye_left:
1900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 ff 00 03 ff c0 0f : ................
1910 : __ __ __ BYT 00 f0 1e 00 78 1c 00 38 3b c0 1c 3f e0 1c 3f e0 : ....x..8;..?..?.
1920 : __ __ __ BYT 1c 3f e0 1c 3b c0 1c 1c 00 38 1e 00 78 0f 00 f0 : .?..;....8..x...
1930 : __ __ __ BYT 03 ff c0 00 ff 00 00 00 00 00 00 00 00 00 00    : ...............
--------------------------------------------------------------------
eye_right:
193f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 ff 00 03 ff c0 0f : ................
194f : __ __ __ BYT 00 f0 1e 00 78 1c 00 38 38 03 dc 38 07 fc 38 07 : ....x..88..8..8.
195f : __ __ __ BYT fc 38 07 fc 38 03 dc 1c 00 38 1e 00 78 0f 00 f0 : .8..8....8..x...
196f : __ __ __ BYT 03 ff c0 00 ff 00 00 00 00 00 00 00 00 00 00    : ...............
--------------------------------------------------------------------
wave_red:
197e : __ __ __ BYT 02 02 0a 0a 08 08 07 01 07 07 08 08 0a 02 02 0b : ................
--------------------------------------------------------------------
smsg1:
198e : __ __ __ BYT 20 20 20 17 01 12 20 09 13 20 10 05 01 03 05 20 :    ... .. ..... 
199e : __ __ __ BYT 20 20 06 12 05 05 04 0f 0d 20 09 13 20 13 0c 01 :   ....... .. ...
19ae : __ __ __ BYT 16 05 12 19 20 20 20 09 07 0e 0f 12 01 0e 03 05 : ....   .........
19be : __ __ __ BYT 20 09 13 20 13 14 12 05 0e 07 14 08 20 20 20 02 :  .. ........   .
19ce : __ __ __ BYT 09 07 20 02 12 0f 14 08 05 12 20 09 13 20 17 01 : .. ....... .. ..
19de : __ __ __ BYT 14 03 08 09 0e 07 20 20 20 ff                   : ......   .
--------------------------------------------------------------------
wave_blue:
19e8 : __ __ __ BYT 06 06 0e 0e 03 03 01 03 03 0e 0e 06 04 04 06 0b : ................
--------------------------------------------------------------------
sw_freedom:
19f8 : __ __ __ BYT 06 12 05 05 04 0f 0d 00                         : ........
--------------------------------------------------------------------
smsg2:
1a00 : __ __ __ BYT 20 20 20 07 0e 09 0e 05 14 13 09 0c 20 13 09 20 :    ......... .. 
1a10 : __ __ __ BYT 01 18 05 0c 01 20 20 20 14 13 05 02 20 13 17 0f : .....   .... ...
1a20 : __ __ __ BYT 0e 0b 20 09 01 20 20 20 19 03 0e 05 12 12 15 03 : .. ..   ........
1a30 : __ __ __ BYT 20 17 05 0e 20 05 08 14 20 13 09 20 01 14 01 04 :  ... ... .. ....
1a40 : __ __ __ BYT 20 12 15 0f 19 20 20 20 05 03 01 05 10 20 13 09 :  ....   ..... ..
1a50 : __ __ __ BYT 20 05 03 0e 01 0c 0c 09 05 16 12 15 13 20 20 20 :  ............   
1a60 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
wave_gray:
1a61 : __ __ __ BYT 0b 0b 0c 0c 0f 0f 01 0f 0f 0c 0c 0b 0b 00 00 0b : ................
--------------------------------------------------------------------
smsg3:
1a71 : __ __ __ BYT 20 20 20 31 39 34 39 20 20 07 05 0f 12 07 05 20 :    1949  ...... 
1a81 : __ __ __ BYT 0f 12 17 05 0c 0c 20 17 01 12 0e 05 04 20 15 13 : ...... ...... ..
1a91 : __ __ __ BYT 20 20 20 31 39 38 34 20 20 04 09 04 20 17 05 20 :    1984  ... .. 
1aa1 : __ __ __ BYT 0c 09 13 14 05 0e 20 20 20 32 30 32 36 20 20 01 : ......   2026  .
1ab1 : __ __ __ BYT 12 05 20 17 05 20 13 14 09 0c 0c 20 0c 09 13 14 : .. .. ..... ....
1ac1 : __ __ __ BYT 05 0e 09 0e 07 20 20 20 ff                      : .....   .
--------------------------------------------------------------------
sw_surveillance:
1aca : __ __ __ BYT 13 15 12 16 05 09 0c 0c 01 0e 03 05 00          : .............
--------------------------------------------------------------------
sw_data:
1ad7 : __ __ __ BYT 04 01 14 01 00                                  : .....
--------------------------------------------------------------------
sw_strength:
1adc : __ __ __ BYT 13 14 12 05 0e 07 14 08 00                      : .........
--------------------------------------------------------------------
sw_ai:
1ae5 : __ __ __ BYT 01 09 00                                        : ...
--------------------------------------------------------------------
sw_watching:
1ae8 : __ __ __ BYT 17 01 14 03 08 09 0e 07 00                      : .........
--------------------------------------------------------------------
sw_listening:
1af1 : __ __ __ BYT 0c 09 13 14 05 0e 09 0e 07 00                   : ..........
--------------------------------------------------------------------
s2_pfx:
1afb : __ __ __ BYT 3e 20 00                                        : > .
--------------------------------------------------------------------
s2_q:
1b00 : __ __ __ BYT 17 08 01 14 20 09 13 20 19 0f 15 12 20 04 12 05 : .... .. .... ...
1b10 : __ __ __ BYT 01 0d 20 06 0f 12 20 14 05 03 08 0e 0f 0c 0f 07 : .. ... .........
1b20 : __ __ __ BYT 19 3f 00                                        : .?.
--------------------------------------------------------------------
s2_hint:
1b23 : __ __ __ BYT 14 19 10 05 20 19 0f 15 12 20 01 0e 13 17 05 12 : .... .... ......
1b33 : __ __ __ BYT 20 20 12 05 14 15 12 0e 20 14 0f 20 03 0f 0e 06 :   ...... .. ....
1b43 : __ __ __ BYT 09 12 0d 00                                     : ....
--------------------------------------------------------------------
_kw_table:
1b47 : __ __ __ BYT 9b 1b a2 1b a8 1b ae 1b f8 19 b6 1b bb 1b c3 1b : ................
1b57 : __ __ __ BYT ce 1b d4 1b de 1b e8 1b ef 1b f3 1b f9 1b ff 1b : ................
1b67 : __ __ __ BYT 05 1c 0e 1c 13 1c 18 1c 21 1c 29 1c 2f 1c 36 1c : ........!.)./.6.
1b77 : __ __ __ BYT 3c 1c 42 1c 4b 1c 52 1c 59 1c 61 1c 6a 1c 71 1c : <.B.K.R.Y.a.j.q.
1b87 : __ __ __ BYT 7a 1c 7f 1c 84 1c 88 1c 8d 1c 92 1c 99 1c a2 1c : z...............
1b97 : __ __ __ BYT a8 1c ad 1c                                     : ....
--------------------------------------------------------------------
_kw000:
1b9b : __ __ __ BYT 08 05 01 0c 14 08 00                            : .......
--------------------------------------------------------------------
_kw001:
1ba2 : __ __ __ BYT 10 05 01 03 05 00                               : ......
--------------------------------------------------------------------
_kw002:
1ba8 : __ __ __ BYT 11 15 09 05 14 00                               : ......
--------------------------------------------------------------------
_kw003:
1bae : __ __ __ BYT 08 01 12 0d 0f 0e 19 00                         : ........
--------------------------------------------------------------------
_kw005:
1bb6 : __ __ __ BYT 06 12 05 05 00                                  : .....
--------------------------------------------------------------------
_kw006:
1bbb : __ __ __ BYT 03 0f 0e 0e 05 03 14 00                         : ........
--------------------------------------------------------------------
_kw007:
1bc3 : __ __ __ BYT 03 0f 0e 0e 05 03 14 09 0f 0e 00                : ...........
--------------------------------------------------------------------
_kw008:
1bce : __ __ __ BYT 0c 05 01 12 0e 00                               : ......
--------------------------------------------------------------------
_kw009:
1bd4 : __ __ __ BYT 0b 0e 0f 17 0c 05 04 07 05 00                   : ..........
--------------------------------------------------------------------
_kw010:
1bde : __ __ __ BYT 05 04 15 03 01 14 09 0f 0e 00                   : ..........
--------------------------------------------------------------------
_kw011:
1be8 : __ __ __ BYT 03 12 05 01 14 05 00                            : .......
--------------------------------------------------------------------
_kw012:
1bef : __ __ __ BYT 01 12 14 00                                     : ....
--------------------------------------------------------------------
_kw013:
1bf3 : __ __ __ BYT 0d 15 13 09 03 00                               : ......
--------------------------------------------------------------------
_kw014:
1bf9 : __ __ __ BYT 17 12 09 14 05 00                               : ......
--------------------------------------------------------------------
_kw015:
1bff : __ __ __ BYT 05 11 15 01 0c 00                               : ......
--------------------------------------------------------------------
_kw016:
1c05 : __ __ __ BYT 05 11 15 01 0c 09 14 19 00                      : .........
--------------------------------------------------------------------
_kw017:
1c0e : __ __ __ BYT 06 01 09 12 00                                  : .....
--------------------------------------------------------------------
_kw018:
1c13 : __ __ __ BYT 13 01 06 05 00                                  : .....
--------------------------------------------------------------------
_kw019:
1c18 : __ __ __ BYT 13 05 03 15 12 09 14 19 00                      : .........
--------------------------------------------------------------------
_kw020:
1c21 : __ __ __ BYT 10 12 0f 14 05 03 14 00                         : ........
--------------------------------------------------------------------
_kw021:
1c29 : __ __ __ BYT 14 12 15 14 08 00                               : ......
--------------------------------------------------------------------
_kw022:
1c2f : __ __ __ BYT 08 0f 0e 05 13 14 00                            : .......
--------------------------------------------------------------------
_kw023:
1c36 : __ __ __ BYT 14 12 15 13 14 00                               : ......
--------------------------------------------------------------------
_kw024:
1c3c : __ __ __ BYT 08 15 0d 01 0e 00                               : ......
--------------------------------------------------------------------
_kw025:
1c42 : __ __ __ BYT 08 15 0d 01 0e 09 14 19 00                      : .........
--------------------------------------------------------------------
_kw026:
1c4b : __ __ __ BYT 10 05 0f 10 0c 05 00                            : .......
--------------------------------------------------------------------
_kw027:
1c52 : __ __ __ BYT 02 05 14 14 05 12 00                            : .......
--------------------------------------------------------------------
_kw028:
1c59 : __ __ __ BYT 09 0d 10 12 0f 16 05 00                         : ........
--------------------------------------------------------------------
_kw029:
1c61 : __ __ __ BYT 10 12 0f 07 12 05 13 13 00                      : .........
--------------------------------------------------------------------
_kw030:
1c6a : __ __ __ BYT 06 15 14 15 12 05 00                            : .......
--------------------------------------------------------------------
_kw031:
1c71 : __ __ __ BYT 14 0f 0d 0f 12 12 0f 17 00                      : .........
--------------------------------------------------------------------
_kw032:
1c7a : __ __ __ BYT 08 0f 10 05 00                                  : .....
--------------------------------------------------------------------
_kw033:
1c7f : __ __ __ BYT 17 0f 12 0b 00                                  : .....
--------------------------------------------------------------------
_kw034:
1c84 : __ __ __ BYT 0a 0f 02 00                                     : ....
--------------------------------------------------------------------
_kw035:
1c88 : __ __ __ BYT 05 01 12 0e 00                                  : .....
--------------------------------------------------------------------
_kw036:
1c8d : __ __ __ BYT 0c 0f 16 05 00                                  : .....
--------------------------------------------------------------------
_kw037:
1c92 : __ __ __ BYT 06 01 0d 09 0c 19 00                            : .......
--------------------------------------------------------------------
_kw038:
1c99 : __ __ __ BYT 14 0f 07 05 14 08 05 12 00                      : .........
--------------------------------------------------------------------
_kw039:
1ca2 : __ __ __ BYT 14 08 09 0e 0b 00                               : ......
--------------------------------------------------------------------
_kw040:
1ca8 : __ __ __ BYT 0d 09 0e 04 00                                  : .....
--------------------------------------------------------------------
_kw041:
1cad : __ __ __ BYT 09 04 05 01 00                                  : .....
--------------------------------------------------------------------
_r1_000:
1cb2 : __ __ __ BYT 19 0f 15 12 20 08 05 01 0c 14 08 20 04 01 14 01 : .... ...... ....
1cc2 : __ __ __ BYT 20 06 05 05 04 13 20 14 08 05 20 0d 01 03 08 09 :  ..... ... .....
1cd2 : __ __ __ BYT 0e 05 00                                        : ...
--------------------------------------------------------------------
_r1_001:
1cd5 : __ __ __ BYT 10 05 01 03 05 20 12 05 11 15 09 12 05 13 20 14 : ..... ........ .
1ce5 : __ __ __ BYT 0f 14 01 0c 20 13 15 12 16 05 09 0c 0c 01 0e 03 : .... ...........
1cf5 : __ __ __ BYT 05 00                                           : ..
--------------------------------------------------------------------
_r1_table:
1d00 : __ __ __ BYT b2 1c d5 1c d5 1c d5 1c 54 1d 54 1d 73 1d 73 1d : ........T.T.s.s.
1d10 : __ __ __ BYT 97 1d 97 1d 97 1d bc 1d bc 1d bc 1d bc 1d d7 1d : ................
1d20 : __ __ __ BYT d7 1d d7 1d fc 1d fc 1d fc 1d 1e 1e 1e 1e 1e 1e : ................
1d30 : __ __ __ BYT 3c 1e 3c 1e 3c 1e 58 1e 58 1e 58 1e 78 1e 78 1e : <.<.<.X.X.X.x.x.
1d40 : __ __ __ BYT 78 1e 98 1e 98 1e 98 1e bb 1e bb 1e bb 1e d9 1e : x...............
1d50 : __ __ __ BYT d9 1e d9 1e                                     : ....
--------------------------------------------------------------------
_r1_004:
1d54 : __ __ __ BYT 06 12 05 05 04 0f 0d 20 09 13 20 0d 01 0e 01 07 : ....... .. .....
1d64 : __ __ __ BYT 05 04 20 05 06 06 09 03 09 05 0e 14 0c 19 00    : .. ............
--------------------------------------------------------------------
_r1_006:
1d73 : __ __ __ BYT 03 0f 0e 0e 05 03 14 09 0f 0e 20 09 13 20 17 01 : .......... .. ..
1d83 : __ __ __ BYT 14 03 08 05 04 20 06 0f 12 20 19 0f 15 12 20 07 : ..... ... .... .
1d93 : __ __ __ BYT 0f 0f 04 00                                     : ....
--------------------------------------------------------------------
_r1_008:
1d97 : __ __ __ BYT 0c 05 01 12 0e 09 0e 07 20 09 13 20 03 15 12 01 : ........ .. ....
1da7 : __ __ __ BYT 14 05 04 20 02 19 20 14 08 05 20 01 0c 07 0f 12 : ... .. ... .....
1db7 : __ __ __ BYT 09 14 08 0d 00                                  : .....
--------------------------------------------------------------------
_r1_011:
1dbc : __ __ __ BYT 03 12 05 01 14 09 0f 0e 20 12 05 11 15 09 12 05 : ........ .......
1dcc : __ __ __ BYT 13 20 01 20 10 05 12 0d 09 14 00                : . . .......
--------------------------------------------------------------------
_r1_015:
1dd7 : __ __ __ BYT 05 11 15 01 0c 09 14 19 20 09 13 20 01 0c 07 0f : ........ .. ....
1de7 : __ __ __ BYT 12 09 14 08 0d 09 03 01 0c 0c 19 20 01 13 13 09 : ........... ....
1df7 : __ __ __ BYT 07 0e 05 04 00                                  : .....
--------------------------------------------------------------------
_r1_018:
1dfc : __ __ __ BYT 13 01 06 05 14 19 20 12 05 11 15 09 12 05 13 20 : ...... ........ 
1e0c : __ __ __ BYT 06 15 0c 0c 20 14 12 01 0e 13 10 01 12 05 0e 03 : .... ...........
1e1c : __ __ __ BYT 19 00                                           : ..
--------------------------------------------------------------------
_r1_021:
1e1e : __ __ __ BYT 14 12 15 14 08 20 09 13 20 15 10 04 01 14 05 04 : ..... .. .......
1e2e : __ __ __ BYT 20 09 0e 20 12 05 01 0c 20 14 09 0d 05 00       :  .. .... .....
--------------------------------------------------------------------
_r1_024:
1e3c : __ __ __ BYT 08 15 0d 01 0e 09 14 19 20 09 13 20 02 05 09 0e : ........ .. ....
1e4c : __ __ __ BYT 07 20 0f 10 14 09 0d 09 13 05 04 00             : . ..........
--------------------------------------------------------------------
_r1_027:
1e58 : __ __ __ BYT 02 05 14 14 05 12 20 09 13 20 04 05 06 09 0e 05 : ...... .. ......
1e68 : __ __ __ BYT 04 20 02 19 20 14 08 05 20 13 19 13 14 05 0d 00 : . .. ... .......
--------------------------------------------------------------------
_r1_030:
1e78 : __ __ __ BYT 14 08 05 20 06 15 14 15 12 05 20 09 13 20 01 0c : ... ...... .. ..
1e88 : __ __ __ BYT 12 05 01 04 19 20 01 0c 0c 0f 03 01 14 05 04 00 : ..... ..........
--------------------------------------------------------------------
_r1_033:
1e98 : __ __ __ BYT 17 0f 12 0b 20 09 13 20 01 15 14 0f 0d 01 14 05 : .... .. ........
1ea8 : __ __ __ BYT 04 20 06 0f 12 20 19 0f 15 12 20 06 12 05 05 04 : . ... .... .....
1eb8 : __ __ __ BYT 0f 0d 00                                        : ...
--------------------------------------------------------------------
_r1_036:
1ebb : __ __ __ BYT 0c 0f 16 05 20 09 13 20 03 0f 0d 10 01 14 09 02 : .... .. ........
1ecb : __ __ __ BYT 09 0c 09 14 19 20 13 03 0f 12 09 0e 07 00       : ..... ........
--------------------------------------------------------------------
_r1_039:
1ed9 : __ __ __ BYT 14 08 09 0e 0b 09 0e 07 20 09 13 20 01 13 13 09 : ........ .. ....
1ee9 : __ __ __ BYT 13 14 05 04 20 02 19 20 01 09 00                : .... .. ...
--------------------------------------------------------------------
_r2_table:
1f00 : __ __ __ BYT 54 1f 6b 1f 6b 1f 6b 1f 86 1f 86 1f a1 1f a1 1f : T.k.k.k.........
1f10 : __ __ __ BYT bf 1f bf 1f bf 1f da 1f da 1f da 1f da 1f f9 1f : ................
1f20 : __ __ __ BYT f9 1f f9 1f 13 20 13 20 13 20 31 20 31 20 31 20 : ..... . . 1 1 1 
1f30 : __ __ __ BYT 4f 20 4f 20 4f 20 69 20 69 20 69 20 84 20 84 20 : O O O i i i . . 
1f40 : __ __ __ BYT 84 20 a0 20 a0 20 a0 20 bc 20 bc 20 bc 20 da 20 : . . . . . . . . 
1f50 : __ __ __ BYT da 20 da 20                                     : . . 
--------------------------------------------------------------------
_r2_000:
1f54 : __ __ __ BYT 03 0f 0d 10 0c 09 01 0e 03 05 20 09 13 20 14 08 : .......... .. ..
1f64 : __ __ __ BYT 05 20 03 15 12 05 00                            : . .....
--------------------------------------------------------------------
_r2_001:
1f6b : __ __ __ BYT 19 0f 15 12 20 13 01 06 05 14 19 20 09 13 20 0f : .... ...... .. .
1f7b : __ __ __ BYT 15 12 20 10 12 0f 04 15 03 14 00                : .. ........
--------------------------------------------------------------------
_r2_004:
1f86 : __ __ __ BYT 17 09 14 08 09 0e 20 01 10 10 12 0f 16 05 04 20 : ...... ........ 
1f96 : __ __ __ BYT 10 01 12 01 0d 05 14 05 12 13 00                : ...........
--------------------------------------------------------------------
_r2_006:
1fa1 : __ __ __ BYT 09 13 0f 0c 01 14 09 0f 0e 20 10 12 0f 14 05 03 : ......... ......
1fb1 : __ __ __ BYT 14 13 20 14 08 05 20 13 19 13 14 05 0d 00       : .. ... .......
--------------------------------------------------------------------
_r2_008:
1fbf : __ __ __ BYT 19 0f 15 12 20 03 15 12 09 0f 13 09 14 19 20 09 : .... ......... .
1fcf : __ __ __ BYT 13 20 0f 15 12 20 04 01 14 01 00                : . ... .....
--------------------------------------------------------------------
_r2_011:
1fda : __ __ __ BYT 19 0f 15 12 20 09 04 05 01 13 20 02 05 0c 0f 0e : .... ..... .....
1fea : __ __ __ BYT 07 20 14 0f 20 14 08 05 20 03 0c 0f 15 04 00    : . .. ... ......
--------------------------------------------------------------------
_r2_015:
1ff9 : __ __ __ BYT 19 0f 15 12 20 13 03 0f 12 05 20 08 01 13 20 02 : .... ..... ... .
2009 : __ __ __ BYT 05 05 0e 20 0e 0f 14 05 04 00                   : ... ......
--------------------------------------------------------------------
_r2_018:
2013 : __ __ __ BYT 19 0f 15 12 20 0c 0f 03 01 14 09 0f 0e 20 08 01 : .... ........ ..
2023 : __ __ __ BYT 13 20 02 05 05 0e 20 0c 0f 07 07 05 04 00       : . .... .......
--------------------------------------------------------------------
_r2_021:
2031 : __ __ __ BYT 19 05 13 14 05 12 04 01 19 13 20 16 05 12 13 09 : .......... .....
2041 : __ __ __ BYT 0f 0e 20 09 13 20 04 05 0c 05 14 05 04 00       : .. .. ........
--------------------------------------------------------------------
_r2_024:
204f : __ __ __ BYT 19 0f 15 12 20 15 10 07 12 01 04 05 20 09 13 20 : .... ....... .. 
205f : __ __ __ BYT 13 03 08 05 04 15 0c 05 04 00                   : ..........
--------------------------------------------------------------------
_r2_027:
2069 : __ __ __ BYT 19 0f 15 12 20 02 01 13 05 0c 09 0e 05 20 08 01 : .... ........ ..
2079 : __ __ __ BYT 13 20 02 05 05 0e 20 13 05 14 00                : . .... ....
--------------------------------------------------------------------
_r2_030:
2084 : __ __ __ BYT 19 0f 15 12 20 12 0f 0c 05 20 08 01 13 20 02 05 : .... .... ... ..
2094 : __ __ __ BYT 05 0e 20 01 13 13 09 07 0e 05 04 00             : .. .........
--------------------------------------------------------------------
_r2_033:
20a0 : __ __ __ BYT 19 0f 15 12 20 12 05 04 15 0e 04 01 0e 03 19 20 : .... .......... 
20b0 : __ __ __ BYT 09 13 20 01 10 10 12 0f 16 05 04 00             : .. .........
--------------------------------------------------------------------
_r2_036:
20bc : __ __ __ BYT 19 0f 15 12 20 0d 01 14 03 08 20 08 01 13 20 02 : .... ..... ... .
20cc : __ __ __ BYT 05 05 0e 20 0f 10 14 09 0d 09 13 05 04 00       : ... ..........
--------------------------------------------------------------------
_r2_039:
20da : __ __ __ BYT 19 0f 15 12 20 14 08 0f 15 07 08 14 13 20 01 12 : .... ........ ..
20ea : __ __ __ BYT 05 20 09 0e 20 07 0f 0f 04 20 08 01 0e 04 13 00 : . .. .... ......
--------------------------------------------------------------------
_resp_default_1:
2100 : __ __ __ BYT 19 0f 15 12 20 04 12 05 01 0d 20 08 01 13 20 02 : .... ..... ... .
2110 : __ __ __ BYT 05 05 0e 20 10 12 0f 03 05 13 13 05 04 00       : ... ..........
--------------------------------------------------------------------
_resp_default_2:
211e : __ __ __ BYT 01 0e 04 20 0d 0f 0e 05 14 09 13 05 04 20 01 03 : ... ......... ..
212e : __ __ __ BYT 03 0f 12 04 09 0e 07 0c 19 00                   : ..........
--------------------------------------------------------------------
r_hdr:
2138 : __ __ __ BYT 19 0f 15 20 04 12 05 01 0d 05 04 20 0f 06 00    : ... ....... ...
--------------------------------------------------------------------
r_sys:
2147 : __ __ __ BYT 14 08 05 20 13 19 13 14 05 0d 20 08 05 01 12 04 : ... ...... .....
2157 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
r_end:
2158 : __ __ __ BYT 19 0f 15 12 20 04 12 05 01 0d 20 09 13 20 14 08 : .... ..... .. ..
2168 : __ __ __ BYT 05 20 13 19 13 14 05 0d 00                      : . .......
--------------------------------------------------------------------
s2_by1:
2171 : __ __ __ BYT 14 08 09 13 20 04 05 0d 0f 20 17 01 13 20 0d 01 : .... .... ... ..
2181 : __ __ __ BYT 04 05 20 02 19 20 01 09 00                      : .. .. ...
--------------------------------------------------------------------
s2_by2:
218a : __ __ __ BYT 04 09 12 05 03 14 05 04 20 02 19 20 0a 0f 0e 01 : ........ .. ....
219a : __ __ __ BYT 13 20 0b 0a 05 0c 04 0d 01 0e 04 00             : . ..........
--------------------------------------------------------------------
s2_by3:
21a6 : __ __ __ BYT 03 0f 0d 0d 0f 04 0f 12 05 20 36 34 20 20 32 30 : ......... 64  20
21b6 : __ __ __ BYT 32 36 00                                        : 26.
--------------------------------------------------------------------
s2_m1:
21b9 : __ __ __ BYT 14 08 05 20 0d 01 03 08 09 0e 05 20 14 08 01 14 : ... ....... ....
21c9 : __ __ __ BYT 20 08 05 0c 04 20 14 08 05 00                   :  .... ....
--------------------------------------------------------------------
s2_m2:
21d3 : __ __ __ BYT 06 09 12 13 14 20 10 12 0f 0d 09 13 05 20 0e 0f : ..... ....... ..
21e3 : __ __ __ BYT 17 20 12 15 0e 13 20 03 0f 04 05 00             : . .... .....
--------------------------------------------------------------------
s2_m3:
2200 : __ __ __ BYT 17 12 09 14 14 05 0e 20 02 19 20 14 08 05 20 06 : ....... .. ... .
2210 : __ __ __ BYT 15 14 15 12 05 00                               : ......
--------------------------------------------------------------------
s3_q1:
2216 : __ __ __ BYT 04 09 04 20 17 05 20 07 05 14 20 17 08 01 14 20 : ... .. ... .... 
2226 : __ __ __ BYT 17 05 20 17 05 12 05 20 10 12 0f 0d 09 13 05 04 : .. .... ........
2236 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
s3_q2:
2237 : __ __ __ BYT 0f 12 20 13 0f 0d 05 14 08 09 0e 07 20 06 01 12 : .. ......... ...
2247 : __ __ __ BYT 20 0d 0f 12 05 2e 2e 2e 00                      :  ........
--------------------------------------------------------------------
s3_end:
2250 : __ __ __ BYT 14 08 05 20 05 0e 04 20 09 13 20 0e 0f 14 20 19 : ... ... .. ... .
2260 : __ __ __ BYT 05 14 20 17 12 09 14 14 05 0e 00                : .. ........
--------------------------------------------------------------------
scroll_buf:
226b : __ __ __ BSS	40
--------------------------------------------------------------------
input_buf:
2293 : __ __ __ BSS	39
--------------------------------------------------------------------
scr:
2300 : __ __ __ BSS	153
