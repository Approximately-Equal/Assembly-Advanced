main:

# input  : $a0 = list of values (V), $a1 = length of list, $a2 = decay
# output : $v0 = decaying sum

# What does the function do?
# it starts from the list index i (of list V), and gives the variable rest the value 0
# it then adds V[i] + decay / rest, where / is integer division to rest, and moves to index i - 1
# repeat for all indices of V


# INITIALIZE / SETUP
add $a0, $sp, $0
addi $t0, $0, 0
sh $t0, 0($a0)
addi $t0, $0, 2
sh $t0, 2($a0)
addi $t0, $0, 1
sh $t0, 4($a0)

addi $a1, $0, 3
addi $a2, $0, 5


# DECAYING SUM
addi $t0, $a1, -1       # counter for index
add $t1, $0, $0         # rest
iterate: blt $t0, $0, return
div $t1, $a2
mflo $t2
sll $t3, $t0, 1         # bits from start of V (16 bit-2 bytes)
add $t3, $a0, $t3       # address of V[i]
lh $t3, 0($t3)          # V[i] (note that V[i] is 16 bit-half-word)
add $t1, $t3, $t2       # V[i] + ( rest / decay )
addi $t0, $t0, -1
j iterate

return:
add $v0, $t1, $0
j $ra
