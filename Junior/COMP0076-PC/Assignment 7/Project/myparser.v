#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 94 of your 30 day trial period.
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
# myparser.v
# YACC verbose file generated from myparser.y.
# 
# Date: 12/19/19
# Time: 20:34:12
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : start $end

    1  start : codes

    2  codes : funs

    3  funs : fun_decl funs
    4       | fun_decl

    5  fun_decl : vartype ID LP args RP comp_stmt
    6           | vartype ID LP RP comp_stmt
    7           | MAIN LP RP comp_stmt
    8           | VOID MAIN LP RP comp_stmt
    9           | INT MAIN LP RP comp_stmt

   10  args : vartype ID COMMA args
   11       | vartype ID

   12  comp_stmt : LB stmts RB
   13            | LB RB

   14  stmts : stmt stmts
   15        | stmt

   16  stmt : comp_stmt
   17       | expr SEMI
   18       | varstmt
   19       | ifstmt
   20       | whilestmt
   21       | forstmt
   22       | returnstmt
   23       | inputstmt
   24       | outputstmt
   25       | SEMI

   26  varstmt : vartype idlist SEMI

   27  vartype : INT
   28          | CHAR
   29          | VOID
   30          | BOOL
   31          | FLOAT
   32          | DOUBLE

   33  idlist : expr COMMA idlist
   34         | expr

   35  expr : assign_expr

   36  assign_expr : ID ASSIGN expr
   37              | array ASSIGN expr
   38              | or_expr

   39  or_expr : or_expr OR and_expr
   40          | and_expr

   41  and_expr : and_expr AND bor_expr
   42           | bor_expr

   43  bor_expr : bor_expr BOR xor_expr
   44           | xor_expr

   45  xor_expr : xor_expr XOR band_expr
   46           | band_expr

   47  band_expr : band_expr BAND equal_expr
   48            | equal_expr

   49  equal_expr : equal_expr EQ sh_expr
   50             | equal_expr NE sh_expr
   51             | equal_expr GE sh_expr
   52             | equal_expr LE sh_expr
   53             | equal_expr GT sh_expr
   54             | equal_expr LT sh_expr
   55             | sh_expr

   56  sh_expr : sh_expr SHL simp_expr
   57          | sh_expr SHR simp_expr
   58          | simp_expr

   59  simp_expr : simp_expr ADD simp_expr2
   60            | simp_expr SUB simp_expr2
   61            | simp_expr2

   62  simp_expr2 : simp_expr2 MUL term
   63             | simp_expr2 DIV term
   64             | simp_expr2 MOD term
   65             | simp_expr2 INC
   66             | simp_expr2 DEC
   67             | term

   68  term : LP expr RP
   69       | ID
   70       | NUMBER
   71       | NOT term
   72       | OPPSITE term
   73       | CHARVAL
   74       | ENDL
   75       | array
   76       | func_call

   77  array : ID LSP expr RSP

   78  func_call : ID LP idlist RP
   79            | ID LP RP

   80  ifstmt : IF LP expr RP stmt
   81         | IF LP expr RP stmt ELSE stmt

   82  forstmt : FOR LP expr SEMI expr SEMI expr RP stmt
   83          | FOR LP SEMI expr SEMI RP stmt
   84          | FOR LP expr SEMI SEMI RP stmt
   85          | FOR LP SEMI SEMI expr RP stmt
   86          | FOR LP expr SEMI expr SEMI RP stmt
   87          | FOR LP expr SEMI SEMI expr RP stmt
   88          | FOR LP SEMI expr SEMI expr RP stmt
   89          | FOR LP SEMI SEMI RP stmt

   90  whilestmt : WHILE LP expr RP stmt

   91  inputstmt : CIN SHR expr SEMI

   92  outputstmt : COUT SHL expr SEMI

   93  returnstmt : RETURN expr SEMI


##############################################################################
# States
##############################################################################

