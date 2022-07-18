#define __SFR_OFFSET 0

#include "avr/io.h"

.global start
.global sevensegmentgo

start:
  ret

sevensegmentgo:
ldi r18, 0xEF
out DDRB, r18
ldi r18, 0x10
out PORTB, r18

ldi r19, 0xFF
out DDRD, r19
ldi r19, 0x0
out PORTD, r19

button:
  in r18, PINB
  andi r18, 0x10
  brne loop
  jmp button


ldi r17, 0x0

loop:
jmp zero

  zero:
    sbi PORTB, 0
    sbi PORTB, 1
    sbi PORTB, 2
    sbi PORTD, 2
    sbi PORTD, 3
    sbi PORTD, 4 
  call delay
  call clear 
    jmp one
  
  one:
    sbi PORTB, 2
    sbi PORTD, 4
  call delay
  call clear
    jmp two
  
  two:
    sbi PORTB, 0
    sbi PORTB, 1
    sbi PORTB, 3
    sbi PORTD, 4
    sbi PORTD, 3
  call delay
  call clear
    jmp three
  
  three:
    sbi PORTB, 0
    sbi PORTB, 1
    sbi PORTB, 3
    sbi PORTD, 2
    sbi PORTD, 3
  call delay
  call clear
    jmp four
  
  four:
    sbi PORTB, 2
    sbi PORTB, 1
    sbi PORTB, 3
    sbi PORTD, 2
  call delay
  call clear
    jmp five

  five:
    sbi PORTB, 0
    sbi PORTB, 2
    sbi PORTB, 3
    sbi PORTD, 2
    sbi PORTD, 3
  call delay
  call clear
    jmp six

  six:
    sbi PORTB, 0
    sbi PORTB, 2
    sbi PORTB, 3
    sbi PORTD, 2
    sbi PORTD, 3
    sbi PORTD, 4
  call delay
  call clear
    jmp seven

  seven:
    sbi PORTB, 0
    sbi PORTB, 1
    sbi PORTD, 2
  call delay
  call clear
    jmp eight
  
  eight:
    sbi PORTB, 0
    sbi PORTB, 1
    sbi PORTB, 2
    sbi PORTB, 3
    sbi PORTD, 2
    sbi PORTD, 3
    sbi PORTD, 4 
  call delay
  call clear 
    jmp nine

  nine:
    sbi PORTB, 0
    sbi PORTB, 1
    sbi PORTB, 2
    sbi PORTB, 3
    sbi PORTD, 2
  call delay
  call clear 
    jmp A
  
  A:
    sbi PORTB, 0
    sbi PORTB, 1
    sbi PORTB, 2
    sbi PORTB, 3
    sbi PORTD, 2
    sbi PORTD, 4 
  call delay
  call clear 
    jmp B

  B:
    sbi PORTB, 2
    sbi PORTB, 3
    sbi PORTD, 2
    sbi PORTD, 3
    sbi PORTD, 4 
  call delay
  call clear 
    jmp C
  
  C:
    sbi PORTB, 0
    sbi PORTB, 2
    sbi PORTD, 3
    sbi PORTD, 4 
  call delay
  call clear 
    jmp D

  D:
    sbi PORTB, 1
    sbi PORTB, 3
    sbi PORTD, 2
    sbi PORTD, 3
    sbi PORTD, 4  
  call delay
  call clear 
    jmp E

  E:
    sbi PORTB, 0
    sbi PORTB, 2
    sbi PORTB, 3
    sbi PORTD, 3
    sbi PORTD, 4  
  call delay
  call clear 
    jmp F

  F:
    sbi PORTB, 0
    sbi PORTB, 2
    sbi PORTB, 3
    sbi PORTD, 4   
  call delay
  call clear 
    jmp button

delay:
  ldi r22, 0xEA
  third_loop:
    ldi r21, 0x0
    outer_loop:
      ldi r20, 0x0
      inner_loop:
        mul r19, r19
        inc r20
        brne inner_loop
      inc r21
      brne outer_loop
    inc r22
    brne third_loop

clear:
  // A
  cbi PORTB, 0
  //B
  cbi PORTB, 1
  // F
  cbi PORTB, 2
  // G
  cbi PORTB, 3
  //C
  cbi PORTD, 2
  //D
  cbi PORTD, 3
  //E
  cbi PORTD, 4





