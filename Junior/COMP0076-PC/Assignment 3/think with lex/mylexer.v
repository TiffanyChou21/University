#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 28 of your 30 day trial period.
# 
# This file was produced by an UNREGISTERED COPY of Parser Generator. It is
# for evaluation purposes only. If you continue to use Parser Generator 30
# days after installation then you are required to purchase a license. For
# more information see the online help or go to the Bumble-Bee Software
# homepage at:
# 
# http://www.bumblebeesoftware.com
# 
# This notice must remain present in the file. It cannot be removed.
#############################################################################

#############################################################################
# mylexer.v
# Lex verbose file generated from mylexer.l.
# 
# Date: 10/14/19
# Time: 07:56:02
# 
# ALex Version: 2.07
#############################################################################


#############################################################################
# Expressions
#############################################################################

    1  [ \t\n]+

    2  "+"

    3  "-"

    4  "*"

    5  "/"

    6  "("

    7  ")"

    8  "="

    9  ";"

   10  [a-zA-Z_]([a-zA-Z_]|[0-9])*

   11  [0-9]+(\.[0-9]+)?


#############################################################################
# States
#############################################################################

state 1
	INITIAL

	0x09 - 0x0a (2)    goto 3
	0x20               goto 3
	0x28               goto 4
	0x29               goto 5
	0x2a               goto 6
	0x2b               goto 7
	0x2d               goto 8
	0x2f               goto 9
	0x30 - 0x39 (10)   goto 10
	0x3b               goto 11
	0x3d               goto 12
	0x41 - 0x5a (26)   goto 13
	0x5f               goto 13
	0x61 - 0x7a (26)   goto 13


state 2
	^INITIAL

	0x09 - 0x0a (2)    goto 3
	0x20               goto 3
	0x28               goto 4
	0x29               goto 5
	0x2a               goto 6
	0x2b               goto 7
	0x2d               goto 8
	0x2f               goto 9
	0x30 - 0x39 (10)   goto 10
	0x3b               goto 11
	0x3d               goto 12
	0x41 - 0x5a (26)   goto 13
	0x5f               goto 13
	0x61 - 0x7a (26)   goto 13


state 3
	0x09 - 0x0a (2)    goto 3
	0x20               goto 3

	match 1


state 4
	match 6


state 5
	match 7


state 6
	match 4


state 7
	match 2


state 8
	match 3


state 9
	match 5


state 10
	0x2e               goto 14
	0x30 - 0x39 (10)   goto 10

	match 11


state 11
	match 9


state 12
	match 8


state 13
	0x30 - 0x39 (10)   goto 13
	0x41 - 0x5a (26)   goto 13
	0x5f               goto 13
	0x61 - 0x7a (26)   goto 13

	match 10


state 14
	0x30 - 0x39 (10)   goto 15


state 15
	0x30 - 0x39 (10)   goto 15

	match 11


#############################################################################
# Summary
#############################################################################

1 start state(s)
11 expression(s), 15 state(s)


#############################################################################
# End of File
#############################################################################