state 0
	$accept : . start $end

	INT  shift 1
	CHAR  shift 2
	VOID  shift 3
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	MAIN  shift 7

	fun_decl  goto 8
	start  goto 9
	codes  goto 10
	funs  goto 11
	vartype  goto 12


state 1
	fun_decl : INT . MAIN LP RP comp_stmt
	vartype : INT .  (27)

	MAIN  shift 13
	.  reduce 27


state 2
	vartype : CHAR .  (28)

	.  reduce 28


state 3
	fun_decl : VOID . MAIN LP RP comp_stmt
	vartype : VOID .  (29)

	MAIN  shift 14
	.  reduce 29


state 4
	vartype : BOOL .  (30)

	.  reduce 30


state 5
	vartype : FLOAT .  (31)

	.  reduce 31


state 6
	vartype : DOUBLE .  (32)

	.  reduce 32


state 7
	fun_decl : MAIN . LP RP comp_stmt

	LP  shift 15


state 8
	funs : fun_decl . funs
	funs : fun_decl .  (4)

	INT  shift 1
	CHAR  shift 2
	VOID  shift 3
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	MAIN  shift 7
	.  reduce 4

	fun_decl  goto 8
	funs  goto 16
	vartype  goto 12


state 9
	$accept : start . $end  (0)

	$end  accept


state 10
	start : codes .  (1)

	.  reduce 1


state 11
	codes : funs .  (2)

	.  reduce 2


state 12
	fun_decl : vartype . ID LP args RP comp_stmt
	fun_decl : vartype . ID LP RP comp_stmt

	ID  shift 17


state 13
	fun_decl : INT MAIN . LP RP comp_stmt

	LP  shift 18


state 14
	fun_decl : VOID MAIN . LP RP comp_stmt

	LP  shift 19


state 15
	fun_decl : MAIN LP . RP comp_stmt

	RP  shift 20


state 16
	funs : fun_decl funs .  (3)

	.  reduce 3


state 17
	fun_decl : vartype ID . LP args RP comp_stmt
	fun_decl : vartype ID . LP RP comp_stmt

	LP  shift 21


state 18
	fun_decl : INT MAIN LP . RP comp_stmt

	RP  shift 22


state 19
	fun_decl : VOID MAIN LP . RP comp_stmt

	RP  shift 23


state 20
	fun_decl : MAIN LP RP . comp_stmt

	LB  shift 24

	comp_stmt  goto 25


state 21
	fun_decl : vartype ID LP . args RP comp_stmt
	fun_decl : vartype ID LP . RP comp_stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	RP  shift 28

	vartype  goto 29
	args  goto 30


state 22
	fun_decl : INT MAIN LP RP . comp_stmt

	LB  shift 24

	comp_stmt  goto 31


state 23
	fun_decl : VOID MAIN LP RP . comp_stmt

	LB  shift 24

	comp_stmt  goto 32


state 24
	comp_stmt : LB . stmts RB
	comp_stmt : LB . RB

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	RB  shift 39
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 52
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	stmts  goto 61
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 25
	fun_decl : MAIN LP RP comp_stmt .  (7)

	.  reduce 7


state 26
	vartype : INT .  (27)

	.  reduce 27


state 27
	vartype : VOID .  (29)

	.  reduce 29


state 28
	fun_decl : vartype ID LP RP . comp_stmt

	LB  shift 24

	comp_stmt  goto 73


state 29
	args : vartype . ID COMMA args
	args : vartype . ID

	ID  shift 74


state 30
	fun_decl : vartype ID LP args . RP comp_stmt

	RP  shift 75


state 31
	fun_decl : INT MAIN LP RP comp_stmt .  (9)

	.  reduce 9


state 32
	fun_decl : VOID MAIN LP RP comp_stmt .  (8)

	.  reduce 8


state 33
	ifstmt : IF . LP expr RP stmt
	ifstmt : IF . LP expr RP stmt ELSE stmt

	LP  shift 76


