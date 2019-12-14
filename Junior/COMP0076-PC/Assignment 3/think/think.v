#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 29 of your 30 day trial period.
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
# Date: 10/15/19
# Time: 09:46:52
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : stmt $end

    1  stmt : stmt assign_stmt EOL
    2       | stmt expr EOL
    3       | stmt EOL
    4       | stmt ID EOL
    5       |

    6  assign_stmt : ID ASSIGN expr

    7  expr : expr ADD expr
    8       | expr SUB expr
    9       | expr MUL expr
   10       | expr DIV expr
   11       | LP expr RP
   12       | SUB expr
   13       | NUMBER
   14       | ID


##############################################################################
# States
##############################################################################

state 0
	$accept : . stmt $end
	stmt : .  (5)

	.  reduce 5

	stmt  goto 1


state 1
	$accept : stmt . $end  (0)
	stmt : stmt . assign_stmt EOL
	stmt : stmt . expr EOL
	stmt : stmt . EOL
	stmt : stmt . ID EOL

	$end  accept
	NUMBER  shift 2
	ID  shift 3
	SUB  shift 4
	LP  shift 5
	EOL  shift 6

	assign_stmt  goto 7
	expr  goto 8


state 2
	expr : NUMBER .  (13)

	.  reduce 13


3: shift-reduce conflict (shift 10, reduce 14) on EOL
state 3
	stmt : stmt ID . EOL
	assign_stmt : ID . ASSIGN expr
	expr : ID .  (14)

	ASSIGN  shift 9
	EOL  shift 10
	.  reduce 14


state 4
	expr : SUB . expr

	NUMBER  shift 2
	ID  shift 11
	SUB  shift 4
	LP  shift 5

	expr  goto 12


state 5
	expr : LP . expr RP

	NUMBER  shift 2
	ID  shift 11
	SUB  shift 4
	LP  shift 5

	expr  goto 13


state 6
	stmt : stmt EOL .  (3)

	.  reduce 3


state 7
	stmt : stmt assign_stmt . EOL

	EOL  shift 14


state 8
	stmt : stmt expr . EOL
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	ADD  shift 15
	SUB  shift 16
	MUL  shift 17
	DIV  shift 18
	EOL  shift 19


state 9
	assign_stmt : ID ASSIGN . expr

	NUMBER  shift 2
	ID  shift 11
	SUB  shift 4
	LP  shift 5

	expr  goto 20


state 10
	stmt : stmt ID EOL .  (4)

	.  reduce 4


state 11
	expr : ID .  (14)

	.  reduce 14


state 12
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : SUB expr .  (12)

	.  reduce 12


state 13
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : LP expr . RP

	ADD  shift 15
	SUB  shift 16
	MUL  shift 17
	DIV  shift 18
	RP  shift 21


state 14
	stmt : stmt assign_stmt EOL .  (1)

	.  reduce 1


state 15
	expr : expr ADD . expr

	NUMBER  shift 2
	ID  shift 11
	SUB  shift 4
	LP  shift 5

	expr  goto 22


state 16
	expr : expr SUB . expr

	NUMBER  shift 2
	ID  shift 11
	SUB  shift 4
	LP  shift 5

	expr  goto 23


state 17
	expr : expr MUL . expr

	NUMBER  shift 2
	ID  shift 11
	SUB  shift 4
	LP  shift 5

	expr  goto 24


state 18
	expr : expr DIV . expr

	NUMBER  shift 2
	ID  shift 11
	SUB  shift 4
	LP  shift 5

	expr  goto 25


state 19
	stmt : stmt expr EOL .  (2)

	.  reduce 2


state 20
	assign_stmt : ID ASSIGN expr .  (6)
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	ADD  shift 15
	SUB  shift 16
	MUL  shift 17
	DIV  shift 18
	.  reduce 6


state 21
	expr : LP expr RP .  (11)

	.  reduce 11


state 22
	expr : expr ADD expr .  (7)
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 17
	DIV  shift 18
	.  reduce 7


state 23
	expr : expr . ADD expr
	expr : expr SUB expr .  (8)
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 17
	DIV  shift 18
	.  reduce 8


state 24
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr MUL expr .  (9)
	expr : expr . MUL expr
	expr : expr . DIV expr

	.  reduce 9


state 25
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr DIV expr .  (10)
	expr : expr . DIV expr

	.  reduce 10


##############################################################################
# Summary
##############################################################################

State 3 contains 1 shift-reduce conflict(s)


13 token(s), 4 nonterminal(s)
15 grammar rule(s), 26 state(s)


##############################################################################
# End of File
##############################################################################
