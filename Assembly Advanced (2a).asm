# input  : $a0, $a1
# output : $v0, $v1 (HI, LO)

main:

# INITIALIZE \ SETUP
addi $a0, $0, 5
addi $a1, $0, 6

# MULTIPLYING ARRAYS (a)
mult $a0, $a1
mfhi $v0
mflo $v1

j $ra