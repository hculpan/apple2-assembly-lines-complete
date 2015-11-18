********************************
*   AL 18 - HIRES DEMO         *
********************************
*                              *
*                              *
*                              *
*       OBJ $6000
        ORG $300

*
PREAD   EQU $FB1E
WAIT    EQU $FCA8
PB0     EQU $C061
HCOLOR  EQU $F6F0
HGR     EQU $F3E2
HPLOT   EQU $F457
HPOSN   EQU $F411
HLIN    EQU $F534
ROT     EQU $F9
SCALE   EQU $E7
SHNUM   EQU $F730
DRAW    EQU $F601
PTR     EQU $E8

ENTRY   JMP E2
TABLE   HEX 010004
        HEX 00123F
        HEX 20642D
        HEX 15361E
        HEX 0700

E2      JSR HGR       ; CLR SCRN
        LDX #$03      ; WHITE = 3
        JSR HCOLOR

BORDER  LDA #$00      ; Y = 0
        TAY
        TAX           ; X = 0
        JSR HPLOT     ; PLOT 0,0
        LDA #$17
        LDX #$01      ; X = $117
        JSR HLIN      ; HLIN TO 279,0

        LDA #$17
        LDX #$01      ; X = 279
        LDY #$9F      ; Y = 159
        JSR HLIN      ; HLIN TO 279,159

        LDA #$00
        LDX #$00      ; X = 0
        LDY #$9F      ; Y = 159
        JSR HLIN      ; HLIN TO 0,159

        LDA #$00
        LDX #$00      ; X = 0
        LDY #$00      ; Y = 0
        JSR HLIN      ; HLIN TO 0,0

SET     LDA #$03
        STA PTR
        LDA #$60
        STA PTR+1     ; SET TABLE TO $6003

READ    LDX #$00      ; PDL(0)
        JSR PREAD
        TYA
        BNE R1
        LDA #$01      ; FIX 0 -> 1
R1      STA SCALE
        LDA #$18
        JSR WAIT
        LDX #$01      ; PDL(1)
        JSR PREAD
        STY ROT
        LDA #$18
        JSR WAIT

DSPLY   LDX #$8B
        LDY #$00      ; X = 139
        LDA #$4F      ; Y = 79
        JSR HPOSN
        LDX #$01      ; SHAPE #1
        JSR SHNUM     ;FIND SHP ADDR
        LDA ROT
        JSR DRAW+4    ; USE SHNUM ENTRY PT

CHK     LDA PB0
        BMI E2        ; BUTTON PUSHED
        BPL READ      ; NO PUSH

        CHK