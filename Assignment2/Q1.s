.data
    array:      .word 1, 5, 3, 7, 2, 9, 4, 8, 6, 10, 11, 15, 13, 17, 12, 19, 14, 18, 16, 10
    N:          .word 20
    info:       .asciiz "MIPS 32 Assembly"
    high:       .asciiz "\n highest Value: "
    high_ind:   .asciiz "\n index of highest Value: "
    low:        .asciiz "\n lowest Value: "
    low_ind:    .asciiz "\n index of lowest Value: "
    avg:        .asciiz "\n avarage Value: "


.text
.globl main

main:

    la $t0, array   
    lw $t1, N    
    li $t2, 0           # counter for loop
    lw $t3, 0($t0)       # highest value            
    li $t4, 0           # index of highest value          
    lw $t5, 0($t0)       # lowest value             
    li $t6, 0           # index of lowest value          
    li $t7, 0           # avarage value
    


loop:

    beq $t2, $t1, endLoop

    lw $t8, 0($t0)

    bgt $t8, $t3, updateMax
    
    blt $t8, $t5, updateMin
    
    add $t7, $t7, $t8

    addi $t2, $t2, 1
    addi $t0, $t0, 4
    
    j loop

updateMax:
    move $t3, $t8
    move $t4, $t2

    j loop

updateMin:
    move $t5, $t8
    move $t6, $t2

    j loop
    
endLoop:

    li $v0, 4           
    la $a0, info
    syscall

    li $v0, 4           
    la $a0, high
    syscall
    
    li $v0, 1           
    move $a0, $t3       
    syscall
    
    li $v0, 4           
    la $a0, high_ind
    syscall
    
    li $v0, 1           
    move $a0, $t4       
    syscall
    
    li $v0, 4           
    la $a0, low
    syscall
    
    li $v0, 1           
    move $a0, $t5       
    syscall
    
    li $v0, 4           
    la $a0, low_ind
    syscall
    
    li $v0, 1           
    move $a0, $t6       
    syscall
    
    li $v0, 4           
    la $a0, avg
    syscall
        
    div $t7, $t7, $t1      

    li $v0, 1           
    move $a0, $t7       
    syscall
    
    li $v0, 10          
    syscall
