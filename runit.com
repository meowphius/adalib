$ assign 'p1.out sys$output
$ run 'p1
$ deassign sys$output
$ type/page 'p1.out
