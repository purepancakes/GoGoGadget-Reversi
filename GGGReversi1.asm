.data
	EBox: .asciiz "[ ]"	# 0 in array
	XBox: .asciiz "[X]"	# 1 in array
	OBox: .asciiz "[0]"	# 2 in array
	Horizontal: .asciiz "  1  2  3  4  5  6  7  8\n"
	Array: .word 256
.text
	#initialize array to all 0Åfs, except for center

Init0:  la $s0, Array	#load array	
	li $t0, 1		#load count, start 1
	li $t1, 64		#load stopping value

ZeroInit: 	add $s0, $0, $0		#save 0 into array[i]
		addi $t0, $t0, 1	#increment count
	  	addi $s0, $s0, 4	#increment array
		bne $t0,$t1, ZeroInit	#if count is at 64, done
#initialize center four squares
		la $s0, Array
		addi $s0, $s0, 108	#load first location
		li $s0, 1
		addi $s0, $s0, 4	#load first location
		li $s0, 2		#load X into it.
		addi $s0, $s0, 28	#load first location
		li $s0, 2		#load O box
		addi $s0, $s0, 4 	#load first location
		li $s0, 1		#load X box
#initialization done
print:		la $a0, Horizontal #print horizontal
		li $v0, 4
		syscall
		li $t0, 6	# t0 is A, for printing
		li $t1, 72	# t1 is H, for when the loop ends
		la $s0, Array
		
printloop:  	lw $a0, $t0		#print character
		li $v0, 11		#11 is print character
		syscall
		
Exit:		li $v0, 10
syscall 



