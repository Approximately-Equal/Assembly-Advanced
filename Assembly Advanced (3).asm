.data
JUMP_TABLE: .word sunday, monday, tuesday, wednesday, thursday, friday, saturday
.text

main:

# INITIALIZE \ SETUP
add $a0, $sp, $0        # address of day (return string)
addi $a1, $0, 4         # encoded day (sun - sat as 0 - 6)


# DAY OF THE WEEK
# check that enum is in range (0 - 6)
slt $t0, $a1, $0
bne $t0, $0, fail 
slti $t0, $a1, 7
beq $t0, $0, fail

# if it is in range, go to correct address in jump table
sll $t0, $a1, 2
la $t1 JUMP_TABLE
add $t1, $t1, $t0
lw $t1, 0($t1)
jr $t1

sunday:
# write sunday in ascii
addi $t4, $0, 115
lw $t4, 0($a0)
addi $t4, $0, 117
lw $t4, 4($a0)
addi $t4, $0, 110
lw $t4, 8($a0)
addi $t4, $0, 100
lw $t4, 12($a0)
addi $t4, $0, 97
lw $t4, 16($a0)
addi $t4, $0, 121
lw $t4, 20($a0)
addi $t4, $0, 0
lw $t4, 24($a0)
j success

monday:
# write monday in ascii
addi $t4, $0, 109
lw $t4, 0($a0)
addi $t4, $0, 111
lw $t4, 4($a0)
addi $t4, $0, 110
lw $t4, 8($a0)
addi $t4, $0, 100
lw $t4, 12($a0)
addi $t4, $0, 97
lw $t4, 16($a0)
addi $t4, $0, 121
lw $t4, 20($a0)
addi $t4, $0, 0
lw $t4, 24($a0)
j success

tuesday:
# write tuesday in ascii
addi $t4, $0, 116
lw $t4, 0($a0)
addi $t4, $0, 117
lw $t4, 4($a0)
addi $t4, $0, 101
lw $t4, 8($a0)
addi $t4, $0, 115
lw $t4, 12($a0)
addi $t4, $0, 100
lw $t4, 16($a0)
addi $t4, $0, 97
lw $t4, 20($a0)
addi $t4, $0, 121
lw $t4, 24($a0)
addi $t4, $0, 0
lw $t4, 28($a0)
j success

wednesday:
# write wednesday in ascii
addi $t4, $0, 119
lw $t4, 0($a0)
addi $t4, $0, 101
lw $t4, 4($a0)
addi $t4, $0, 100
lw $t4, 8($a0)
addi $t4, $0, 110
lw $t4, 12($a0)
addi $t4, $0, 101
lw $t4, 16($a0)
addi $t4, $0, 115
lw $t4, 20($a0)
addi $t4, $0, 100
lw $t4, 24($a0)
addi $t4, $0, 97
lw $t4, 28($a0)
addi $t4, $0, 121
lw $t4, 32($a0)
addi $t4, $0, 0
lw $t4, 36($a0)
j success

thursday:
# write thursday in ascii
addi $t4, $0, 116
lw $t4, 0($a0)
addi $t4, $0, 104
lw $t4, 4($a0)
addi $t4, $0, 117
lw $t4, 8($a0)
addi $t4, $0, 114
lw $t4, 12($a0)
addi $t4, $0, 115
lw $t4, 16($a0)
addi $t4, $0, 100
lw $t4, 20($a0)
addi $t4, $0, 97
lw $t4, 24($a0)
addi $t4, $0, 121
lw $t4, 28($a0)
addi $t4, $0, 0
lw $t4, 32($a0)
j success

friday:
# write friday in ascii
addi $t4, $0, 102
lw $t4, 0($a0)
addi $t4, $0, 114
lw $t4, 4($a0)
addi $t4, $0, 105
lw $t4, 8($a0)
addi $t4, $0, 100
lw $t4, 12($a0)
addi $t4, $0, 97
lw $t4, 16($a0)
addi $t4, $0, 121
lw $t4, 20($a0)
addi $t4, $0, 0
lw $t4, 24($a0)
j success

saturday:
# write saturday in ascii
addi $t4, $0, 115
lw $t4, 0($a0)
addi $t4, $0, 97
lw $t4, 4($a0)
addi $t4, $0, 116
lw $t4, 8($a0)
addi $t4, $0, 117
lw $t4, 12($a0)
addi $t4, $0, 114
lw $t4, 16($a0)
addi $t4, $0, 100
lw $t4, 20($a0)
addi $t4, $0, 97
lw $t4, 24($a0)
addi $t4, $0, 121
lw $t4, 28($a0)
addi $t4, $0, 0
lw $t4, 32($a0)
j success

success:
addi $v0, $0, 1
j $ra

fail:
addi $v0, $0, 0
j $ra