state 34
	whilestmt : WHILE . LP expr RP stmt

	LP  shift 77


state 35
	forstmt : FOR . LP SEMI expr SEMI RP stmt
	forstmt : FOR . LP expr SEMI expr SEMI expr RP stmt
	forstmt : FOR . LP SEMI expr SEMI expr RP stmt
	forstmt : FOR . LP expr SEMI SEMI RP stmt
	forstmt : FOR . LP SEMI SEMI expr RP stmt
	forstmt : FOR . LP expr SEMI SEMI expr RP stmt
	forstmt : FOR . LP expr SEMI expr SEMI RP stmt
	forstmt : FOR . LP SEMI SEMI RP stmt

	LP  shift 78


state 36
	returnstmt : RETURN . expr SEMI

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 79
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 37
	term : NOT . term

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 82
	func_call  goto 70


state 38
	term : OPPSITE . term

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 83
	func_call  goto 70


state 39
	comp_stmt : LB RB .  (13)

	.  reduce 13


state 40
	term : LP . expr RP

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 84
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 41
	stmt : SEMI .  (25)

	.  reduce 25


state 42
	assign_expr : ID . ASSIGN expr
	array : ID . LSP expr RSP
	func_call : ID . LP idlist RP
	func_call : ID . LP RP
	term : ID .  (69)

	ASSIGN  shift 85
	LP  shift 86
	LSP  shift 87
	.  reduce 69


state 43
	term : NUMBER .  (70)

	.  reduce 70


state 44
	inputstmt : CIN . SHR expr SEMI

	SHR  shift 88


state 45
	outputstmt : COUT . SHL expr SEMI

	SHL  shift 89


state 46
	term : CHARVAL .  (73)

	.  reduce 73


state 47
	term : ENDL .  (74)

	.  reduce 74


state 48
	stmt : forstmt .  (21)

	.  reduce 21


state 49
	xor_expr : xor_expr . XOR band_expr
	bor_expr : xor_expr .  (44)

	XOR  shift 90
	.  reduce 44


state 50
	bor_expr : bor_expr . BOR xor_expr
	and_expr : bor_expr .  (42)

	BOR  shift 91
	.  reduce 42


state 51
	equal_expr : equal_expr . NE sh_expr
	equal_expr : equal_expr . GE sh_expr
	band_expr : equal_expr .  (48)
	equal_expr : equal_expr . EQ sh_expr
	equal_expr : equal_expr . LT sh_expr
	equal_expr : equal_expr . GT sh_expr
	equal_expr : equal_expr . LE sh_expr

	EQ  shift 92
	GT  shift 93
	LT  shift 94
	GE  shift 95
	LE  shift 96
	NE  shift 97
	.  reduce 48


state 52
	stmts : stmt .  (15)
	stmts : stmt . stmts

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47
	.  reduce 15

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 52
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	stmts  goto 98
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 53
	stmt : returnstmt .  (22)

	.  reduce 22


state 54
	assign_expr : array . ASSIGN expr
	term : array .  (75)

	ASSIGN  shift 99
	.  reduce 75


state 55
	stmt : whilestmt .  (20)

	.  reduce 20


state 56
	or_expr : and_expr .  (40)
	and_expr : and_expr . AND bor_expr

	AND  shift 100
	.  reduce 40


state 57
	xor_expr : band_expr .  (46)
	band_expr : band_expr . BAND equal_expr

	BAND  shift 101
	.  reduce 46


state 58
	assign_expr : or_expr .  (38)
	or_expr : or_expr . OR and_expr

	OR  shift 102
	.  reduce 38


state 59
	expr : assign_expr .  (35)

	.  reduce 35


state 60
	stmt : varstmt .  (18)

	.  reduce 18


state 61
	comp_stmt : LB stmts . RB

	RB  shift 103


state 62
	stmt : expr . SEMI

	SEMI  shift 104


state 63
	stmt : inputstmt .  (23)

	.  reduce 23


