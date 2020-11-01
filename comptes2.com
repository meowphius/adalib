$! Compile the test suite files for Part 2 in separate sublibraries
$! The symbol libroot should be a directory path to the root of the
$! Ada Generic Library, written without enclosing brackets
$ set verify
$ acs set library ['libroot.part2.testdel]    ! a sublibrary 
$ ada/list delt
$ acs set library ['libroot.part2.teststack]    ! a sublibrary 
$ ada/list stackt
$ acs set library ['libroot.part2.testoutdeq]    ! a sublibrary 
$ ada/list outdeqt
$ set noverify
