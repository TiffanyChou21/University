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
# expr.v
# YACC verbose file generated from expr.y.
# 
# Date: 10/14/19
# Time: 02:31:17
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : lines $end

    1  lines : lines expr ';'
    2        | lines ';'
    3        |

    4  expr : expr ADD expr
    5       | expr SUB expr
    6       | expr MUL expr
    7       | expr DIV expr
    8       | LP expr RP
    9       | SUB expr
   10       | NUMBER


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
	lines : lines . expr ';'
	lines : lines . ';'

	$end  accept
	';'  shift 2
	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5

	expr  goto 6


state 2
	lines : lines ';' .  (2)

	.  reduce 2


state 3
	expr : NUMBER .  (10)

	.  reduce 10


state 4
	expr : SUB . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5

	expr  goto 7


state 5
	expr : LP . expr RP

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5

	expr  goto 8


state 6
	lines : lines expr . ';'
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	';'  shift 9
	ADD  shift 10
	SUB  shift 11
	MUL  shift 12
	DIV  shift 13


state 7
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : SUB expr .  (9)

	.  reduce 9


state 8
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : LP expr . RP

	ADD  shift 10
	SUB  shift 11
	MUL  shift 12
	DIV  shift 13
	RP  shift 14


state 9
	lines : lines expr ';' .  (1)

	.  reduce 1


state 10
	expr : expr ADD . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5

	expr  goto 15


state 11
	expr : expr SUB . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5

	expr  goto 16


state 12
	expr : expr MUL . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5

	expr  goto 17


state 13
	expr : expr DIV . expr

	NUMBER  shift 3
	SUB  shift 4
	LP  shift 5

	expr  goto 18


state 14
	expr : LP expr RP .  (8)

	.  reduce 8


state 15
	expr : expr ADD expr .  (4)
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 12
	DIV  shift 13
	.  reduce 4


state 16
	expr : expr . ADD expr
	expr : expr SUB expr .  (5)
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 12
	DIV  shift 13
	.  reduce 5


state 17
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr MUL expr .  (6)
	expr : expr . MUL expr
	expr : expr . DIV expr

	.  reduce 6


state 18
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr DIV expr .  (7)
	expr : expr . DIV expr

	.  reduce 7


##############################################################################
# Summary
##############################################################################

11 token(s), 3 nonterminal(s)
11 grammar rule(s), 19 state(s)


##############################################################################
# End of File
##############################################################################
