$! Create sublibrary for Part 2 and sublibraries for tests.
$! Note that the Part 2 library is a sublibrary of the Part 1 library.
$! The symbol libroot should be a directory path to the root of the
$! Ada Generic Library, written without enclosing brackets.
$ acs set library ['libroot.part1.library]
$ acs create sublibrary ['libroot.part2.library]
$ acs set library ['libroot.part2.library]
$ acs create sublibrary ['libroot.part2.testdel]
$ acs create sublibrary ['libroot.part2.teststack]
$ acs create sublibrary ['libroot.part2.testoutdeq]
