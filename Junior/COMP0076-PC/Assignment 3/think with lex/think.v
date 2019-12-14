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
# think.v
# YACC verbose file generated from think.y.
# 
# Date: 10/14/19
# Time: 07:56:02
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : lines $end

    1  lines : lines expr EOL
    2        | lines EOL
    3        |

    4  expr : expr ADD expr
    5       | expr SUB expr
    6       | expr MUL expr
    7       | expr DIV expr
    8       | LP expr RP
    9       | '-' expr
   10       | NUMBER
   11       | ID
   12       | ID ASSIGN expr


##############################################################################
# States
##############################################################################

state 0
	$accept : . lines $end
	lines : .  (3)

	.  reduce 3

	lines  goto 1


state 1
	$accept : lines . $end  (0)
	lines : lines . expr EOL
	lines : lines . EOL

	$end  accept
	'-'  shift 2
	NUMBER  shift 3
	ID  shift 4
	LP  shift 5
	EOL  shift 6

	expr  goto 7


state 2
	expr : '-' . expr

	'-'  shift 2
	NUMBER  shift 3
	ID  shift 4
	LP  shift 5

	expr  goto 8


state 3
	expr : NUMBER .  (10)

	.  reduce 10


state 4
	expr : ID .  (11)
	expr : ID . ASSIGN expr

	ASSIGN  shift 9
	.  reduce 11


state 5
	expr : LP . expr RP

	'-'  shift 2
	NUMBER  shift 3
	ID  shift 4
	LP  shift 5

	expr  goto 10


state 6
	lines : lines EOL .  (2)

	.  reduce 2


state 7
	lines : lines expr . EOL
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	ADD  shift 11
	SUB  shift 12
	MUL  shift 13
	DIV  shift 14
	EOL  shift 15


state 8
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : '-' expr .  (9)

	.  reduce 9


state 9
	expr : ID ASSIGN . expr

	'-'  shift 2
	NUMBER  shift 3
	ID  shift 4
	LP  shift 5

	expr  goto 16


state 10
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : LP expr . RP

	ADD  shift 11
	SUB  shift 12
	MUL  shift 13
	DIV  shift 14
	RP  shift 17


state 11
	expr : expr ADD . expr

	'-'  shift 2
	NUMBER  shift 3
	ID  shift 4
	LP  shift 5

	expr  goto 18


state 12
	expr : expr SUB . expr

	'-'  shift 2
	NUMBER  shift 3
	ID  shift 4
	LP  shift 5

	expr  goto 19


state 13
	expr : expr MUL . expr

	'-'  shift 2
	NUMBER  shift 3
	ID  shift 4
	LP  shift 5

	expr  goto 20


state 14
	expr : expr DIV . expr

	'-'  shift 2
	NUMBER  shift 3
	ID  shift 4
	LP  shift 5

	expr  goto 21


state 15
	lines : lines expr EOL .  (1)

	.  reduce 1


16: shift-reduce conflict (shift 11, reduce 12) on ADD
16: shift-reduce conflict (shift 12, reduce 12) on SUB
16: shift-reduce conflict (shift 13, reduce 12) on MUL
16: shift-reduce conflict (shift 14, reduce 12) on DIV
state 16
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : ID ASSIGN expr .  (12)

	ADD  shift 11
	SUB  shift 12
	MUL  shift 13
	DIV  shift 14
	.  reduce 12


state 17
	expr : LP expr RP .  (8)

	.  reduce 8


state 18
	expr : expr ADD expr .  (4)
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 13
	DIV  shift 14
	.  reduce 4


state 19
	expr : expr . ADD expr
	expr : expr SUB expr .  (5)
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 13
	DIV  shift 14
	.  reduce 5


state 20
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr MUL expr .  (6)
	expr : expr . MUL expr
	expr : expr . DIV expr

	.  reduce 6


state 21
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr DIV expr .  (7)
	expr : expr . DIV expr

	.  reduce 7


##############################################################################
# Summary
##############################################################################

State 16 contains 4 shift-reduce conflict(s)


14 token(s), 3 nonterminal(s)
13 grammar rule(s), 22 state(s)


##############################################################################
# End of File
##############################################################################
