$! Compile the test suite files for Part 1 in separate sublibraries
$! The symbol LIBROOT should be a directory path to the root of the
$! Ada Generic Library, written without enclosing brackets
$ set verify
$ acs set library ['libroot.part1.testsasl]    ! a sublibrary 
$ ada/list snglnkt
$ acs set library ['libroot.part1.testuasl]    ! a sublibrary
$ ada/list snglnkt1
$ acs set library ['libroot.part1.testarsl]    ! a sublibrary
$ ada/list snglnkt2
$ set noverify
