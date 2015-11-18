********************************
*   AL 18 - HIRES DEMO         *
********************************
*                              *
*                              *
*                              *
*       OBJ $6000
        ORG $6000

*
KYBD    EQU $C000
STROBE  EQU $C010

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

ENTRY   JMP START
TABLE   HEX 010004
        HEX 00123F
        HEX 20642D
        HEX 15361E
        HEX 0700

START   JSR HGR       ; CLR SCRN
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

WAIT    LDA KYBD      ; LOAD KEY INTO A
        CMP #$80      ; CMP TO $80 - NO KEY
        BCC WAIT      ; IF CARRY CLEAR, BRANCH TO WAIT

        RTS
