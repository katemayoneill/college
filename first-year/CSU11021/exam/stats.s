  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

@
@ Follow the instructions contained in the examination paper
@
  mov   r0, 0x0           @ average = 0
  mov   r1, 0x0           @ mode = 0
  mov   r4, 0x0           @ count = 0
  mov   r7, r2            @ tmpAdr = adr
  ldr   r3, [r2]          @ size = word[adr]
findSum:
  cmp   r4, r3            @ while(count < size)
  bhi   findMean          @ {
  add   r7, r7, 0x4       @   tmpAdr += 4
  ldr   r5, [r7]          @   currentValue = word[tmpAdr]
  add   r6, r6, r5        @   sum += currentValue
  add   r4, r4, 0x1       @   count ++
  b     findSum           @ {
findMean:
  udiv  r0, r6, r3        @ average = sum / count
  mov   r4, 0x0           @ count = 0
  mov   r5, 0x0           @ value = 0
  mov   r6, 0x0           @ currentValue = 0
  mov   r7, r2            @ tmpAdr1 = adr
  mov   r8, 0x0           @ tmpAdr2 = 0
  mov   r9, 0x0           @ timesAppeared = 0
  mov   r10, 0x0          @ count2 = 0x0
  mov   r11, 0x0          @ mostTimesAppeared = 0
findMode:
  cmp   r4, r3            @ while(count < size)
  bhi   End               @ {
  ldr   r5, [r7]          @   value = word[tmpAdr1]
  add   r7, r7, 0x4       @   tmpAdr1 += 4
  mov   r10, 0x0          @   count2 = 0
  add   r4, r4, 0x1       @   count ++
  mov   r8, r2            @   tmpAdr2 = Adr
testValue:
  cmp   r10, r3           @   while(count2 < size)
  bhi   isMaxCount        @   {
  add   r10, r10, 0x1     @     count2 ++
  ldr   r6, [r8]          @     currentValue = word[tmpAdr2]
  add   r8, r8, 0x4       @     tmpAdr2 += 4
  cmp   r5, r6            @     if(value = currentValue)
  bne   testValue         @     {
  add   r9, r9, 0x1       @       timesAppeared ++
  b     testValue         @     }
                          @   }
isMaxCount:
  cmp   r9, r11           @   if(timesAppeared > mostTimesAppeared)
  bls   findMode          @   {
  mov   r11, r9           @     mostTimesAppeared = timesAppeared
  mov   r1, r6            @     mode = currentValue
  b     findMode          @   }
End:
End_Main:
  BX    lr
