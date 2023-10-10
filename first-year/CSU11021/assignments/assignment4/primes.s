  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 4

  MOV R0, #0        @ numberOfPrimes = 0
  SUB R6, R1, #1    @ testNumber = N - 1
While1:             @ 
  CMP R6, #1        @   while(testNumber > 1)
  BLE End           @   {
  MOV R2, #2        @    divisor = 2
  MOV R3, #1        @    remainder = 1
While2:             @ 
  CMP R2, R6        @    while(divisor < testNumber && remainder != 0)
  BGE EndWh2        @      
  CMP R3, #0        @    {
  BEQ EndWh2        @  
  UDIV  R4, R6, R2  @     quotient = testNumber / divisor
  MUL R5, R4, R2    @
  SUB R3, R6, R5    @     remainder = testNumber - (quotient * divisor)
  ADD R2, R2, #1    @     divisor = divisor + 1
  B While2          @    }
EndWh2:             @
  SUB R6, R6, #1    @    testNumber = n - 1
  CMP R3, #0        @    if(remainder != 0)
  BEQ While1        @    {
  ADD R0, R0, #1    @     numberOfPrimes = numberOfPrimes + 1
  B While1          @    }
End:                @   }

  @ End of program ... check your result

End_Main:
  BX    lr
