$! Create library for Part 1 and sublibraries for tests
$! The symbol libroot should be a directory path to the root of the
$! Ada Generic Library, written without enclosing brackets
$ acs create library ['libroot.part1.library]
$ acs set library ['libroot.part1.library]
$ acs create sublibrary ['libroot.part1.testsasl]
$ acs create sublibrary ['libroot.part1.testuasl]
$ acs create sublibrary ['libroot.part1.testarsl]