state 64
	stmt : outputstmt .  (24)

	.  reduce 24


state 65
	stmt : ifstmt .  (19)

	.  reduce 19


state 66
	simp_expr2 : term .  (67)

	.  reduce 67


state 67
	simp_expr : simp_expr2 .  (61)
	simp_expr2 : simp_expr2 . DIV term
	simp_expr2 : simp_expr2 . MOD term
	simp_expr2 : simp_expr2 . MUL term
	simp_expr2 : simp_expr2 . DEC
	simp_expr2 : simp_expr2 . INC

	MUL  shift 105
	DIV  shift 106
	MOD  shift 107
	INC  shift 108
	DEC  shift 109
	.  reduce 61


state 68
	sh_expr : sh_expr . SHL simp_expr
	sh_expr : sh_expr . SHR simp_expr
	equal_expr : sh_expr .  (55)

	SHL  shift 110
	SHR  shift 111
	.  reduce 55


state 69
	sh_expr : simp_expr .  (58)
	simp_expr : simp_expr . ADD simp_expr2
	simp_expr : simp_expr . SUB simp_expr2

	ADD  shift 112
	SUB  shift 113
	.  reduce 58


state 70
	term : func_call .  (76)

	.  reduce 76


state 71
	stmt : comp_stmt .  (16)

	.  reduce 16


state 72
	varstmt : vartype . idlist SEMI

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	idlist  goto 114
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 115
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 73
	fun_decl : vartype ID LP RP comp_stmt .  (6)

	.  reduce 6


state 74
	args : vartype ID . COMMA args
	args : vartype ID .  (11)

	COMMA  shift 116
	.  reduce 11


state 75
	fun_decl : vartype ID LP args RP . comp_stmt

	LB  shift 24

	comp_stmt  goto 117


state 76
	ifstmt : IF LP . expr RP stmt
	ifstmt : IF LP . expr RP stmt ELSE stmt

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 118
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 77
	whilestmt : WHILE LP . expr RP stmt

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 119
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 78
	forstmt : FOR LP . SEMI expr SEMI RP stmt
	forstmt : FOR LP . expr SEMI expr SEMI expr RP stmt
	forstmt : FOR LP . SEMI expr SEMI expr RP stmt
	forstmt : FOR LP . expr SEMI SEMI RP stmt
	forstmt : FOR LP . SEMI SEMI expr RP stmt
	forstmt : FOR LP . expr SEMI SEMI expr RP stmt
	forstmt : FOR LP . expr SEMI expr SEMI RP stmt
	forstmt : FOR LP . SEMI SEMI RP stmt

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	SEMI  shift 120
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 121
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 79
	returnstmt : RETURN expr . SEMI

	SEMI  shift 122


state 80
	array : ID . LSP expr RSP
	func_call : ID . LP idlist RP
	func_call : ID . LP RP
	term : ID .  (69)

	LP  shift 86
	LSP  shift 87
	.  reduce 69


state 81
	term : array .  (75)

	.  reduce 75


state 82
	term : NOT term .  (71)

	.  reduce 71


state 83
	term : OPPSITE term .  (72)

	.  reduce 72


state 84
	term : LP expr . RP

	RP  shift 123


state 85
	assign_expr : ID ASSIGN . expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 124
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 86
	func_call : ID LP . idlist RP
	func_call : ID LP . RP

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	RP  shift 125
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	idlist  goto 126
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 115
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 87
	array : ID LSP . expr RSP

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 127
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 88
	inputstmt : CIN SHR . expr SEMI

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 128
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 89
	outputstmt : COUT SHL . expr SEMI

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 129
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 90
	xor_expr : xor_expr XOR . band_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	equal_expr  goto 51
	array  goto 81
	band_expr  goto 130
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 91
	bor_expr : bor_expr BOR . xor_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 131
	equal_expr  goto 51
	array  goto 81
	band_expr  goto 57
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 92
	equal_expr : equal_expr EQ . sh_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 132
	simp_expr  goto 69
	func_call  goto 70


