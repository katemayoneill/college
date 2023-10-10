  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 3

  MOV R1, #1        @ int divisor = 1
                    @ int times = 1
  CMP R1, R2        @ if( R1 >= R2 &&  R1 >= R3 )
  BLS End           @ {
                    @
  CMP R3, R1        @
  BHS End           @
                    @ while()
Divide:             @     while( R4 > 0 || R5 > 0)
                    @     {
  SUB R4, R2, R1    @       R4 = R2 - R1
  SUB R5, R3, R1    @       R5 = R3 - R1
  ADD R1, #1        @     } 
                    @       R1 = R1 + 1
                    @
  CMP R4, #0        @
  BHI Divide        @
                    @
  CMP R5, #0        @
  BHI Divide        @
                    @
                    @
                    @
  MOV R0, R1 
  
  End:        @
  @ End of program ... check your result

End_Main:
  BX    lr
