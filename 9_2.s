.data
A: .float 1.0, 2.0, 1.0, 1.0, 2.0, 1.0, 1.0, 2.0, 1.0
B: .float 2.0, 1.0, 2.0, 2.0, 1.0, 2.0, 2.0, 1.0, 2.0
C: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
.text
main:
	li	$s1,9
	li	$s2,1
	la	$t0,A
	la	$t1,B
	la	$t2,C

loop:
	bgt	   $s2,$s1,exit
	l.f	   $f0,0($t0)
	l.f	   $f1,0($t1)
	addi   $t0,$t0,4
	addi   $t1,$t1,4
	add.f  $f2,$f0,$f1
	s.f	   $f2,0($t2)
	addi   $t2,$t2,4
	addi   $s2,$s2,1
	j	   loop

exit:
	la	$a0,C
	li	$v0,4
	syscall
	jr	$31