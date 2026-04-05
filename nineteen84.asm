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
080e : 8e a2 0f STX $0fa2 ; (spentry + 0)
0811 : a2 12 __ LDX #$12
0813 : a0 7e __ LDY #$7e
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 12 __ CPX #$12
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 a6 __ CPY #$a6
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 fe __ LDA #$fe
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
; 700, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0880 : a9 02 __ LDA #$02
0882 : 8d a3 0f STA $0fa3 ; (bar_pal[0] + 0)
0885 : a9 08 __ LDA #$08
0887 : 8d a4 0f STA $0fa4 ; (bar_pal[0] + 1)
088a : a9 07 __ LDA #$07
088c : 8d a5 0f STA $0fa5 ; (bar_pal[0] + 2)
088f : a9 01 __ LDA #$01
0891 : 8d a6 0f STA $0fa6 ; (bar_pal[0] + 3)
0894 : a9 0e __ LDA #$0e
0896 : 8d a7 0f STA $0fa7 ; (bar_pal[0] + 4)
0899 : a9 06 __ LDA #$06
089b : 8d a8 0f STA $0fa8 ; (bar_pal[0] + 5)
089e : a9 04 __ LDA #$04
08a0 : 8d a9 0f STA $0fa9 ; (bar_pal[0] + 6)
08a3 : a9 00 __ LDA #$00
08a5 : 8d aa 0f STA $0faa ; (bar_pal[0] + 7)
08a8 : 8d 20 d0 STA $d020 
08ab : 8d 21 d0 STA $d021 
.l5:
08ae : 20 4e 09 JSR $094e ; (scene1_run.s4 + 0)
08b1 : 20 16 0c JSR $0c16 ; (scene2_run.s4 + 0)
08b4 : 20 a3 0c JSR $0ca3 ; (scene3_run.s4 + 0)
08b7 : 20 89 0e JSR $0e89 ; (scene4_run.s4 + 0)
08ba : a9 0f __ LDA #$0f
08bc : 85 11 __ STA P4 
08be : a9 58 __ LDA #$58
08c0 : 85 0f __ STA P2 
08c2 : a9 12 __ LDA #$12
08c4 : 85 10 __ STA P3 
08c6 : 20 e4 09 JSR $09e4 ; (cls@proxy + 0)
08c9 : 20 29 0a JSR $0a29 ; (print_centered.s4 + 0)
08cc : a9 0b __ LDA #$0b
08ce : 20 b1 0a JSR $0ab1 ; (hline.s4 + 0)
08d1 : a9 11 __ LDA #$11
08d3 : 20 b1 0a JSR $0ab1 ; (hline.s4 + 0)
08d6 : a9 00 __ LDA #$00
08d8 : 85 0f __ STA P2 
08da : a9 10 __ LDA #$10
08dc : 85 10 __ STA P3 
08de : 20 68 0f JSR $0f68 ; (print_centered@proxy + 0)
08e1 : a9 04 __ LDA #$04
08e3 : 8d a3 0f STA $0fa3 ; (bar_pal[0] + 0)
08e6 : 8d a9 0f STA $0fa9 ; (bar_pal[0] + 6)
08e9 : a9 28 __ LDA #$28
08eb : 85 0d __ STA P0 
08ed : a9 06 __ LDA #$06
08ef : 8d a4 0f STA $0fa4 ; (bar_pal[0] + 1)
08f2 : 8d a8 0f STA $0fa8 ; (bar_pal[0] + 5)
08f5 : a9 0e __ LDA #$0e
08f7 : 8d a5 0f STA $0fa5 ; (bar_pal[0] + 2)
08fa : 8d a7 0f STA $0fa7 ; (bar_pal[0] + 4)
08fd : a9 03 __ LDA #$03
08ff : 8d a6 0f STA $0fa6 ; (bar_pal[0] + 3)
0902 : a9 00 __ LDA #$00
0904 : 8d aa 0f STA $0faa ; (bar_pal[0] + 7)
0907 : 20 e8 0a JSR $0ae8 ; (scroll_init.s4 + 0)
090a : a9 00 __ LDA #$00
090c : 85 49 __ STA T4 + 0 
090e : 8d ff 0f STA $0fff ; (blink_phase + 0)
0911 : 8d fe 0f STA $0ffe ; (blink_cnt + 0)
0914 : 20 d7 09 JSR $09d7 ; (wait_frames.s4 + 0)
0917 : a9 0d __ LDA #$0d
0919 : 85 0d __ STA P0 
091b : a9 63 __ LDA #$63
091d : 85 0f __ STA P2 
091f : a9 12 __ LDA #$12
0921 : 85 10 __ STA P3 
0923 : 20 61 0f JSR $0f61 ; (print_centered@proxy + 0)
0926 : a9 01 __ LDA #$01
0928 : 85 0e __ STA P1 
.l6:
092a : 20 fe 0a JSR $0afe ; (wait_frame.l4 + 0)
092d : 20 3e 0e JSR $0e3e ; (draw_bars.s4 + 0)
0930 : e6 49 __ INC T4 + 0 
0932 : a5 49 __ LDA T4 + 0 
0934 : c9 08 __ CMP #$08
0936 : 90 07 __ BCC $093f ; (main.s7 + 0)
.s8:
0938 : 20 75 0e JSR $0e75 ; (rotate_bars_left.s4 + 0)
093b : a9 00 __ LDA #$00
093d : 85 49 __ STA T4 + 0 
.s7:
093f : 20 0d 0b JSR $0b0d ; (scroll_step.s4 + 0)
0942 : 20 6b 0b JSR $0b6b ; (blink_row.s4 + 0)
0945 : 20 ab 0b JSR $0bab ; (fire_pressed.s4 + 0)
0948 : aa __ __ TAX
0949 : f0 df __ BEQ $092a ; (main.l6 + 0)
094b : 4c ae 08 JMP $08ae ; (main.l5 + 0)
--------------------------------------------------------------------
scene1_run: ; scene1_run()->void
; 418, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
094e : a9 01 __ LDA #$01
0950 : 85 11 __ STA P4 
0952 : 20 e4 09 JSR $09e4 ; (cls@proxy + 0)
0955 : 20 e8 09 JSR $09e8 ; (cls.s4 + 0)
0958 : 20 21 0a JSR $0a21 ; (print_centered@proxy + 0)
095b : e6 0d __ INC P0 
095d : a9 07 __ LDA #$07
095f : 85 11 __ STA P4 
0961 : a9 0f __ LDA #$0f
0963 : 85 10 __ STA P3 
0965 : a9 c0 __ LDA #$c0
0967 : 85 0f __ STA P2 
0969 : 20 29 0a JSR $0a29 ; (print_centered.s4 + 0)
096c : e6 0d __ INC P0 
096e : a9 e0 __ LDA #$e0
0970 : 85 0f __ STA P2 
0972 : a9 0f __ LDA #$0f
0974 : 85 10 __ STA P3 
0976 : 20 29 0a JSR $0a29 ; (print_centered.s4 + 0)
0979 : a9 0c __ LDA #$0c
097b : 20 b1 0a JSR $0ab1 ; (hline.s4 + 0)
097e : a9 10 __ LDA #$10
0980 : 85 10 __ STA P3 
0982 : a9 0c __ LDA #$0c
0984 : 85 11 __ STA P4 
0986 : a9 00 __ LDA #$00
0988 : 85 0f __ STA P2 
098a : 20 7a 0f JSR $0f7a ; (print_centered@proxy + 0)
098d : a9 11 __ LDA #$11
098f : 85 0d __ STA P0 
0991 : a9 0f __ LDA #$0f
0993 : 85 10 __ STA P3 
0995 : a9 0f __ LDA #$0f
0997 : 85 11 __ STA P4 
0999 : a9 f1 __ LDA #$f1
099b : 85 0f __ STA P2 
099d : 20 29 0a JSR $0a29 ; (print_centered.s4 + 0)
09a0 : a9 13 __ LDA #$13
09a2 : 85 0d __ STA P0 
09a4 : a9 10 __ LDA #$10
09a6 : 85 10 __ STA P3 
09a8 : a9 14 __ LDA #$14
09aa : 85 0f __ STA P2 
09ac : 20 81 0f JSR $0f81 ; (print_centered@proxy + 0)
09af : 20 88 0f JSR $0f88 ; (print_centered@proxy + 0)
09b2 : 20 e8 0a JSR $0ae8 ; (scroll_init.s4 + 0)
09b5 : a9 00 __ LDA #$00
09b7 : 8d ff 0f STA $0fff ; (blink_phase + 0)
09ba : 8d fe 0f STA $0ffe ; (blink_cnt + 0)
09bd : a9 0c __ LDA #$0c
09bf : 85 0e __ STA P1 
.l6:
09c1 : 20 fe 0a JSR $0afe ; (wait_frame.l4 + 0)
09c4 : 20 0d 0b JSR $0b0d ; (scroll_step.s4 + 0)
09c7 : 20 6b 0b JSR $0b6b ; (blink_row.s4 + 0)
09ca : 20 ab 0b JSR $0bab ; (fire_pressed.s4 + 0)
09cd : aa __ __ TAX
09ce : f0 f1 __ BEQ $09c1 ; (scene1_run.l6 + 0)
.s5:
09d0 : 20 dd 0b JSR $0bdd ; (fade_to_black@proxy + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
09d3 : a9 0a __ LDA #$0a
09d5 : 85 0d __ STA P0 
--------------------------------------------------------------------
wait_frames: ; wait_frames(u8)->void
; 292, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
09d7 : c6 0d __ DEC P0 ; (n + 0)
.l5:
09d9 : 20 fe 0a JSR $0afe ; (wait_frame.l4 + 0)
09dc : a5 0d __ LDA P0 ; (n + 0)
09de : c6 0d __ DEC P0 ; (n + 0)
09e0 : aa __ __ TAX
09e1 : d0 f6 __ BNE $09d9 ; (wait_frames.l5 + 0)
.s3:
09e3 : 60 __ __ RTS
--------------------------------------------------------------------
cls@proxy: ; cls@proxy
09e4 : a9 08 __ LDA #$08
09e6 : 85 0d __ STA P0 
--------------------------------------------------------------------
cls: ; cls(u8)->void
;  49, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
09e8 : a9 00 __ LDA #$00
09ea : 85 1f __ STA ADDR + 0 
09ec : 8d 20 d0 STA $d020 
09ef : 8d 21 d0 STA $d021 
09f2 : 85 1b __ STA ACCU + 0 
09f4 : a9 04 __ LDA #$04
09f6 : 85 1c __ STA ACCU + 1 
09f8 : d0 02 __ BNE $09fc ; (cls.l6 + 0)
.s7:
09fa : e6 1c __ INC ACCU + 1 
.l6:
09fc : a9 20 __ LDA #$20
09fe : a0 00 __ LDY #$00
0a00 : 91 1b __ STA (ACCU + 0),y 
0a02 : 18 __ __ CLC
0a03 : a5 1c __ LDA ACCU + 1 
0a05 : 69 d4 __ ADC #$d4
0a07 : 85 20 __ STA ADDR + 1 
0a09 : 98 __ __ TYA
0a0a : a4 1b __ LDY ACCU + 0 
0a0c : 91 1f __ STA (ADDR + 0),y 
0a0e : 98 __ __ TYA
0a0f : 18 __ __ CLC
0a10 : 69 01 __ ADC #$01
0a12 : 85 1b __ STA ACCU + 0 
0a14 : b0 e4 __ BCS $09fa ; (cls.s7 + 0)
.s8:
0a16 : c9 e8 __ CMP #$e8
0a18 : d0 e2 __ BNE $09fc ; (cls.l6 + 0)
.s5:
0a1a : a5 1c __ LDA ACCU + 1 
0a1c : c9 07 __ CMP #$07
0a1e : d0 dc __ BNE $09fc ; (cls.l6 + 0)
.s3:
0a20 : 60 __ __ RTS
--------------------------------------------------------------------
print_centered@proxy: ; print_centered@proxy
0a21 : a9 ab __ LDA #$ab
0a23 : 85 0f __ STA P2 
0a25 : a9 0f __ LDA #$0f
0a27 : 85 10 __ STA P3 
--------------------------------------------------------------------
print_centered: ; print_centered(u8,const u8*,u8)->void
;  71, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0a29 : 18 __ __ CLC
0a2a : a5 0f __ LDA P2 ; (s + 0)
0a2c : 69 01 __ ADC #$01
0a2e : 85 1b __ STA ACCU + 0 
0a30 : a5 10 __ LDA P3 ; (s + 1)
0a32 : 69 00 __ ADC #$00
0a34 : 85 1c __ STA ACCU + 1 
0a36 : a0 00 __ LDY #$00
0a38 : 84 43 __ STY T2 + 0 
0a3a : b1 0f __ LDA (P2),y ; (s + 0)
0a3c : f0 0d __ BEQ $0a4b ; (print_centered.s5 + 0)
.l6:
0a3e : e6 43 __ INC T2 + 0 
0a40 : b1 1b __ LDA (ACCU + 0),y 
0a42 : aa __ __ TAX
0a43 : c8 __ __ INY
0a44 : d0 02 __ BNE $0a48 ; (print_centered.s8 + 0)
.s7:
0a46 : e6 1c __ INC ACCU + 1 
.s8:
0a48 : 8a __ __ TXA
0a49 : d0 f3 __ BNE $0a3e ; (print_centered.l6 + 0)
.s5:
0a4b : 38 __ __ SEC
0a4c : a9 28 __ LDA #$28
0a4e : e5 43 __ SBC T2 + 0 
0a50 : 6a __ __ ROR
0a51 : 49 80 __ EOR #$80
0a53 : 85 0e __ STA P1 
--------------------------------------------------------------------
print_at: ; print_at(u8,u8,const u8*,u8)->void
;  60, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0a55 : a0 00 __ LDY #$00
0a57 : b1 0f __ LDA (P2),y ; (s + 0)
0a59 : f0 55 __ BEQ $0ab0 ; (print_at.s3 + 0)
.s5:
0a5b : 84 1f __ STY ADDR + 0 
0a5d : a5 0d __ LDA P0 ; (row + 0)
0a5f : 0a __ __ ASL
0a60 : 85 1b __ STA ACCU + 0 
0a62 : 98 __ __ TYA
0a63 : 2a __ __ ROL
0a64 : 06 1b __ ASL ACCU + 0 
0a66 : 2a __ __ ROL
0a67 : aa __ __ TAX
0a68 : 18 __ __ CLC
0a69 : a5 1b __ LDA ACCU + 0 
0a6b : 65 0d __ ADC P0 ; (row + 0)
0a6d : 85 1b __ STA ACCU + 0 
0a6f : 8a __ __ TXA
0a70 : 69 00 __ ADC #$00
0a72 : 06 1b __ ASL ACCU + 0 
0a74 : 2a __ __ ROL
0a75 : 06 1b __ ASL ACCU + 0 
0a77 : 2a __ __ ROL
0a78 : 06 1b __ ASL ACCU + 0 
0a7a : 2a __ __ ROL
0a7b : aa __ __ TAX
0a7c : 18 __ __ CLC
0a7d : a5 1b __ LDA ACCU + 0 
0a7f : 65 0e __ ADC P1 ; (col + 0)
0a81 : 85 1b __ STA ACCU + 0 
0a83 : 8a __ __ TXA
0a84 : 69 04 __ ADC #$04
0a86 : 85 1c __ STA ACCU + 1 
0a88 : b1 0f __ LDA (P2),y ; (s + 0)
0a8a : a6 11 __ LDX P4 ; (fg + 0)
.l6:
0a8c : 91 1b __ STA (ACCU + 0),y 
0a8e : 18 __ __ CLC
0a8f : a5 1c __ LDA ACCU + 1 
0a91 : 69 d4 __ ADC #$d4
0a93 : 85 20 __ STA ADDR + 1 
0a95 : 8a __ __ TXA
0a96 : a4 1b __ LDY ACCU + 0 
0a98 : 91 1f __ STA (ADDR + 0),y 
0a9a : 98 __ __ TYA
0a9b : 18 __ __ CLC
0a9c : 69 01 __ ADC #$01
0a9e : 85 1b __ STA ACCU + 0 
0aa0 : 90 02 __ BCC $0aa4 ; (print_at.s8 + 0)
.s7:
0aa2 : e6 1c __ INC ACCU + 1 
.s8:
0aa4 : e6 0f __ INC P2 ; (s + 0)
0aa6 : d0 02 __ BNE $0aaa ; (print_at.s10 + 0)
.s9:
0aa8 : e6 10 __ INC P3 ; (s + 1)
.s10:
0aaa : a0 00 __ LDY #$00
0aac : b1 0f __ LDA (P2),y ; (s + 0)
0aae : d0 dc __ BNE $0a8c ; (print_at.l6 + 0)
.s3:
0ab0 : 60 __ __ RTS
--------------------------------------------------------------------
hline: ; hline(u8,u8,u8)->void
;  81, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0ab1 : 85 0d __ STA P0 ; (row + 0)
0ab3 : 0a __ __ ASL
0ab4 : 0a __ __ ASL
0ab5 : 65 0d __ ADC P0 ; (row + 0)
0ab7 : 0a __ __ ASL
0ab8 : 0a __ __ ASL
0ab9 : 85 1b __ STA ACCU + 0 
0abb : a9 01 __ LDA #$01
0abd : 2a __ __ ROL
0abe : 06 1b __ ASL ACCU + 0 
0ac0 : 2a __ __ ROL
0ac1 : 85 1c __ STA ACCU + 1 
0ac3 : a5 1b __ LDA ACCU + 0 
0ac5 : 09 02 __ ORA #$02
0ac7 : a8 __ __ TAY
0ac8 : a9 00 __ LDA #$00
0aca : 85 1f __ STA ADDR + 0 
0acc : 85 1b __ STA ACCU + 0 
0ace : a2 24 __ LDX #$24
.l5:
0ad0 : a9 2d __ LDA #$2d
0ad2 : 91 1b __ STA (ACCU + 0),y 
0ad4 : 18 __ __ CLC
0ad5 : a5 1c __ LDA ACCU + 1 
0ad7 : 69 d4 __ ADC #$d4
0ad9 : 85 20 __ STA ADDR + 1 
0adb : a9 0b __ LDA #$0b
0add : 91 1f __ STA (ADDR + 0),y 
0adf : c8 __ __ INY
0ae0 : d0 02 __ BNE $0ae4 ; (hline.s7 + 0)
.s6:
0ae2 : e6 1c __ INC ACCU + 1 
.s7:
0ae4 : ca __ __ DEX
0ae5 : d0 e9 __ BNE $0ad0 ; (hline.l5 + 0)
.s3:
0ae7 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_init: ; scroll_init()->void
; 246, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0ae8 : a9 00 __ LDA #$00
0aea : 8d fd 0f STA $0ffd ; (scroll_tick + 0)
0aed : 8d fb 0f STA $0ffb ; (scroll_idx + 0)
0af0 : 8d fc 0f STA $0ffc ; (scroll_idx + 1)
0af3 : a9 20 __ LDA #$20
0af5 : a2 27 __ LDX #$27
.l5:
0af7 : 9d 7e 12 STA $127e,x ; (scroll_buf[0] + 0)
0afa : ca __ __ DEX
0afb : 10 fa __ BPL $0af7 ; (scroll_init.l5 + 0)
.s3:
0afd : 60 __ __ RTS
--------------------------------------------------------------------
wait_frame: ; wait_frame()->void
; 284, "C:/code/jonas/c64Demo/nineteen84.c"
.l4:
0afe : ad 12 d0 LDA $d012 
0b01 : c9 fa __ CMP #$fa
0b03 : 90 f9 __ BCC $0afe ; (wait_frame.l4 + 0)
.l5:
0b05 : ad 12 d0 LDA $d012 
0b08 : c9 fa __ CMP #$fa
0b0a : b0 f9 __ BCS $0b05 ; (wait_frame.l5 + 0)
.s3:
0b0c : 60 __ __ RTS
--------------------------------------------------------------------
scroll_step: ; scroll_step()->void
; 254, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0b0d : ee fd 0f INC $0ffd ; (scroll_tick + 0)
0b10 : ad fd 0f LDA $0ffd ; (scroll_tick + 0)
0b13 : c9 0c __ CMP #$0c
0b15 : 90 53 __ BCC $0b6a ; (scroll_step.s3 + 0)
.s5:
0b17 : a2 00 __ LDX #$00
0b19 : 8e fd 0f STX $0ffd ; (scroll_tick + 0)
.l7:
0b1c : bd 7f 12 LDA $127f,x ; (scroll_buf[0] + 1)
0b1f : 9d 7e 12 STA $127e,x ; (scroll_buf[0] + 0)
0b22 : e8 __ __ INX
0b23 : e0 27 __ CPX #$27
0b25 : d0 f5 __ BNE $0b1c ; (scroll_step.l7 + 0)
.s8:
0b27 : ad fb 0f LDA $0ffb ; (scroll_idx + 0)
0b2a : a8 __ __ TAY
0b2b : 18 __ __ CLC
0b2c : 69 01 __ ADC #$01
0b2e : 8d fb 0f STA $0ffb ; (scroll_idx + 0)
0b31 : ad fc 0f LDA $0ffc ; (scroll_idx + 1)
0b34 : aa __ __ TAX
0b35 : 69 00 __ ADC #$00
0b37 : 8d fc 0f STA $0ffc ; (scroll_idx + 1)
0b3a : 98 __ __ TYA
0b3b : 18 __ __ CLC
0b3c : 69 43 __ ADC #$43
0b3e : 85 1b __ STA ACCU + 0 
0b40 : 8a __ __ TXA
0b41 : 69 10 __ ADC #$10
0b43 : 85 1c __ STA ACCU + 1 
0b45 : a0 00 __ LDY #$00
0b47 : b1 1b __ LDA (ACCU + 0),y 
0b49 : c9 ff __ CMP #$ff
0b4b : d0 08 __ BNE $0b55 ; (scroll_step.s10 + 0)
.s6:
0b4d : 8c fb 0f STY $0ffb ; (scroll_idx + 0)
0b50 : 8c fc 0f STY $0ffc ; (scroll_idx + 1)
0b53 : a9 20 __ LDA #$20
.s10:
0b55 : 8d a5 12 STA $12a5 ; (scroll_buf[0] + 39)
0b58 : a2 00 __ LDX #$00
.l9:
0b5a : bd 7e 12 LDA $127e,x ; (scroll_buf[0] + 0)
0b5d : 9d c0 07 STA $07c0,x 
0b60 : a9 0d __ LDA #$0d
0b62 : 9d c0 db STA $dbc0,x 
0b65 : e8 __ __ INX
0b66 : e0 28 __ CPX #$28
0b68 : d0 f0 __ BNE $0b5a ; (scroll_step.l9 + 0)
.s3:
0b6a : 60 __ __ RTS
--------------------------------------------------------------------
blink_row: ; blink_row(u8,u8)->void
; 356, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0b6b : ee fe 0f INC $0ffe ; (blink_cnt + 0)
0b6e : ad fe 0f LDA $0ffe ; (blink_cnt + 0)
0b71 : c9 19 __ CMP #$19
0b73 : 90 2f __ BCC $0ba4 ; (blink_row.s5 + 0)
.s9:
0b75 : a9 00 __ LDA #$00
0b77 : 8d fe 0f STA $0ffe ; (blink_cnt + 0)
0b7a : cd ff 0f CMP $0fff ; (blink_phase + 0)
0b7d : 2a __ __ ROL
0b7e : 8d ff 0f STA $0fff ; (blink_phase + 0)
0b81 : f0 04 __ BEQ $0b87 ; (blink_row.s6 + 0)
.s8:
0b83 : a6 0e __ LDX P1 ; (fg + 0)
0b85 : 90 02 __ BCC $0b89 ; (blink_row.s7 + 0)
.s6:
0b87 : a2 00 __ LDX #$00
.s7:
0b89 : a5 0d __ LDA P0 ; (row + 0)
0b8b : 0a __ __ ASL
0b8c : 0a __ __ ASL
0b8d : 65 0d __ ADC P0 ; (row + 0)
0b8f : 0a __ __ ASL
0b90 : 0a __ __ ASL
0b91 : 85 1b __ STA ACCU + 0 
0b93 : a9 36 __ LDA #$36
0b95 : 2a __ __ ROL
0b96 : 06 1b __ ASL ACCU + 0 
0b98 : 2a __ __ ROL
0b99 : 85 1c __ STA ACCU + 1 
0b9b : 8a __ __ TXA
0b9c : a0 27 __ LDY #$27
.l10:
0b9e : 91 1b __ STA (ACCU + 0),y 
0ba0 : 88 __ __ DEY
0ba1 : 10 fb __ BPL $0b9e ; (blink_row.l10 + 0)
.s3:
0ba3 : 60 __ __ RTS
.s5:
0ba4 : ad ff 0f LDA $0fff ; (blink_phase + 0)
0ba7 : f0 de __ BEQ $0b87 ; (blink_row.s6 + 0)
0ba9 : d0 d8 __ BNE $0b83 ; (blink_row.s8 + 0)
--------------------------------------------------------------------
fire_pressed: ; fire_pressed()->u8
; 310, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0bab : ad 00 dc LDA $dc00 
0bae : 29 10 __ AND #$10
0bb0 : f0 12 __ BEQ $0bc4 ; (fire_pressed.s5 + 0)
.s6:
0bb2 : a9 ef __ LDA #$ef
0bb4 : 8d 00 dc STA $dc00 
0bb7 : ad 01 dc LDA $dc01 
0bba : 29 80 __ AND #$80
0bbc : a0 ff __ LDY #$ff
0bbe : 8c 00 dc STY $dc00 
0bc1 : aa __ __ TAX
0bc2 : d0 03 __ BNE $0bc7 ; (fire_pressed.s7 + 0)
.s5:
0bc4 : a9 01 __ LDA #$01
0bc6 : 60 __ __ RTS
.s7:
0bc7 : a9 fd __ LDA #$fd
0bc9 : 8d 00 dc STA $dc00 
0bcc : ad 01 dc LDA $dc01 
0bcf : 29 02 __ AND #$02
0bd1 : 8c 00 dc STY $dc00 
0bd4 : c9 01 __ CMP #$01
0bd6 : a9 00 __ LDA #$00
0bd8 : 69 ff __ ADC #$ff
0bda : 29 01 __ AND #$01
.s3:
0bdc : 60 __ __ RTS
--------------------------------------------------------------------
fade_to_black@proxy: ; fade_to_black@proxy
0bdd : a9 0f __ LDA #$0f
0bdf : 85 0d __ STA P0 
--------------------------------------------------------------------
fade_to_black: ; fade_to_black(u8)->void
; 368, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0be1 : a9 00 __ LDA #$00
0be3 : 85 43 __ STA T3 + 0 
.l5:
0be5 : 20 fe 0a JSR $0afe ; (wait_frame.l4 + 0)
0be8 : a5 43 __ LDA T3 + 0 
0bea : c9 19 __ CMP #$19
0bec : b0 1b __ BCS $0c09 ; (fade_to_black.s6 + 0)
.s8:
0bee : 0a __ __ ASL
0bef : 0a __ __ ASL
0bf0 : 65 43 __ ADC T3 + 0 
0bf2 : 0a __ __ ASL
0bf3 : 0a __ __ ASL
0bf4 : 85 1b __ STA ACCU + 0 
0bf6 : a9 36 __ LDA #$36
0bf8 : 2a __ __ ROL
0bf9 : 06 1b __ ASL ACCU + 0 
0bfb : 2a __ __ ROL
0bfc : 85 1c __ STA ACCU + 1 
0bfe : a9 00 __ LDA #$00
0c00 : a0 27 __ LDY #$27
.l9:
0c02 : 91 1b __ STA (ACCU + 0),y 
0c04 : 88 __ __ DEY
0c05 : 10 fb __ BPL $0c02 ; (fade_to_black.l9 + 0)
.s10:
0c07 : e6 43 __ INC T3 + 0 
.s6:
0c09 : c6 0d __ DEC P0 ; (steps + 0)
0c0b : d0 d8 __ BNE $0be5 ; (fade_to_black.l5 + 0)
.s7:
0c0d : a9 00 __ LDA #$00
0c0f : 8d 20 d0 STA $d020 
0c12 : 8d 21 d0 STA $d021 
.s3:
0c15 : 60 __ __ RTS
--------------------------------------------------------------------
scene2_run: ; scene2_run()->void
; 466, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0c16 : a9 12 __ LDA #$12
0c18 : 85 0d __ STA P0 
0c1a : 20 9b 0f JSR $0f9b ; (cls@proxy + 0)
0c1d : 20 21 0a JSR $0a21 ; (print_centered@proxy + 0)
0c20 : 20 19 0f JSR $0f19 ; (wait_frames@proxy + 0)
0c23 : a9 0a __ LDA #$0a
0c25 : 85 0d __ STA P0 
0c27 : a9 11 __ LDA #$11
0c29 : 85 10 __ STA P3 
0c2b : a9 4f __ LDA #$4f
0c2d : 85 0f __ STA P2 
0c2f : 20 81 0f JSR $0f81 ; (print_centered@proxy + 0)
0c32 : 20 7c 0c JSR $0c7c ; (glitch_row.s4 + 0)
0c35 : 20 53 0f JSR $0f53 ; (wait_frames@proxy + 0)
0c38 : e6 11 __ INC P4 
0c3a : a9 64 __ LDA #$64
0c3c : 85 0f __ STA P2 
0c3e : a9 11 __ LDA #$11
0c40 : 85 10 __ STA P3 
0c42 : 20 73 0f JSR $0f73 ; (print_centered@proxy + 0)
0c45 : 20 7c 0c JSR $0c7c ; (glitch_row.s4 + 0)
0c48 : 20 53 0f JSR $0f53 ; (wait_frames@proxy + 0)
0c4b : a9 11 __ LDA #$11
0c4d : 85 10 __ STA P3 
0c4f : a9 0d __ LDA #$0d
0c51 : 85 11 __ STA P4 
0c53 : a9 77 __ LDA #$77
0c55 : 85 0f __ STA P2 
0c57 : 20 7a 0f JSR $0f7a ; (print_centered@proxy + 0)
0c5a : 20 7c 0c JSR $0c7c ; (glitch_row.s4 + 0)
0c5d : a9 32 __ LDA #$32
0c5f : 85 0d __ STA P0 
0c61 : 20 d7 09 JSR $09d7 ; (wait_frames.s4 + 0)
0c64 : a9 11 __ LDA #$11
0c66 : 85 10 __ STA P3 
0c68 : a9 8d __ LDA #$8d
0c6a : 85 0f __ STA P2 
0c6c : 20 68 0f JSR $0f68 ; (print_centered@proxy + 0)
0c6f : a9 50 __ LDA #$50
0c71 : 85 0d __ STA P0 
0c73 : 20 d7 09 JSR $09d7 ; (wait_frames.s4 + 0)
0c76 : 20 5a 0f JSR $0f5a ; (fade_to_black@proxy + 0)
0c79 : 4c d3 09 JMP $09d3 ; (wait_frames@proxy + 0)
--------------------------------------------------------------------
glitch_row: ; glitch_row(u8,u8)->void
; 392, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0c7c : a6 0d __ LDX P0 ; (row + 0)
0c7e : bd 20 0f LDA $0f20,x ; (__multab40L + 0)
0c81 : 85 43 __ STA T1 + 0 
0c83 : bd 2f 0f LDA $0f2f,x ; (__multab40H + 0)
0c86 : 09 d8 __ ORA #$d8
0c88 : 85 44 __ STA T1 + 1 
0c8a : a2 00 __ LDX #$00
.l5:
0c8c : 86 45 __ STX T4 + 0 
0c8e : bd 5c 11 LDA $115c,x ; (glitch_pal[0] + 0)
0c91 : a0 27 __ LDY #$27
.l6:
0c93 : 91 43 __ STA (T1 + 0),y 
0c95 : 88 __ __ DEY
0c96 : 10 fb __ BPL $0c93 ; (glitch_row.l6 + 0)
.s7:
0c98 : 20 fe 0a JSR $0afe ; (wait_frame.l4 + 0)
0c9b : a6 45 __ LDX T4 + 0 
0c9d : e8 __ __ INX
0c9e : e0 06 __ CPX #$06
0ca0 : 90 ea __ BCC $0c8c ; (glitch_row.l5 + 0)
.s3:
0ca2 : 60 __ __ RTS
--------------------------------------------------------------------
scene3_run: ; scene3_run()->void
; 512, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0ca3 : a9 02 __ LDA #$02
0ca5 : 85 0d __ STA P0 
0ca7 : 20 9b 0f JSR $0f9b ; (cls@proxy + 0)
0caa : 20 21 0a JSR $0a21 ; (print_centered@proxy + 0)
0cad : a9 04 __ LDA #$04
0caf : 85 45 __ STA T0 + 1 
0cb1 : 85 0d __ STA P0 
0cb3 : e6 11 __ INC P4 
0cb5 : a9 02 __ LDA #$02
0cb7 : 85 0e __ STA P1 
0cb9 : a9 b0 __ LDA #$b0
0cbb : 85 0f __ STA P2 
0cbd : a9 11 __ LDA #$11
0cbf : 85 10 __ STA P3 
0cc1 : 20 55 0a JSR $0a55 ; (print_at.s4 + 0)
0cc4 : a9 18 __ LDA #$18
0cc6 : 85 0e __ STA P1 
0cc8 : a9 11 __ LDA #$11
0cca : 85 10 __ STA P3 
0ccc : a9 b5 __ LDA #$b5
0cce : 85 0f __ STA P2 
0cd0 : 20 55 0a JSR $0a55 ; (print_at.s4 + 0)
0cd3 : a9 8c __ LDA #$8c
0cd5 : 85 44 __ STA T0 + 0 
0cd7 : a9 00 __ LDA #$00
0cd9 : 85 1f __ STA ADDR + 0 
.l27:
0cdb : a9 5d __ LDA #$5d
0cdd : a0 00 __ LDY #$00
0cdf : 91 44 __ STA (T0 + 0),y 
0ce1 : 18 __ __ CLC
0ce2 : a5 45 __ LDA T0 + 1 
0ce4 : 69 d4 __ ADC #$d4
0ce6 : 85 20 __ STA ADDR + 1 
0ce8 : a9 0b __ LDA #$0b
0cea : a4 44 __ LDY T0 + 0 
0cec : 91 1f __ STA (ADDR + 0),y 
0cee : 98 __ __ TYA
0cef : 18 __ __ CLC
0cf0 : 69 28 __ ADC #$28
0cf2 : 85 44 __ STA T0 + 0 
0cf4 : 90 02 __ BCC $0cf8 ; (scene3_run.s30 + 0)
.s29:
0cf6 : e6 45 __ INC T0 + 1 
.s30:
0cf8 : c9 84 __ CMP #$84
0cfa : d0 df __ BNE $0cdb ; (scene3_run.l27 + 0)
.s26:
0cfc : a5 45 __ LDA T0 + 1 
0cfe : c9 07 __ CMP #$07
0d00 : d0 d9 __ BNE $0cdb ; (scene3_run.l27 + 0)
.s5:
0d02 : 20 e8 0a JSR $0ae8 ; (scroll_init.s4 + 0)
0d05 : a9 00 __ LDA #$00
0d07 : 8d ff 0f STA $0fff ; (blink_phase + 0)
0d0a : 8d fe 0f STA $0ffe ; (blink_cnt + 0)
0d0d : 85 46 __ STA T1 + 0 
0d0f : 85 47 __ STA T2 + 0 
.l28:
0d11 : 85 48 __ STA T3 + 0 
.l6:
0d13 : 20 fe 0a JSR $0afe ; (wait_frame.l4 + 0)
0d16 : 20 3e 0e JSR $0e3e ; (draw_bars.s4 + 0)
0d19 : e6 46 __ INC T1 + 0 
0d1b : a5 46 __ LDA T1 + 0 
0d1d : c9 08 __ CMP #$08
0d1f : 90 07 __ BCC $0d28 ; (scene3_run.s7 + 0)
.s25:
0d21 : 20 75 0e JSR $0e75 ; (rotate_bars_left.s4 + 0)
0d24 : a9 00 __ LDA #$00
0d26 : 85 46 __ STA T1 + 0 
.s7:
0d28 : 20 0d 0b JSR $0b0d ; (scroll_step.s4 + 0)
0d2b : e6 47 __ INC T2 + 0 
0d2d : a5 47 __ LDA T2 + 0 
0d2f : c9 0f __ CMP #$0f
0d31 : d0 03 __ BNE $0d36 ; (scene3_run.s8 + 0)
0d33 : 4c 0a 0e JMP $0e0a ; (scene3_run.s23 + 0)
.s8:
0d36 : c9 23 __ CMP #$23
0d38 : d0 03 __ BNE $0d3d ; (scene3_run.s9 + 0)
0d3a : 4c d7 0d JMP $0dd7 ; (scene3_run.s21 + 0)
.s9:
0d3d : c9 37 __ CMP #$37
0d3f : f0 64 __ BEQ $0da5 ; (scene3_run.s19 + 0)
.s10:
0d41 : c9 4b __ CMP #$4b
0d43 : f0 35 __ BEQ $0d7a ; (scene3_run.s17 + 0)
.s11:
0d45 : c9 64 __ CMP #$64
0d47 : f0 1d __ BEQ $0d66 ; (scene3_run.s15 + 0)
.s32:
0d49 : a5 48 __ LDA T3 + 0 
.s12:
0d4b : c9 05 __ CMP #$05
0d4d : 90 c4 __ BCC $0d13 ; (scene3_run.l6 + 0)
.s13:
0d4f : a9 15 __ LDA #$15
0d51 : 85 0d __ STA P0 
0d53 : a9 0c __ LDA #$0c
0d55 : 85 0e __ STA P1 
0d57 : 20 6b 0b JSR $0b6b ; (blink_row.s4 + 0)
0d5a : 20 ab 0b JSR $0bab ; (fire_pressed.s4 + 0)
0d5d : aa __ __ TAX
0d5e : f0 b3 __ BEQ $0d13 ; (scene3_run.l6 + 0)
.s14:
0d60 : 20 dd 0b JSR $0bdd ; (fade_to_black@proxy + 0)
0d63 : 4c d3 09 JMP $09d3 ; (wait_frames@proxy + 0)
.s15:
0d66 : a5 48 __ LDA T3 + 0 
0d68 : c9 05 __ CMP #$05
0d6a : b0 e3 __ BCS $0d4f ; (scene3_run.s13 + 0)
.s16:
0d6c : a9 13 __ LDA #$13
0d6e : 20 b1 0a JSR $0ab1 ; (hline.s4 + 0)
0d71 : 20 88 0f JSR $0f88 ; (print_centered@proxy + 0)
0d74 : a9 05 __ LDA #$05
0d76 : 85 48 __ STA T3 + 0 
0d78 : d0 d5 __ BNE $0d4f ; (scene3_run.s13 + 0)
.s17:
0d7a : a5 48 __ LDA T3 + 0 
0d7c : c9 04 __ CMP #$04
0d7e : b0 cb __ BCS $0d4b ; (scene3_run.s12 + 0)
.s18:
0d80 : a9 0f __ LDA #$0f
0d82 : 85 0d __ STA P0 
0d84 : a9 10 __ LDA #$10
0d86 : 85 10 __ STA P3 
0d88 : a9 08 __ LDA #$08
0d8a : 85 11 __ STA P4 
0d8c : a9 14 __ LDA #$14
0d8e : 85 0f __ STA P2 
0d90 : 20 45 0f JSR $0f45 ; (print_at@proxy + 0)
0d93 : c6 11 __ DEC P4 
0d95 : a9 ec __ LDA #$ec
0d97 : 85 0f __ STA P2 
0d99 : a9 11 __ LDA #$11
0d9b : 85 10 __ STA P3 
0d9d : 20 3e 0f JSR $0f3e ; (print_at@proxy + 0)
0da0 : a9 04 __ LDA #$04
0da2 : 4c 11 0d JMP $0d11 ; (scene3_run.l28 + 0)
.s19:
0da5 : a5 48 __ LDA T3 + 0 
0da7 : c9 03 __ CMP #$03
0da9 : 90 05 __ BCC $0db0 ; (scene3_run.s20 + 0)
.s33:
0dab : a5 47 __ LDA T2 + 0 
0dad : 4c 45 0d JMP $0d45 ; (scene3_run.s11 + 0)
.s20:
0db0 : a9 0c __ LDA #$0c
0db2 : 85 0d __ STA P0 
0db4 : a9 11 __ LDA #$11
0db6 : 85 10 __ STA P3 
0db8 : a9 0d __ LDA #$0d
0dba : 85 11 __ STA P4 
0dbc : a9 77 __ LDA #$77
0dbe : 85 0f __ STA P2 
0dc0 : 20 45 0f JSR $0f45 ; (print_at@proxy + 0)
0dc3 : a9 12 __ LDA #$12
0dc5 : 85 10 __ STA P3 
0dc7 : a9 05 __ LDA #$05
0dc9 : 85 11 __ STA P4 
0dcb : a9 00 __ LDA #$00
0dcd : 85 0f __ STA P2 
0dcf : 20 3e 0f JSR $0f3e ; (print_at@proxy + 0)
0dd2 : a9 03 __ LDA #$03
0dd4 : 4c 11 0d JMP $0d11 ; (scene3_run.l28 + 0)
.s21:
0dd7 : a5 48 __ LDA T3 + 0 
0dd9 : c9 02 __ CMP #$02
0ddb : 90 05 __ BCC $0de2 ; (scene3_run.s22 + 0)
.s31:
0ddd : a5 47 __ LDA T2 + 0 
0ddf : 4c 41 0d JMP $0d41 ; (scene3_run.s10 + 0)
.s22:
0de2 : a9 09 __ LDA #$09
0de4 : 85 0d __ STA P0 
0de6 : a9 11 __ LDA #$11
0de8 : 85 10 __ STA P3 
0dea : a9 03 __ LDA #$03
0dec : 85 11 __ STA P4 
0dee : a9 64 __ LDA #$64
0df0 : 85 0f __ STA P2 
0df2 : 20 45 0f JSR $0f45 ; (print_at@proxy + 0)
0df5 : a9 11 __ LDA #$11
0df7 : 85 10 __ STA P3 
0df9 : a9 0e __ LDA #$0e
0dfb : 85 11 __ STA P4 
0dfd : a9 cf __ LDA #$cf
0dff : 85 0f __ STA P2 
0e01 : 20 3e 0f JSR $0f3e ; (print_at@proxy + 0)
0e04 : a9 02 __ LDA #$02
0e06 : 85 48 __ STA T3 + 0 
0e08 : d0 a1 __ BNE $0dab ; (scene3_run.s33 + 0)
.s23:
0e0a : a5 48 __ LDA T3 + 0 
0e0c : f0 05 __ BEQ $0e13 ; (scene3_run.s24 + 0)
.s34:
0e0e : a5 47 __ LDA T2 + 0 
0e10 : 4c 3d 0d JMP $0d3d ; (scene3_run.s9 + 0)
.s24:
0e13 : a9 01 __ LDA #$01
0e15 : e6 48 __ INC T3 + 0 
0e17 : 85 0e __ STA P1 
0e19 : a9 06 __ LDA #$06
0e1b : 85 0d __ STA P0 
0e1d : a9 02 __ LDA #$02
0e1f : 85 11 __ STA P4 
0e21 : a9 11 __ LDA #$11
0e23 : 85 10 __ STA P3 
0e25 : a9 4f __ LDA #$4f
0e27 : 85 0f __ STA P2 
0e29 : 20 55 0a JSR $0a55 ; (print_at.s4 + 0)
0e2c : a9 11 __ LDA #$11
0e2e : 85 10 __ STA P3 
0e30 : a9 0a __ LDA #$0a
0e32 : 85 11 __ STA P4 
0e34 : a9 b9 __ LDA #$b9
0e36 : 85 0f __ STA P2 
0e38 : 20 3e 0f JSR $0f3e ; (print_at@proxy + 0)
0e3b : 4c dd 0d JMP $0ddd ; (scene3_run.s31 + 0)
--------------------------------------------------------------------
draw_bars: ; draw_bars(u8)->void
; 182, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0e3e : a9 00 __ LDA #$00
0e40 : 8d 20 d0 STA $d020 
0e43 : 8d 21 d0 STA $d021 
0e46 : a8 __ __ TAY
.l5:
0e47 : 18 __ __ CLC
0e48 : 69 06 __ ADC #$06
0e4a : 29 1f __ AND #$1f
0e4c : 0a __ __ ASL
0e4d : 0a __ __ ASL
0e4e : 0a __ __ ASL
0e4f : 09 03 __ ORA #$03
.l9:
0e51 : cd 12 d0 CMP $d012 
0e54 : d0 fb __ BNE $0e51 ; (draw_bars.l9 + 0)
.s6:
0e56 : b9 a3 0f LDA $0fa3,y ; (bar_pal[0] + 0)
0e59 : 8d 20 d0 STA $d020 
0e5c : 8d 21 d0 STA $d021 
0e5f : c8 __ __ INY
0e60 : 98 __ __ TYA
0e61 : c0 08 __ CPY #$08
0e63 : d0 e2 __ BNE $0e47 ; (draw_bars.l5 + 0)
.s7:
0e65 : a9 73 __ LDA #$73
.l10:
0e67 : cd 12 d0 CMP $d012 
0e6a : d0 fb __ BNE $0e67 ; (draw_bars.l10 + 0)
.s8:
0e6c : a9 00 __ LDA #$00
0e6e : 8d 20 d0 STA $d020 
0e71 : 8d 21 d0 STA $d021 
.s3:
0e74 : 60 __ __ RTS
--------------------------------------------------------------------
rotate_bars_left: ; rotate_bars_left()->void
; 174, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0e75 : a0 00 __ LDY #$00
0e77 : ae a3 0f LDX $0fa3 ; (bar_pal[0] + 0)
.l5:
0e7a : b9 a4 0f LDA $0fa4,y ; (bar_pal[0] + 1)
0e7d : 99 a3 0f STA $0fa3,y ; (bar_pal[0] + 0)
0e80 : c8 __ __ INY
0e81 : c0 07 __ CPY #$07
0e83 : d0 f5 __ BNE $0e7a ; (rotate_bars_left.l5 + 0)
.s6:
0e85 : 8e aa 0f STX $0faa ; (bar_pal[0] + 7)
.s3:
0e88 : 60 __ __ RTS
--------------------------------------------------------------------
scene4_run: ; scene4_run()->void
; 598, "C:/code/jonas/c64Demo/nineteen84.c"
.s4:
0e89 : a9 1e __ LDA #$1e
0e8b : 85 0d __ STA P0 
0e8d : 20 e8 09 JSR $09e8 ; (cls.s4 + 0)
0e90 : 20 d7 09 JSR $09d7 ; (wait_frames.s4 + 0)
0e93 : a9 0a __ LDA #$0a
0e95 : 85 0d __ STA P0 
0e97 : a9 12 __ LDA #$12
0e99 : 85 10 __ STA P3 
0e9b : a9 17 __ LDA #$17
0e9d : 85 0f __ STA P2 
0e9f : 20 61 0f JSR $0f61 ; (print_centered@proxy + 0)
0ea2 : 20 4c 0f JSR $0f4c ; (wait_frames@proxy + 0)
0ea5 : a9 12 __ LDA #$12
0ea7 : 85 10 __ STA P3 
0ea9 : a9 0a __ LDA #$0a
0eab : 85 11 __ STA P4 
0ead : a9 38 __ LDA #$38
0eaf : 85 0f __ STA P2 
0eb1 : 20 73 0f JSR $0f73 ; (print_centered@proxy + 0)
0eb4 : 20 4c 0f JSR $0f4c ; (wait_frames@proxy + 0)
0eb7 : a9 00 __ LDA #$00
0eb9 : 85 44 __ STA T1 + 0 
0ebb : 8d ff 0f STA $0fff ; (blink_phase + 0)
0ebe : 8d fe 0f STA $0ffe ; (blink_cnt + 0)
0ec1 : 8d a8 0f STA $0fa8 ; (bar_pal[0] + 5)
0ec4 : 8d a9 0f STA $0fa9 ; (bar_pal[0] + 6)
0ec7 : 8d aa 0f STA $0faa ; (bar_pal[0] + 7)
0eca : a9 12 __ LDA #$12
0ecc : 85 0d __ STA P0 
0ece : a9 0c __ LDA #$0c
0ed0 : 85 11 __ STA P4 
0ed2 : a9 02 __ LDA #$02
0ed4 : 8d a3 0f STA $0fa3 ; (bar_pal[0] + 0)
0ed7 : 8d a6 0f STA $0fa6 ; (bar_pal[0] + 3)
0eda : a9 0a __ LDA #$0a
0edc : 8d a4 0f STA $0fa4 ; (bar_pal[0] + 1)
0edf : a9 08 __ LDA #$08
0ee1 : 8d a5 0f STA $0fa5 ; (bar_pal[0] + 2)
0ee4 : a9 0b __ LDA #$0b
0ee6 : 8d a7 0f STA $0fa7 ; (bar_pal[0] + 4)
0ee9 : a9 2c __ LDA #$2c
0eeb : 85 0f __ STA P2 
0eed : a9 10 __ LDA #$10
0eef : 85 10 __ STA P3 
0ef1 : 20 29 0a JSR $0a29 ; (print_centered.s4 + 0)
0ef4 : a9 0c __ LDA #$0c
0ef6 : 85 0e __ STA P1 
.l5:
0ef8 : 20 fe 0a JSR $0afe ; (wait_frame.l4 + 0)
0efb : 20 3e 0e JSR $0e3e ; (draw_bars.s4 + 0)
0efe : e6 44 __ INC T1 + 0 
0f00 : a5 44 __ LDA T1 + 0 
0f02 : c9 0a __ CMP #$0a
0f04 : 90 07 __ BCC $0f0d ; (scene4_run.s6 + 0)
.s8:
0f06 : 20 75 0e JSR $0e75 ; (rotate_bars_left.s4 + 0)
0f09 : a9 00 __ LDA #$00
0f0b : 85 44 __ STA T1 + 0 
.s6:
0f0d : 20 6b 0b JSR $0b6b ; (blink_row.s4 + 0)
0f10 : 20 ab 0b JSR $0bab ; (fire_pressed.s4 + 0)
0f13 : aa __ __ TAX
0f14 : f0 e2 __ BEQ $0ef8 ; (scene4_run.l5 + 0)
.s7:
0f16 : 20 5a 0f JSR $0f5a ; (fade_to_black@proxy + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
0f19 : a9 14 __ LDA #$14
0f1b : 85 0d __ STA P0 
0f1d : 4c d7 09 JMP $09d7 ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
__multab40L:
0f20 : __ __ __ BYT 00 28 50 78 a0 c8 f0 18 40 68 90 b8 e0 08 30    : .(Px....@h....0
--------------------------------------------------------------------
__multab40H:
0f2f : __ __ __ BYT 00 00 00 00 00 00 00 01 01 01 01 01 01 02 02    : ...............
--------------------------------------------------------------------
print_at@proxy: ; print_at@proxy
0f3e : a9 16 __ LDA #$16
0f40 : 85 0e __ STA P1 
0f42 : 4c 55 0a JMP $0a55 ; (print_at.s4 + 0)
--------------------------------------------------------------------
print_at@proxy: ; print_at@proxy
0f45 : a9 01 __ LDA #$01
0f47 : 85 0e __ STA P1 
0f49 : 4c 55 0a JMP $0a55 ; (print_at.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
0f4c : a9 28 __ LDA #$28
0f4e : 85 0d __ STA P0 
0f50 : 4c d7 09 JMP $09d7 ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
wait_frames@proxy: ; wait_frames@proxy
0f53 : a9 1e __ LDA #$1e
0f55 : 85 0d __ STA P0 
0f57 : 4c d7 09 JMP $09d7 ; (wait_frames.s4 + 0)
--------------------------------------------------------------------
fade_to_black@proxy: ; fade_to_black@proxy
0f5a : a9 14 __ LDA #$14
0f5c : 85 0d __ STA P0 
0f5e : 4c e1 0b JMP $0be1 ; (fade_to_black.s4 + 0)
--------------------------------------------------------------------
print_centered@proxy: ; print_centered@proxy
0f61 : a9 01 __ LDA #$01
0f63 : 85 11 __ STA P4 
0f65 : 4c 29 0a JMP $0a29 ; (print_centered.s4 + 0)
--------------------------------------------------------------------
print_centered@proxy: ; print_centered@proxy
0f68 : a9 14 __ LDA #$14
0f6a : 85 0d __ STA P0 
0f6c : a9 0b __ LDA #$0b
0f6e : 85 11 __ STA P4 
0f70 : 4c 29 0a JMP $0a29 ; (print_centered.s4 + 0)
--------------------------------------------------------------------
print_centered@proxy: ; print_centered@proxy
0f73 : a9 0c __ LDA #$0c
0f75 : 85 0d __ STA P0 
0f77 : 4c 29 0a JMP $0a29 ; (print_centered.s4 + 0)
--------------------------------------------------------------------
print_centered@proxy: ; print_centered@proxy
0f7a : a9 0e __ LDA #$0e
0f7c : 85 0d __ STA P0 
0f7e : 4c 29 0a JMP $0a29 ; (print_centered.s4 + 0)
--------------------------------------------------------------------
print_centered@proxy: ; print_centered@proxy
0f81 : a9 02 __ LDA #$02
0f83 : 85 11 __ STA P4 
0f85 : 4c 29 0a JMP $0a29 ; (print_centered.s4 + 0)
--------------------------------------------------------------------
print_centered@proxy: ; print_centered@proxy
0f88 : a9 15 __ LDA #$15
0f8a : 85 0d __ STA P0 
0f8c : a9 2c __ LDA #$2c
0f8e : 85 0f __ STA P2 
0f90 : a9 10 __ LDA #$10
0f92 : 85 10 __ STA P3 
0f94 : a9 0c __ LDA #$0c
0f96 : 85 11 __ STA P4 
0f98 : 4c 29 0a JMP $0a29 ; (print_centered.s4 + 0)
--------------------------------------------------------------------
cls@proxy: ; cls@proxy
0f9b : a9 0b __ LDA #$0b
0f9d : 85 11 __ STA P4 
0f9f : 4c e8 09 JMP $09e8 ; (cls.s4 + 0)
--------------------------------------------------------------------
spentry:
0fa2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
bar_pal:
0fa3 : __ __ __ BYT 02 08 07 01 0e 06 04 00                         : ........
--------------------------------------------------------------------
s_title:
0fab : __ __ __ BYT 0e 09 0e 05 14 05 05 0e 20 05 09 07 08 14 19 2d : ........ ......-
0fbb : __ __ __ BYT 06 0f 15 12 00                                  : .....
--------------------------------------------------------------------
s_sub1:
0fc0 : __ __ __ BYT 14 08 05 20 14 05 03 08 0e 0f 0c 0f 07 19 20 17 : ... .......... .
0fd0 : __ __ __ BYT 05 20 17 05 12 05 20 10 12 0f 0d 09 13 05 04 00 : . .... .........
--------------------------------------------------------------------
s_sub2:
0fe0 : __ __ __ BYT 01 0e 04 20 01 14 20 17 08 01 14 20 03 0f 13 14 : ... .. .... ....
0ff0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
eye:
0ff1 : __ __ __ BYT 28 28 28 20 0f 20 29 29 29 00                   : ((( . ))).
--------------------------------------------------------------------
scroll_idx:
0ffb : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
scroll_tick:
0ffd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
blink_cnt:
0ffe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
blink_phase:
0fff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
s_orwell:
1000 : __ __ __ BYT 07 05 0f 12 07 05 20 0f 12 17 05 0c 0c 20 20 31 : ...... ......  1
1010 : __ __ __ BYT 39 34 39 00                                     : 949.
--------------------------------------------------------------------
s_bb:
1014 : __ __ __ BYT 02 09 07 20 02 12 0f 14 08 05 12 20 09 13 20 17 : ... ....... .. .
1024 : __ __ __ BYT 01 14 03 08 09 0e 07 00                         : ........
--------------------------------------------------------------------
s_press:
102c : __ __ __ BYT 10 12 05 13 13 20 06 09 12 05 20 14 0f 20 03 0f : ..... .... .. ..
103c : __ __ __ BYT 0e 14 09 0e 15 05 00                            : .......
--------------------------------------------------------------------
scroll_text:
1043 : __ __ __ BYT 20 20 20 17 01 12 20 09 13 20 10 05 01 03 05 20 :    ... .. ..... 
1053 : __ __ __ BYT 20 20 06 12 05 05 04 0f 0d 20 09 13 20 13 0c 01 :   ....... .. ...
1063 : __ __ __ BYT 16 05 12 19 20 20 20 09 07 0e 0f 12 01 0e 03 05 : ....   .........
1073 : __ __ __ BYT 20 09 13 20 13 14 12 05 0e 07 14 08 20 20 20 01 :  .. ........   .
1083 : __ __ __ BYT 09 20 09 13 20 17 01 14 03 08 09 0e 07 20 19 0f : . .. ........ ..
1093 : __ __ __ BYT 15 20 20 20 19 0f 15 12 20 04 01 14 01 20 09 13 : .   .... .... ..
10a3 : __ __ __ BYT 20 14 08 05 20 0e 05 17 20 13 0c 01 16 05 12 19 :  ... ... .......
10b3 : __ __ __ BYT 20 20 20 02 09 07 20 02 12 0f 14 08 05 12 20 09 :    ... ....... .
10c3 : __ __ __ BYT 13 20 17 01 14 03 08 09 0e 07 20 20 20 13 15 12 : . ........   ...
10d3 : __ __ __ BYT 16 05 09 0c 0c 01 0e 03 05 20 09 13 20 10 05 01 : ......... .. ...
10e3 : __ __ __ BYT 03 05 20 20 20 04 09 04 20 17 05 20 07 05 14 20 : ..   ... .. ... 
10f3 : __ __ __ BYT 17 08 01 14 20 17 05 20 17 05 12 05 20 10 12 0f : .... .. .... ...
1103 : __ __ __ BYT 0d 09 13 05 04 20 20 01 0e 04 20 01 14 20 17 08 : .....  ... .. ..
1113 : __ __ __ BYT 01 14 20 03 0f 13 14 20 20 20 10 12 05 04 09 03 : .. ....   ......
1123 : __ __ __ BYT 14 09 0f 0e 20 09 13 20 13 14 12 05 0e 07 14 08 : .... .. ........
1133 : __ __ __ BYT 20 20 20 03 0f 0d 10 0c 09 01 0e 03 05 20 09 13 :    .......... ..
1143 : __ __ __ BYT 20 06 12 05 05 04 0f 0d 20 20 20 ff             :  .......   .
--------------------------------------------------------------------
s_sl1:
114f : __ __ __ BYT 17 01 12 20 09 13 20 10 05 01 03 05 00          : ... .. ......
--------------------------------------------------------------------
glitch_pal:
115c : __ __ __ BYT 02 01 0a 0b 01 00 02 01                         : ........
--------------------------------------------------------------------
s_sl2:
1164 : __ __ __ BYT 06 12 05 05 04 0f 0d 20 09 13 20 13 0c 01 16 05 : ....... .. .....
1174 : __ __ __ BYT 12 19 00                                        : ...
--------------------------------------------------------------------
s_sl3:
1177 : __ __ __ BYT 09 07 0e 0f 12 01 0e 03 05 20 09 13 20 13 14 12 : ......... .. ...
1187 : __ __ __ BYT 05 0e 07 14 08 00                               : ......
--------------------------------------------------------------------
s_tc:
118d : __ __ __ BYT 14 08 0f 15 07 08 14 03 12 09 0d 05 20 04 0f 05 : ............ ...
119d : __ __ __ BYT 13 20 0e 0f 14 20 05 0e 14 01 09 0c 20 04 05 01 : . ... ...... ...
11ad : __ __ __ BYT 14 08 00                                        : ...
--------------------------------------------------------------------
col_then:
11b0 : __ __ __ BYT 14 08 05 0e 00                                  : .....
--------------------------------------------------------------------
col_now:
11b5 : __ __ __ BYT 0e 0f 17 00                                     : ....
--------------------------------------------------------------------
s_ai3:
11b9 : __ __ __ BYT 13 15 12 16 05 09 0c 0c 01 0e 03 05 20 09 13 20 : ............ .. 
11c9 : __ __ __ BYT 10 05 01 03 05 00                               : ......
--------------------------------------------------------------------
s_ai2:
11cf : __ __ __ BYT 19 0f 15 12 20 04 01 14 01 20 09 13 20 14 08 05 : .... .... .. ...
11df : __ __ __ BYT 20 0e 05 17 20 13 0c 01 16 05 12 19 00          :  ... ........
--------------------------------------------------------------------
s_ai1:
11ec : __ __ __ BYT 01 09 20 09 13 20 17 01 14 03 08 09 0e 07 20 19 : .. .. ........ .
11fc : __ __ __ BYT 0f 15 00                                        : ...
--------------------------------------------------------------------
s_ai4:
1200 : __ __ __ BYT 10 12 05 04 09 03 14 09 0f 0e 20 09 13 20 13 14 : .......... .. ..
1210 : __ __ __ BYT 12 05 0e 07 14 08 00                            : .......
--------------------------------------------------------------------
s_q1:
1217 : __ __ __ BYT 04 09 04 20 17 05 20 07 05 14 20 17 08 01 14 20 : ... .. ... .... 
1227 : __ __ __ BYT 17 05 20 17 05 12 05 20 10 12 0f 0d 09 13 05 04 : .. .... ........
1237 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
s_q2:
1238 : __ __ __ BYT 0f 12 20 13 0f 0d 05 14 08 09 0e 07 20 06 01 12 : .. ......... ...
1248 : __ __ __ BYT 20 0d 0f 12 05 20 04 01 0e 07 05 12 0f 15 13 00 :  .... ..........
--------------------------------------------------------------------
s_c64:
1258 : __ __ __ BYT 01 20 03 36 34 20 04 05 0d 0f 00                : . .64 .....
--------------------------------------------------------------------
s_end:
1263 : __ __ __ BYT 14 08 05 20 05 0e 04 20 09 13 20 0e 0f 14 20 19 : ... ... .. ... .
1273 : __ __ __ BYT 05 14 20 17 12 09 14 14 05 0e 00                : .. ........
--------------------------------------------------------------------
scroll_buf:
127e : __ __ __ BSS	40
