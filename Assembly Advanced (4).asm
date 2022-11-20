main:

# input  : $a0, $a1 = double (float), $a2 list of doubles (floats), $a3 = length
# output : $a0, $a1 = sum of $a0 + $a2[i] for all i < length, $v0 = exponent encoding

# INITIALIZE / SETUP



# EXPONENT ENCODING
add $t0, $0, $0
iterate: beq $t0, $a3, return
mtc1 $a0, $f0
mtc1 $a1, $f1

sll $t1, $t0, 3
add $t1, $a2, $t1
l.d $f2, 0($t1)
add.d $a0, $f0, $f2

addi $t0, $t0, 1
j iterate

return:
andi $v0, $a0, 0x7FF00000
# this will grab the 11 bits of the exponent from $a0, $a1
# and since the exponent is 11 bits, we can just look at $a0
sll $v0, $v0, 20    # shift 20 bits so that exponent is aligned to the LSB