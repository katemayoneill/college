  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 7

  @
  @ TIP: To view memory when debugging your program you can ...
  @
  @   Add the watch expression to see individual characters: (char[64])newString
  @
  @   OR
  @
  @   Add the watch expression to see the string: (char*)&newString
  @
  @   OR
  @
  @   Open a 'Memory View' specifying the address &newString and length at
  @   least 128. You can open a Memory View with ctrl-shift-p type
  @   'View Memory' (cmd-shift-p on a Mac).
  
  @ this might b completly wrong might just need a good bitmaniplautioon not sure

  @ start w first character if its uppercase, flip it.. copy it to r0
  @ then every caracter after that wornking 1 by 1 if its uppercase flip to lowercase and copy to r0
  @ if its lowercase leave it alone
  @ if its a non alphabetical character, do not copy and go to next alphabetical character
  @ if the next alphabetical caracter is lowercase, flip to uppercase. otherwise, just copy it
  @ continue until null
  
  
WhileNotNull:
  LDR   R2, [R1]
  CMP   R2, 0x00
  BEQ   End
  LDR   R2, [R1]
  CMP   R2, 0x41
  BLO   isSymbol
  CMP   R2, 0x7A
  BHI   isSymbol
  CMP   R2, 0x5A
  BLO   isMaj
  CMP   R2, 0x61
  BHI   isMin

isMaj:
  ADD   R2, R2, 0x20
  STR   R2, [R0] 
  ADD   R1, R1, #4
  ADD   R0, R0, #4
  B     WhileNotNull

isMin: 
  STR   R2, [R0] 
  ADD   R1, R1, #4
  ADD   R0, R0, #4
  B     WhileNotNull

isSymbol: 
  ADD   R1, R1, #4
  ADD   R0, R0, #4
  LDR   R2, [R1]
  CMP   R2, 0x41
  BLO   isSymbol
  CMP   R2, 0x7A
  BHI   isSymbol
  CMP   R2, 0x5A
  BHI   isStart
  CMP   R2, 0x61
  BHI   isStart
  B isSymbol

isStart:
  CMP R2, 0x5A
  BLO isMaj2
  SUB R2, R2, 0x20
  STR R2, [R0]
  ADD R1, R1, #4
  ADD R0, R0, #4
  B WhileNotNull

isMaj2:
  STR R2, [R0]
  ADD R1, R1, #4
  ADD R0, R0, #4
  B WhileNotNull

End:

End_Main:
  BX    lr