state 93
	equal_expr : equal_expr GT . sh_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 133
	simp_expr  goto 69
	func_call  goto 70


state 94
	equal_expr : equal_expr LT . sh_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 134
	simp_expr  goto 69
	func_call  goto 70


state 95
	equal_expr : equal_expr GE . sh_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 135
	simp_expr  goto 69
	func_call  goto 70


state 96
	equal_expr : equal_expr LE . sh_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 136
	simp_expr  goto 69
	func_call  goto 70


state 97
	equal_expr : equal_expr NE . sh_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 137
	simp_expr  goto 69
	func_call  goto 70


state 98
	stmts : stmt stmts .  (14)

	.  reduce 14


state 99
	assign_expr : array ASSIGN . expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 138
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 100
	and_expr : and_expr AND . bor_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 139
	equal_expr  goto 51
	array  goto 81
	band_expr  goto 57
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 101
	band_expr : band_expr BAND . equal_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	equal_expr  goto 140
	array  goto 81
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 102
	or_expr : or_expr OR . and_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 81
	and_expr  goto 141
	band_expr  goto 57
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 103
	comp_stmt : LB stmts RB .  (12)

	.  reduce 12


state 104
	stmt : expr SEMI .  (17)

	.  reduce 17


state 105
	simp_expr2 : simp_expr2 MUL . term

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 142
	func_call  goto 70


state 106
	simp_expr2 : simp_expr2 DIV . term

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 143
	func_call  goto 70


state 107
	simp_expr2 : simp_expr2 MOD . term

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 144
	func_call  goto 70


state 108
	simp_expr2 : simp_expr2 INC .  (65)

	.  reduce 65


state 109
	simp_expr2 : simp_expr2 DEC .  (66)

	.  reduce 66


state 110
	sh_expr : sh_expr SHL . simp_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 67
	simp_expr  goto 145
	func_call  goto 70


state 111
	sh_expr : sh_expr SHR . simp_expr

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 67
	simp_expr  goto 146
	func_call  goto 70


state 112
	simp_expr : simp_expr ADD . simp_expr2

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 147
	func_call  goto 70


state 113
	simp_expr : simp_expr SUB . simp_expr2

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 80
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	array  goto 81
	term  goto 66
	simp_expr2  goto 148
	func_call  goto 70


state 114
	varstmt : vartype idlist . SEMI

	SEMI  shift 149


state 115
	idlist : expr .  (34)
	idlist : expr . COMMA idlist

	COMMA  shift 150
	.  reduce 34


state 116
	args : vartype ID COMMA . args

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6

	vartype  goto 29
	args  goto 151


state 117
	fun_decl : vartype ID LP args RP comp_stmt .  (5)

	.  reduce 5


state 118
	ifstmt : IF LP expr . RP stmt
	ifstmt : IF LP expr . RP stmt ELSE stmt

	RP  shift 152


state 119
	whilestmt : WHILE LP expr . RP stmt

	RP  shift 153


state 120
	forstmt : FOR LP SEMI . expr SEMI RP stmt
	forstmt : FOR LP SEMI . expr SEMI expr RP stmt
	forstmt : FOR LP SEMI . SEMI expr RP stmt
	forstmt : FOR LP SEMI . SEMI RP stmt

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	SEMI  shift 154
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 155
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 121
	forstmt : FOR LP expr . SEMI expr SEMI expr RP stmt
	forstmt : FOR LP expr . SEMI SEMI RP stmt
	forstmt : FOR LP expr . SEMI SEMI expr RP stmt
	forstmt : FOR LP expr . SEMI expr SEMI RP stmt

	SEMI  shift 156


state 122
	returnstmt : RETURN expr SEMI .  (93)

	.  reduce 93


state 123
	term : LP expr RP .  (68)

	.  reduce 68


