$! This VAX DCL command file builds the Ada Generic Library
$! Lisp Processing Packages 
$! using the DEC ADA compiler and library support system.
$! The symbol LIBROOT should be a directory path to the root of the
$! Ada Generic Library, written without enclosing brackets (see README file)
$!
$ set verify
$! Build Part 1
$ @makelib1     ! create the library and sublibraries
$ @comp1	! compile the source code
$ @comptes1	! compile the test suite files  
$! Build Part 2
$ @makelib2     ! create the library and sublibraries
$ @comp2	! compile the source code
$ @comptes2	! compile the test suite files  
$ set noverify
