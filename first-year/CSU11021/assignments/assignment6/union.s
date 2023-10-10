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

 
 @ Copy every element from A into C

  LDR   R3, [R1]      @ sizeA = word[adrA]
  ADD   R1, R1, #4    @ adrA += 4
  ADD   R7, R0, #4    @ tmpAdrC = adrC + 4 // leave space for size
  MOV   R4, #0        @ sizeC = 0
  MOV   R5, #0        @ count = 0
WhCpyA:
  CMP   R5, R3        @ while (count < sizeA)
  BHS   EndWhCpyA     @ {
  LDR   R6, [R1]      @   elem = word[adrA]

  STR   R6, [R7]      @   word[adrC] = elem
  ADD   R7, R7, #4    @   adrC += 4
  ADD   R4, R4, #1    @   sizeC++

  ADD   R1, R1, #4    @   adrA += 4
  ADD   R5, R5, #1    @   count++
  B     WhCpyA        @ }
EndWhCpyA:

@ For every element in B that is not already
@ in C, copy it into C

  @ REST OF YOUR PROGRAM GOES HERE!!!
  MOV   R9, #2
  MOV   R10, #4
  MUL   R11, R9, R10
  MUL   R5, R11
  SUB   R2, R2, R5 

  LDR   R8, [R2]      @ sizeB = word[adrB]
  ADD   R2, R2, #4    @ adrB += 4
  ADD   R2, R0, #4    @ tmpAdrC = adrC + 4 // leave space for size
  MOV   R5, #0        @ count = 0
WhCpyB:
  CMP   R5, R8        @ while (count < sizeB)
  BHS   EndWhCpyB     @ {
  LDR   R6, [R2]      @   elem = word[adrB]

  STR   R6, [R7]      @   word[adrC] = elem
  ADD   R7, R7, #4    @   adrC += 4
  ADD   R4, R4, #1    @   sizeC++

  ADD   R2, R2, #4    @   adrB += 4
  ADD   R5, R5, #1    @   count++
  B     WhCpyB        @ }
EndWhCpyB:
@ Store the final size of C in memory
  STR   R4, [R0]      @ word[adrC] = sizeC
  
  @ End of program ... check your result

  @ End of program ... check your result


End_Main:
  BX    lr