state 124
	assign_expr : ID ASSIGN expr .  (36)

	.  reduce 36


state 125
	func_call : ID LP RP .  (79)

	.  reduce 79


state 126
	func_call : ID LP idlist . RP

	RP  shift 157


state 127
	array : ID LSP expr . RSP

	RSP  shift 158


state 128
	inputstmt : CIN SHR expr . SEMI

	SEMI  shift 159


state 129
	outputstmt : COUT SHL expr . SEMI

	SEMI  shift 160


state 130
	xor_expr : xor_expr XOR band_expr .  (45)
	band_expr : band_expr . BAND equal_expr

	BAND  shift 101
	.  reduce 45


state 131
	bor_expr : bor_expr BOR xor_expr .  (43)
	xor_expr : xor_expr . XOR band_expr

	XOR  shift 90
	.  reduce 43


state 132
	sh_expr : sh_expr . SHL simp_expr
	equal_expr : equal_expr EQ sh_expr .  (49)
	sh_expr : sh_expr . SHR simp_expr

	SHL  shift 110
	SHR  shift 111
	.  reduce 49


state 133
	sh_expr : sh_expr . SHL simp_expr
	sh_expr : sh_expr . SHR simp_expr
	equal_expr : equal_expr GT sh_expr .  (53)

	SHL  shift 110
	SHR  shift 111
	.  reduce 53


state 134
	sh_expr : sh_expr . SHL simp_expr
	equal_expr : equal_expr LT sh_expr .  (54)
	sh_expr : sh_expr . SHR simp_expr

	SHL  shift 110
	SHR  shift 111
	.  reduce 54


state 135
	equal_expr : equal_expr GE sh_expr .  (51)
	sh_expr : sh_expr . SHL simp_expr
	sh_expr : sh_expr . SHR simp_expr

	SHL  shift 110
	SHR  shift 111
	.  reduce 51


state 136
	sh_expr : sh_expr . SHL simp_expr
	sh_expr : sh_expr . SHR simp_expr
	equal_expr : equal_expr LE sh_expr .  (52)

	SHL  shift 110
	SHR  shift 111
	.  reduce 52


state 137
	equal_expr : equal_expr NE sh_expr .  (50)
	sh_expr : sh_expr . SHL simp_expr
	sh_expr : sh_expr . SHR simp_expr

	SHL  shift 110
	SHR  shift 111
	.  reduce 50


state 138
	assign_expr : array ASSIGN expr .  (37)

	.  reduce 37


state 139
	bor_expr : bor_expr . BOR xor_expr
	and_expr : and_expr AND bor_expr .  (41)

	BOR  shift 91
	.  reduce 41


state 140
	equal_expr : equal_expr . NE sh_expr
	equal_expr : equal_expr . GE sh_expr
	band_expr : band_expr BAND equal_expr .  (47)
	equal_expr : equal_expr . EQ sh_expr
	equal_expr : equal_expr . LT sh_expr
	equal_expr : equal_expr . GT sh_expr
	equal_expr : equal_expr . LE sh_expr

	EQ  shift 92
	GT  shift 93
	LT  shift 94
	GE  shift 95
	LE  shift 96
	NE  shift 97
	.  reduce 47


state 141
	and_expr : and_expr . AND bor_expr
	or_expr : or_expr OR and_expr .  (39)

	AND  shift 100
	.  reduce 39


state 142
	simp_expr2 : simp_expr2 MUL term .  (62)

	.  reduce 62


state 143
	simp_expr2 : simp_expr2 DIV term .  (63)

	.  reduce 63


state 144
	simp_expr2 : simp_expr2 MOD term .  (64)

	.  reduce 64


state 145
	sh_expr : sh_expr SHL simp_expr .  (56)
	simp_expr : simp_expr . ADD simp_expr2
	simp_expr : simp_expr . SUB simp_expr2

	ADD  shift 112
	SUB  shift 113
	.  reduce 56


