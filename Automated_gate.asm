ORG 0000H
START:
    MOV P3, #0FFH       ; Configure Port 3 as input for IR sensors
    CLR P2.0            ; Motor control for gate
    CLR P2.1            ; Motor control for gate
    CLR P2.2            ; Red traffic light and alarm OFF
    SETB P2.3           ; Green traffic light ON

CheckIR:
    ACALL DELAY
    JB P3.0, CheckIR    ; Wait until IR1 is blocked
    SJMP MotorForward

MotorForward:
    SETB P2.2           ; Red light ON
    CLR P2.3            ; Green light OFF
    SETB P2.0           ; Gate closing (motor forward)
    CLR P2.1
    ACALL DELAY1
    ACALL DELAY1
    CLR P2.0            ; Stop motor

BACK1:
    JB P3.1, BACK1      ; Wait until IR2 is blocked
    SJMP SecondIRDetected

SecondIRDetected:
    JB P3.1, SecondIRDetected ; Wait until IR2 is unblocked

MotorReverse_Check_FirstIR:
    JB P3.0, MotorReverse_Check_FirstIR ; Wait until IR1 is unblocked

SecondIR_Check:
    JB P3.1, SecondIR_Check ; Ensure IR2 is clear

    CLR P2.0            ; Gate opening (motor reverse)
    SETB P2.1
    ACALL DELAY1
    ACALL DELAY1
    CLR P2.1            ; Stop motor
    CLR P2.2            ; Red light OFF
    SETB P2.3           ; Green light ON
    SJMP START

DELAY:
    MOV R7, #0FFH
DELAY_LOOP1:
    MOV R6, #0FFH
DELAY_LOOP2:
    MOV R5, #0FFH
DELAY_LOOP3:
    DJNZ R5, DELAY_LOOP3
    DJNZ R6, DELAY_LOOP2
    DJNZ R7, DELAY_LOOP1
    RET

DELAY1:
    MOV R4, #14H
OneSec:
    MOV TMOD, #01H
    MOV TL0, #0AFH
    MOV TH0, #3CH
    SETB TR0
WAIT:
    JNB TF0, WAIT
    CLR TR0
    CLR TF0
    DJNZ R4, OneSec
    RET

    END
