  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 2

  
  SUB R4, R4, #0x30
  SUB R3, R3, #0x30
  SUB R2, R2, #0x30
  SUB R1, R1, #0x30

  MUL R6, R5, R5
  MUL R7, R5, R6

  MUL R3, R3, R5 @moves these 2 a register
  MUL R2, R2, R6
  MUL R1, R1, R7

  ADD R0, R4, R3
  ADD R0, R0, R2
  ADD R0, R0, R1



  @ End of program ... check your result

End_Main:
  BX    lr
