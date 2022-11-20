# input  : $a0 = array1, $a1 = array2, $a2 = array3, $a4 = length of arrays 
# output : no change in output, but values in a3 with be changed

main:

# INITIALIZE \ SETUP
add $a0, $0, $sp
addi $a1, $a0, 64
addi $a2, $a1, 64
addi $a3, $0, 2

addi $t0, $0, 3
addi $t1, $0, 2
sw $t0, 0($a0)
sw $t1, 4($a0)

addi $t0, $0, 6
addi $t1, $0, 5
sw $t0, 0($a1)
sw $t1, 4($a1)

add $t0, $0, $0
add $t1, $0, $0



# MULTIPLYING ARRAYS (a)
add $t0, $0, $0
iterate: beq $t0, $a3, return
sll $t1, $t0, 2     # 32 (current index)

add $t2, $a0, $t1   # address of a1[i]
lw $t4, 0($t2)      # value of a1[i]
add $t2, $a1, $t1   # address of a2[i]
lw $t5, 0($t2)      # value of a2[i]

mult $t4, $t5
mfhi $t6
mflo $t7

sll $t1, $t1, 1     # 64 (current index)
add $t2, $a2, $t1   # address of a3[i]
sw $t6, 0($t2)
sw $t7, 4($t2)

addi $t0, $t0, 1
j iterate

return:
lw $v0, 8($a2)
lw $v1, 12($a2)

j $ra