state 146
	sh_expr : sh_expr SHR simp_expr .  (57)
	simp_expr : simp_expr . ADD simp_expr2
	simp_expr : simp_expr . SUB simp_expr2

	ADD  shift 112
	SUB  shift 113
	.  reduce 57


state 147
	simp_expr : simp_expr ADD simp_expr2 .  (59)
	simp_expr2 : simp_expr2 . DIV term
	simp_expr2 : simp_expr2 . MOD term
	simp_expr2 : simp_expr2 . MUL term
	simp_expr2 : simp_expr2 . DEC
	simp_expr2 : simp_expr2 . INC

	MUL  shift 105
	DIV  shift 106
	MOD  shift 107
	INC  shift 108
	DEC  shift 109
	.  reduce 59


state 148
	simp_expr : simp_expr SUB simp_expr2 .  (60)
	simp_expr2 : simp_expr2 . DIV term
	simp_expr2 : simp_expr2 . MOD term
	simp_expr2 : simp_expr2 . MUL term
	simp_expr2 : simp_expr2 . DEC
	simp_expr2 : simp_expr2 . INC

	MUL  shift 105
	DIV  shift 106
	MOD  shift 107
	INC  shift 108
	DEC  shift 109
	.  reduce 60


state 149
	varstmt : vartype idlist SEMI .  (26)

	.  reduce 26


state 150
	idlist : expr COMMA . idlist

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	idlist  goto 161
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 115
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 151
	args : vartype ID COMMA args .  (10)

	.  reduce 10


state 152
	ifstmt : IF LP expr RP . stmt
	ifstmt : IF LP expr RP . stmt ELSE stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 162
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 153
	whilestmt : WHILE LP expr RP . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 163
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 154
	forstmt : FOR LP SEMI SEMI . expr RP stmt
	forstmt : FOR LP SEMI SEMI . RP stmt

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	RP  shift 164
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 165
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 155
	forstmt : FOR LP SEMI expr . SEMI RP stmt
	forstmt : FOR LP SEMI expr . SEMI expr RP stmt

	SEMI  shift 166


state 156
	forstmt : FOR LP expr SEMI . expr SEMI expr RP stmt
	forstmt : FOR LP expr SEMI . SEMI RP stmt
	forstmt : FOR LP expr SEMI . SEMI expr RP stmt
	forstmt : FOR LP expr SEMI . expr SEMI RP stmt

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	SEMI  shift 167
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 168
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 157
	func_call : ID LP idlist RP .  (78)

	.  reduce 78


state 158
	array : ID LSP expr RSP .  (77)

	.  reduce 77


state 159
	inputstmt : CIN SHR expr SEMI .  (91)

	.  reduce 91


state 160
	outputstmt : COUT SHL expr SEMI .  (92)

	.  reduce 92


state 161
	idlist : expr COMMA idlist .  (33)

	.  reduce 33


state 162
	ifstmt : IF LP expr RP stmt .  (80)
	ifstmt : IF LP expr RP stmt . ELSE stmt

	ELSE  shift 169
	.  reduce 80


state 163
	whilestmt : WHILE LP expr RP stmt .  (90)

	.  reduce 90


state 164
	forstmt : FOR LP SEMI SEMI RP . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 170
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 165
	forstmt : FOR LP SEMI SEMI expr . RP stmt

	RP  shift 171


state 166
	forstmt : FOR LP SEMI expr SEMI . RP stmt
	forstmt : FOR LP SEMI expr SEMI . expr RP stmt

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	RP  shift 172
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 173
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 167
	forstmt : FOR LP expr SEMI SEMI . RP stmt
	forstmt : FOR LP expr SEMI SEMI . expr RP stmt

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	RP  shift 174
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 175
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 168
	forstmt : FOR LP expr SEMI expr . SEMI expr RP stmt
	forstmt : FOR LP expr SEMI expr . SEMI RP stmt

	SEMI  shift 176


