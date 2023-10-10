  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

@
@ Follow the instructions contained in the examination paper
@

  ldrb    r2, [r1]        @ currentValue = byte[adr]
  mov     r3, 0x0         @ previousValue = 0
  mov     r4, 0xA         @ TEN = 10
While:
  cmp     r1, 0x0         @ while(adr != 0)
  beq     End             @ {
  mov     r3, r2          @   previousValue = currentValue
  add     r1, r1, 0x1     @   adr ++
  ldrb    r2, [r1]        @  currentValue = byte[adr]
  cmp     r2, 0x2A        @   boolean Multiplication = (currentValue == '*')
  beq     Multiplication
  cmp     r2, 0x2B        @   boolean Addition = (currentValue == '+')
  beq     Addition
  cmp     r2, 0x2D        @   boolean Substraction = (currentValue == '-')
  beq     Substraction
  mul     r3, r3, r4    @   if(currentValue != '*' && currentValue != '+' && currentValue != '-')
  add     r0, r3, r2      @   {
  b       While           @     previousValue *= TEN
                          @     result = currentValue + previousValue
                          @   }
Multiplication:           
                          @    else if(Multiplication)
                          @   {
  add     r1, r1, 0x1     @     adr ++
  ldrb    r2, [r1]        @     currentValue = byte[adr]
  mul     r0, r3, r2      @     result = currentValue * previousValue

Substraction:

Addition:

End:

@

End_Main:
  BX    lr
