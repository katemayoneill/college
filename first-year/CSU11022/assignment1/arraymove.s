  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @
  @ write your program here
  ldr   r5, [r0, r1, lsl #2]    @ elem = word[arr + (index * 4)]
  cmp   r1, r2                  @ 
  beq   endShift
  blo   shiftRight
  bhi   shiftLeft
shiftLeft:
  cmp   r1, r2
  beq   endShift
  ldr   r3, [r0, r1, lsl #2]
  sub   r1, r1, #1
  str   r3, [r0, r1, lsl #2]
  b     shiftLeft
shiftRight:
  cmp   r1, r2
  beq   endShift
  ldr   r3, [r0, r1, lsl #2]
  add   r1, r1, #1
  str   r3, [r0, r1, lsl #2]
  b     shiftRight
endShift:
  str   r5, [r0, r2, lsl#2]


  @ End of program ... check your result

End_Main:
  BX    lr

