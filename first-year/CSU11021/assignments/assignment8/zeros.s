  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 8
  @ 1000 0011 1000 0011 1110 0000 0000 0011
  mov   r0, 0x0           @ result = 0
  mov   r2, 0x0           @ counter = 0
  cmp   r1, 0x0
  beq   isNull
While:
  cmp   r1, 0x0           @ while(value != 0) {
  beq   EndWhile 
  movs  r1, r1, lsl 0x1   @   left shift value by one
  bcs   isSet             @   if(carry is clear) {
  add   r2, r2, 0x1       @     count ++
  cmp   r2, r0            @     }
  blo   While             @      if(count > value) { 
  mov   r0, r2            @       result = count
  b     While             @       }
isSet:                    @   }
  mov   r2, 0x0             @   else { count = 0 }
  b     While             @    }
EndWhile:
  cmp   r2, r0
  blo   End
  mov   r0, r2
  b End
isNull:
  mov   r0, 0x20
End:

  @ End of program ... check your result

End_Main:
  BX    lr
