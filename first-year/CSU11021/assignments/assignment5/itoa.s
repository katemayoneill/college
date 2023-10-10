  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 5

  @
  @ TIP: To view memory when debugging your program you can ...
  @
  @   Add the watch expression to see individual characters: (char[64])strA
  @
  @   OR
  @
  @   Add the watch expression to see the string: (char*)&strA
  @
  @   OR
  @
  @   Open a 'Memory View' specifying the address &strA and length at
  @   least 11. You can open a Memory View with ctrl-shift-p type
  @   'View Memory' (cmd-shift-p on a Mac).
  @

  LDR     R2, =-1
  LDR     R3, =0
  LDR     R4, =10
  LDR     R5, =1

  CMP     R1, #0          @   if(value = 0)
  BNE     isNotZero       @   {
  ADD     R1, R1, #48     @     value += 48;
  STRB    R1, [R0]        @     store value into result;
  B       End             @   }
isNotZero:
  CMP     R1, #0          @   if(value > 0)   
  BLT     isNegative      @   {        
  LDR     R6, =0x2B       @      positiveOrNegative = -;
  STRB    R6, [R0]        @      store positiveOrNegative into result;
  B       While           @   }
isNegative:
                          @   if(value < 0)
                          @   {
  MUL      R1, R1, R2     @      value *= -1
  LDR      R6, =0x2D      @      postiveOrNegative = +;
  STRB     R6, [R0]       @      store positiveOrNegative into result;
  B   While               @   }  
While:                  
                          @   while(valueTest < 10)
                          @   {
  UDIV     R6, R1, R5     @     valueTest = value / divisor;
  CMP      R6, #10
  BLT      IsLessThanTen
  MUL      R5, R5, R4     @     divisor = divisor * 10;
  B   While               @   }
IsLessThanTen:
                          @   if( divisor >= 1)
                          @   {
  ADD      R0, R0, #1     @     result += 1;
  ADD      R7, R6, 0x30   @     asciiValue = valueTest + 0x30; 
  STRB     R7, [R0]       @     store ascii value into R0;
  MUL      R8, R6, R5  
  SUB      R1, R1, R8     @     value -= remainder;
  UDIV     R5, R5, R4     @     divisor /= 10;
  UDIV     R6, R1, R5     @     valueTest = value / divisor;
  CMP      R5, #1         @ 
  BLT      End   
  B        IsLessThanTen  @   {
End:
  ADD    R0, R0, #1       @   result += 1;
  STRB   R3, [R0]         @   store 0 into result





  @ End of program ... check your result


End_Main:
  BX    lr