state 169
	ifstmt : IF LP expr RP stmt ELSE . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 177
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 170
	forstmt : FOR LP SEMI SEMI RP stmt .  (89)

	.  reduce 89


state 171
	forstmt : FOR LP SEMI SEMI expr RP . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 178
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 172
	forstmt : FOR LP SEMI expr SEMI RP . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 179
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 173
	forstmt : FOR LP SEMI expr SEMI expr . RP stmt

	RP  shift 180


state 174
	forstmt : FOR LP expr SEMI SEMI RP . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 181
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 175
	forstmt : FOR LP expr SEMI SEMI expr . RP stmt

	RP  shift 182


state 176
	forstmt : FOR LP expr SEMI expr SEMI . expr RP stmt
	forstmt : FOR LP expr SEMI expr SEMI . RP stmt

	NOT  shift 37
	OPPSITE  shift 38
	LP  shift 40
	RP  shift 183
	ID  shift 42
	NUMBER  shift 43
	CHARVAL  shift 46
	ENDL  shift 47

	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	array  goto 54
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	expr  goto 184
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70


state 177
	ifstmt : IF LP expr RP stmt ELSE stmt .  (81)

	.  reduce 81


state 178
	forstmt : FOR LP SEMI SEMI expr RP stmt .  (85)

	.  reduce 85


state 179
	forstmt : FOR LP SEMI expr SEMI RP stmt .  (83)

	.  reduce 83


state 180
	forstmt : FOR LP SEMI expr SEMI expr RP . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 185
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 181
	forstmt : FOR LP expr SEMI SEMI RP stmt .  (84)

	.  reduce 84


state 182
	forstmt : FOR LP expr SEMI SEMI expr RP . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 186
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 183
	forstmt : FOR LP expr SEMI expr SEMI RP . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 187
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 184
	forstmt : FOR LP expr SEMI expr SEMI expr . RP stmt

	RP  shift 188


state 185
	forstmt : FOR LP SEMI expr SEMI expr RP stmt .  (88)

	.  reduce 88


state 186
	forstmt : FOR LP expr SEMI SEMI expr RP stmt .  (87)

	.  reduce 87


state 187
	forstmt : FOR LP expr SEMI expr SEMI RP stmt .  (86)

	.  reduce 86


state 188
	forstmt : FOR LP expr SEMI expr SEMI expr RP . stmt

	INT  shift 26
	CHAR  shift 2
	VOID  shift 27
	BOOL  shift 4
	FLOAT  shift 5
	DOUBLE  shift 6
	IF  shift 33
	WHILE  shift 34
	FOR  shift 35
	RETURN  shift 36
	NOT  shift 37
	OPPSITE  shift 38
	LB  shift 24
	LP  shift 40
	SEMI  shift 41
	ID  shift 42
	NUMBER  shift 43
	CIN  shift 44
	COUT  shift 45
	CHARVAL  shift 46
	ENDL  shift 47

	forstmt  goto 48
	xor_expr  goto 49
	bor_expr  goto 50
	equal_expr  goto 51
	stmt  goto 189
	returnstmt  goto 53
	array  goto 54
	whilestmt  goto 55
	and_expr  goto 56
	band_expr  goto 57
	or_expr  goto 58
	assign_expr  goto 59
	varstmt  goto 60
	expr  goto 62
	inputstmt  goto 63
	outputstmt  goto 64
	ifstmt  goto 65
	term  goto 66
	simp_expr2  goto 67
	sh_expr  goto 68
	simp_expr  goto 69
	func_call  goto 70
	comp_stmt  goto 71
	vartype  goto 72


state 189
	forstmt : FOR LP expr SEMI expr SEMI expr RP stmt .  (82)

	.  reduce 82


##############################################################################
# Summary
##############################################################################

51 token(s), 32 nonterminal(s)
94 grammar rule(s), 190 state(s)


##############################################################################
# End of File
##############################################################################
