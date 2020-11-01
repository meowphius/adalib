$! This VAX DCL command file compiles all of the code for
$! Part 2 of the Ada Generic Library 
$! List Processing Packages (assuming the Part 1 code
$! has been compiled already)
$! The symbol libroot should be a directory path to the root of the
$! Ada Generic Library, written without enclosing brackets
$ set verify
$ acs set library ['libroot.part2.library]
$! Double-ended lists
$ ada/list dels
$ ada/list delb
$ ada/list delpip1
$ ada/list delpip2
$ ada/list delpip3
$! Stacks
$ ada/list stacks
$ ada/list stackb
$ ada/list stackp1
$ ada/list stackp2
$ ada/list stackp3
$! Output-restricted deques
$ ada/list outdeqs
$ ada/list outdeqb
$ ada/list outdeqp1
$ ada/list outdeqp2
$ ada/list outdeqp3
$ set noverify
