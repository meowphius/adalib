$! This DCL command file compiles all of the code for
$! Part 1 of the Ada Generic Library List Processing Packages
$! The symbol libroot should be a directory path to the root of the
$! Ada Generic Library, written without enclosing brackets
$ set verify
$ acs set library ['libroot.part1.library]
$ ada/list linkexc
$ ada/list examhelp
$! linked-list algorithms
$ ada/list lnkalgs 
$ ada/list lnkalgb 
$! singly-linked lists
$ ada/list snglnks
$ ada/list snglnkb
$! system-allocated
$ ada/list sasls   
$ ada/list saslb   
$ ada/list saslpip
$! user-allocated singly-linked
$ ada/list uasls
$ ada/list uaslb
$ ada/list uaslpip
$! auto-reallocating singly-linked
$ ada/list arsls
$ ada/list arslb
$ ada/list arslpip
$ set noverify
