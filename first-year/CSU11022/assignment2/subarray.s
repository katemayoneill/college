  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @
  @ write your program here
  @
  @ check each elem of array for 1st elem of subarray
  @ when that happens check 2nd elem of a against second elem of b and so on

@ initializing values so i remember them:
  mov r4, #0                @ rowA = 0
  mov r5, #0                @ colA = 0
  mov r6, #0                @ rowB = 0
  mov r7, #0                @ colB = 0
@ getting indexB and elemB
  mul r8, r6, r3            @ indexB = rowB * sizeB
  add r8, r8, r7            @ indexB += colB
  ldr r9, [r2, r8, lsl#2]   @ elemB = word[addressB + (indexB * 4)]
@ getting indexA
  mul r10, r4, r1           @ indexA = rowA * sizeA
  add r10, r10, r5          @ indexA += colA
@ initializing counter a and c
  mov r11, #0               @ a = 0
@  outer loop which checks every elemA against elemB(0)
whA:                         
  mul r7, r1, r1            @ sizeA2 = sizeA^2
                            @ while(a < sizeA2) {
  mov r8, #0                @ indexB = 0
@ if(a >= sizeA^2) isFalse
  cmp r11, r7
  bhs isFalse
@ loads elemA one by one
  ldr r12, [r0, r11, lsl#2] @   elemA = matrixA[i + 1]
  add r11, #1               @   a++
@ if(elemA == elemB) whB else whA
  cmp r12, r9               @   if(elemA == elemB) {
  bne whA
@ initialize b, whB count here and create a tmp index for A
  mov r4, #0                @   b = 0
  mov r5, r11                @   tmpIndexA == a
@ need to sub from tmpIndexA bc it incremented already
  sub r5, r5, #1
@ this loop checks each elemA against corresponding elemB
whB:                        @   while(b < sizeB) {
@ if(b >= elemB) nextRow
  cmp r4, r3
  bhs nextRow
@ check elems
  ldr r12, [r0, r5, lsl#2]  @     elemA = word[addressA + (tmpIndexA * 4)]
  ldr r9, [r2, r8, lsl#2]   @     elemB = word[addressB + (n * 4)]
@ increment b, tmpIndexA, indexB
  add r4, r4, #1
  add r5, r5, #1
  add r8, r8, #1
@ if(elemA != elemB) whA
  cmp r12, r9               @     if(elemA == elemB) {
  bne whA                   @     }
@ else whB
  b whB                     @     else break      

isFalse:
  mov r0, #0                @ result = 0 (false)
  b end
@ increments tmpIndexA to next row of possible sub array
nextRow:
@ if(indexB >= sizeB^2) isTrue
 mul r4, r3, r3 @ r4 = sizeB^2
 cmp r8, r4
 bhs isTrue
@ increment tmpIndexA to next row, increment indexB
 add r5, r5, r1           @ indexA += sizeA
 sub r5, r5, r3           @ indexA -= sizeB
 add r8, r8, #1             @ indexB ++
 mov r4, #0 @ reinitialize counter b
 b whB

isTrue:
  mov r0, #1

end:
  @ End of program ... check your result

End_Main:
 BX    lr

