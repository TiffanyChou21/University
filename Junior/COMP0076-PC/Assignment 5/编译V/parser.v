#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 59 of your 30 day trial period.
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
# parser.v
# YACC verbose file generated from parser.y.
# 
# Date: 11/14/19
# Time: 15:59:13
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : start $end

    1  start : MAIN LP RP block

    2  block : LB stmts RB

    3  stmts : stmt stmts
    4        | stmt

    5  stmt : expr_stmt
    6       | var_stmt
    7       | if_stmt
    8       | while_stmt
    9       | for_stmt
   10       | block
   11       | input_stmt
   12       | output_stmt
   13       | fuc_stmt
   14       | fuc_asked_stmt
   15       | return_stmt
   16       | SEMI

   17  var_stmt : type_var id_list SEMI

   18  fuc_var : fuc1_var COMMA fuc_var
   19          | fuc1_var

   20  fuc1_var : type_var ID

   21  expr_stmt : expr SEMI

   22  type_var : INT
   23           | CHAR
   24           | VOID
   25           | FLOAT
   26           | DOUBLE
   27           | BOOL

   28  id_list : expr COMMA id_list
   29          | expr

   30  expr : expr ASSIGN expr
   31       | expr ADDASS expr
   32       | expr SUBASS expr
   33       | expr MULASS expr
   34       | expr DIVASS expr
   35       | expr MODASS expr
   36       | expr ANDASS expr
   37       | expr ORASS expr
   38       | expr XORASS expr
   39       | expr SHLASS expr
   40       | expr SHRASS expr
   41       | or_expr

   42  or_expr : or_expr OR and_expr
   43          | and_expr

   44  and_expr : and_expr AND bor_expr
   45           | bor_expr

   46  bor_expr : bor_expr BOR xor_expr
   47           | xor_expr

   48  xor_expr : xor_expr XOR xor_expr
   49           | band_expr

   50  band_expr : band_expr BAND eq_expr
   51            | eq_expr

   52  eq_expr : eq_expr EQ rala_expr
   53          | eq_expr NE rala_expr
   54          | rala_expr

   55  rala_expr : rala_expr GE sh_expr
   56            | rala_expr LE sh_expr
   57            | rala_expr GT sh_expr
   58            | rala_expr LT sh_expr
   59            | sh_expr

   60  sh_expr : sh_expr SHL as_expr
   61          | sh_expr SHR as_expr
   62          | as_expr

   63  as_expr : as_expr ADD md_expr
   64          | as_expr SUB md_expr
   65          | md_expr

   66  md_expr : md_expr MUL term
   67          | md_expr DIV term
   68          | term

   69  term : LP expr RP
   70       | ID
   71       | NUMBER
   72       | CHARVAL
   73       | NOT term
   74       | BNOT term

   75  if_stmt : IF LP expr RP stmt
   76          | IF LP expr RP stmt ELSE stmt

   77  for_stmt : FOR LP expr SEMI expr SEMI expr RP stmt
   78           | FOR LP SEMI expr SEMI expr RP stmt
   79           | FOR LP expr SEMI SEMI expr RP stmt
   80           | FOR LP expr SEMI expr SEMI RP stmt
   81           | FOR LP SEMI SEMI expr RP stmt
   82           | FOR LP SEMI expr SEMI RP stmt
   83           | FOR LP expr SEMI SEMI RP stmt
   84           | FOR LP SEMI SEMI RP stmt

   85  while_stmt : WHILE LP expr RP stmt

   86  input_stmt : CIN SHR ID SEMI

   87  output_stmt : COUT SHL ID SEMI

   88  fuc_stmt : type_var ID LP fuc_var RP block

   89  fuc_asked_stmt : type_var ID ASSIGN fuc_asked1_stmt
   90                 | fuc_asked1_stmt

   91  fuc_asked1_stmt : ID LP expr_fuc RP SEMI

   92  expr_fuc : expr COMMA expr
   93           | expr

   94  return_stmt : RETURN term


##############################################################################
# States
##############################################################################

state 0
	$accept : . start $end

	MAIN  shift 1

	start  goto 2


state 1
	start : MAIN . LP RP block

	LP  shift 3


state 2
	$accept : start . $end  (0)

	$end  accept


state 3
	start : MAIN LP . RP block

	RP  shift 4


state 4
	start : MAIN LP RP . block

	LB  shift 5

	block  goto 6


state 5
	block : LB . stmts RB

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	stmts  goto 30
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 38
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 6
	start : MAIN LP RP block .  (1)

	.  reduce 1


state 7
	if_stmt : IF . LP expr RP stmt
	if_stmt : IF . LP expr RP stmt ELSE stmt

	LP  shift 53


state 8
	for_stmt : FOR . LP SEMI SEMI RP stmt
	for_stmt : FOR . LP SEMI expr SEMI expr RP stmt
	for_stmt : FOR . LP expr SEMI expr SEMI expr RP stmt
	for_stmt : FOR . LP SEMI SEMI expr RP stmt
	for_stmt : FOR . LP expr SEMI SEMI RP stmt
	for_stmt : FOR . LP expr SEMI expr SEMI RP stmt
	for_stmt : FOR . LP expr SEMI SEMI expr RP stmt
	for_stmt : FOR . LP SEMI expr SEMI RP stmt

	LP  shift 54


state 9
	while_stmt : WHILE . LP expr RP stmt

	LP  shift 55


state 10
	input_stmt : CIN . SHR ID SEMI

	SHR  shift 56


state 11
	output_stmt : COUT . SHL ID SEMI

	SHL  shift 57


state 12
	type_var : INT .  (22)

	.  reduce 22


state 13
	type_var : CHAR .  (23)

	.  reduce 23


state 14
	type_var : VOID .  (24)

	.  reduce 24


state 15
	type_var : FLOAT .  (25)

	.  reduce 25


state 16
	type_var : DOUBLE .  (26)

	.  reduce 26


state 17
	type_var : BOOL .  (27)

	.  reduce 27


state 18
	fuc_asked1_stmt : ID . LP expr_fuc RP SEMI
	term : ID .  (70)

	LP  shift 58
	.  reduce 70


state 19
	term : NUMBER .  (71)

	.  reduce 71


state 20
	term : CHARVAL .  (72)

	.  reduce 72


state 21
	term : NOT . term

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	term  goto 60


state 22
	term : BNOT . term

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	term  goto 61


state 23
	stmt : SEMI .  (16)

	.  reduce 16


state 24
	term : LP . expr RP

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 62
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 25
	return_stmt : RETURN . term

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	term  goto 63


state 26
	fuc_asked_stmt : fuc_asked1_stmt .  (90)

	.  reduce 90


state 27
	expr : or_expr .  (41)
	or_expr : or_expr . OR and_expr

	OR  shift 64
	.  reduce 41


state 28
	stmt : expr_stmt .  (5)

	.  reduce 5


state 29
	stmt : while_stmt .  (8)

	.  reduce 8


state 30
	block : LB stmts . RB

	RB  shift 65


state 31
	stmt : output_stmt .  (12)

	.  reduce 12


state 32
	stmt : fuc_stmt .  (13)

	.  reduce 13


state 33
	expr_stmt : expr . SEMI
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	SEMI  shift 77


state 34
	stmt : for_stmt .  (9)

	.  reduce 9


state 35
	stmt : fuc_asked_stmt .  (14)

	.  reduce 14


state 36
	stmt : input_stmt .  (11)

	.  reduce 11


state 37
	var_stmt : type_var . id_list SEMI
	fuc_asked_stmt : type_var . ID ASSIGN fuc_asked1_stmt
	fuc_stmt : type_var . ID LP fuc_var RP block

	ID  shift 78
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 79
	id_list  goto 80
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 38
	stmts : stmt . stmts
	stmts : stmt .  (4)

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25
	.  reduce 4

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	stmts  goto 81
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 38
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 39
	stmt : var_stmt .  (6)

	.  reduce 6


state 40
	stmt : if_stmt .  (7)

	.  reduce 7


state 41
	stmt : return_stmt .  (15)

	.  reduce 15


state 42
	stmt : block .  (10)

	.  reduce 10


state 43
	or_expr : and_expr .  (43)
	and_expr : and_expr . AND bor_expr

	AND  shift 82
	.  reduce 43


state 44
	rala_expr : rala_expr . GE sh_expr
	rala_expr : rala_expr . LE sh_expr
	eq_expr : rala_expr .  (54)
	rala_expr : rala_expr . GT sh_expr
	rala_expr : rala_expr . LT sh_expr

	GT  shift 83
	LT  shift 84
	GE  shift 85
	LE  shift 86
	.  reduce 54


state 45
	as_expr : md_expr .  (65)
	md_expr : md_expr . DIV term
	md_expr : md_expr . MUL term

	MUL  shift 87
	DIV  shift 88
	.  reduce 65


state 46
	xor_expr : xor_expr . XOR xor_expr
	bor_expr : xor_expr .  (47)

	XOR  shift 89
	.  reduce 47


state 47
	xor_expr : band_expr .  (49)
	band_expr : band_expr . BAND eq_expr

	BAND  shift 90
	.  reduce 49


state 48
	sh_expr : sh_expr . SHR as_expr
	rala_expr : sh_expr .  (59)
	sh_expr : sh_expr . SHL as_expr

	SHL  shift 91
	SHR  shift 92
	.  reduce 59


state 49
	eq_expr : eq_expr . EQ rala_expr
	band_expr : eq_expr .  (51)
	eq_expr : eq_expr . NE rala_expr

	NE  shift 93
	EQ  shift 94
	.  reduce 51


state 50
	sh_expr : as_expr .  (62)
	as_expr : as_expr . SUB md_expr
	as_expr : as_expr . ADD md_expr

	ADD  shift 95
	SUB  shift 96
	.  reduce 62


state 51
	md_expr : term .  (68)

	.  reduce 68


state 52
	and_expr : bor_expr .  (45)
	bor_expr : bor_expr . BOR xor_expr

	BOR  shift 97
	.  reduce 45


state 53
	if_stmt : IF LP . expr RP stmt
	if_stmt : IF LP . expr RP stmt ELSE stmt

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 98
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 54
	for_stmt : FOR LP . SEMI SEMI RP stmt
	for_stmt : FOR LP . SEMI expr SEMI expr RP stmt
	for_stmt : FOR LP . expr SEMI expr SEMI expr RP stmt
	for_stmt : FOR LP . SEMI SEMI expr RP stmt
	for_stmt : FOR LP . expr SEMI SEMI RP stmt
	for_stmt : FOR LP . expr SEMI expr SEMI RP stmt
	for_stmt : FOR LP . expr SEMI SEMI expr RP stmt
	for_stmt : FOR LP . SEMI expr SEMI RP stmt

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	SEMI  shift 99
	LP  shift 24

	or_expr  goto 27
	expr  goto 100
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 55
	while_stmt : WHILE LP . expr RP stmt

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 101
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 56
	input_stmt : CIN SHR . ID SEMI

	ID  shift 102


state 57
	output_stmt : COUT SHL . ID SEMI

	ID  shift 103


state 58
	fuc_asked1_stmt : ID LP . expr_fuc RP SEMI

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	expr_fuc  goto 104
	or_expr  goto 27
	expr  goto 105
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 59
	term : ID .  (70)

	.  reduce 70


state 60
	term : NOT term .  (73)

	.  reduce 73


state 61
	term : BNOT term .  (74)

	.  reduce 74


state 62
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	term : LP expr . RP

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	RP  shift 106


state 63
	return_stmt : RETURN term .  (94)

	.  reduce 94


state 64
	or_expr : or_expr OR . and_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	and_expr  goto 107
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 65
	block : LB stmts RB .  (2)

	.  reduce 2


state 66
	expr : expr ASSIGN . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 108
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 67
	expr : expr ADDASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 109
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 68
	expr : expr SUBASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 110
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 69
	expr : expr MULASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 111
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 70
	expr : expr DIVASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 112
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 71
	expr : expr MODASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 113
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 72
	expr : expr ANDASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 114
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 73
	expr : expr ORASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 115
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 74
	expr : expr XORASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 116
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 75
	expr : expr SHLASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 117
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 76
	expr : expr SHRASS . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 118
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 77
	expr_stmt : expr SEMI .  (21)

	.  reduce 21


78: shift-reduce conflict (shift 119, reduce 70) on ASSIGN
state 78
	fuc_asked_stmt : type_var ID . ASSIGN fuc_asked1_stmt
	fuc_stmt : type_var ID . LP fuc_var RP block
	term : ID .  (70)

	ASSIGN  shift 119
	LP  shift 120
	.  reduce 70


state 79
	expr : expr . ASSIGN expr
	id_list : expr .  (29)
	expr : expr . ADDASS expr
	id_list : expr . COMMA id_list
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	COMMA  shift 121
	.  reduce 29


state 80
	var_stmt : type_var id_list . SEMI

	SEMI  shift 122


state 81
	stmts : stmt stmts .  (3)

	.  reduce 3


state 82
	and_expr : and_expr AND . bor_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 123


state 83
	rala_expr : rala_expr GT . sh_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	md_expr  goto 45
	sh_expr  goto 124
	as_expr  goto 50
	term  goto 51


state 84
	rala_expr : rala_expr LT . sh_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	md_expr  goto 45
	sh_expr  goto 125
	as_expr  goto 50
	term  goto 51


state 85
	rala_expr : rala_expr GE . sh_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	md_expr  goto 45
	sh_expr  goto 126
	as_expr  goto 50
	term  goto 51


state 86
	rala_expr : rala_expr LE . sh_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	md_expr  goto 45
	sh_expr  goto 127
	as_expr  goto 50
	term  goto 51


state 87
	md_expr : md_expr MUL . term

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	term  goto 128


state 88
	md_expr : md_expr DIV . term

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	term  goto 129


state 89
	xor_expr : xor_expr XOR . xor_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 130
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51


state 90
	band_expr : band_expr BAND . eq_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	rala_expr  goto 44
	md_expr  goto 45
	sh_expr  goto 48
	eq_expr  goto 131
	as_expr  goto 50
	term  goto 51


state 91
	sh_expr : sh_expr SHL . as_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	md_expr  goto 45
	as_expr  goto 132
	term  goto 51


state 92
	sh_expr : sh_expr SHR . as_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	md_expr  goto 45
	as_expr  goto 133
	term  goto 51


state 93
	eq_expr : eq_expr NE . rala_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	rala_expr  goto 134
	md_expr  goto 45
	sh_expr  goto 48
	as_expr  goto 50
	term  goto 51


state 94
	eq_expr : eq_expr EQ . rala_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	rala_expr  goto 135
	md_expr  goto 45
	sh_expr  goto 48
	as_expr  goto 50
	term  goto 51


state 95
	as_expr : as_expr ADD . md_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	md_expr  goto 136
	term  goto 51


state 96
	as_expr : as_expr SUB . md_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	md_expr  goto 137
	term  goto 51


state 97
	bor_expr : bor_expr BOR . xor_expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 138
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51


state 98
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	if_stmt : IF LP expr . RP stmt
	if_stmt : IF LP expr . RP stmt ELSE stmt

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	RP  shift 139


state 99
	for_stmt : FOR LP SEMI . SEMI RP stmt
	for_stmt : FOR LP SEMI . expr SEMI expr RP stmt
	for_stmt : FOR LP SEMI . SEMI expr RP stmt
	for_stmt : FOR LP SEMI . expr SEMI RP stmt

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	SEMI  shift 140
	LP  shift 24

	or_expr  goto 27
	expr  goto 141
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 100
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	for_stmt : FOR LP expr . SEMI expr SEMI expr RP stmt
	for_stmt : FOR LP expr . SEMI SEMI RP stmt
	for_stmt : FOR LP expr . SEMI expr SEMI RP stmt
	for_stmt : FOR LP expr . SEMI SEMI expr RP stmt

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	SEMI  shift 142


state 101
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	while_stmt : WHILE LP expr . RP stmt

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	RP  shift 143


state 102
	input_stmt : CIN SHR ID . SEMI

	SEMI  shift 144


state 103
	output_stmt : COUT SHL ID . SEMI

	SEMI  shift 145


state 104
	fuc_asked1_stmt : ID LP expr_fuc . RP SEMI

	RP  shift 146


state 105
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	expr_fuc : expr .  (93)
	expr_fuc : expr . COMMA expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	COMMA  shift 147
	.  reduce 93


state 106
	term : LP expr RP .  (69)

	.  reduce 69


state 107
	or_expr : or_expr OR and_expr .  (42)
	and_expr : and_expr . AND bor_expr

	AND  shift 82
	.  reduce 42


108: shift-reduce conflict (shift 67, reduce 30) on ADDASS
108: shift-reduce conflict (shift 68, reduce 30) on SUBASS
108: shift-reduce conflict (shift 69, reduce 30) on MULASS
108: shift-reduce conflict (shift 70, reduce 30) on DIVASS
108: shift-reduce conflict (shift 71, reduce 30) on MODASS
108: shift-reduce conflict (shift 72, reduce 30) on ANDASS
108: shift-reduce conflict (shift 73, reduce 30) on ORASS
108: shift-reduce conflict (shift 74, reduce 30) on XORASS
108: shift-reduce conflict (shift 75, reduce 30) on SHLASS
108: shift-reduce conflict (shift 76, reduce 30) on SHRASS
state 108
	expr : expr ASSIGN expr .  (30)
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 30


109: shift-reduce conflict (shift 66, reduce 31) on ASSIGN
109: shift-reduce conflict (shift 67, reduce 31) on ADDASS
109: shift-reduce conflict (shift 68, reduce 31) on SUBASS
109: shift-reduce conflict (shift 69, reduce 31) on MULASS
109: shift-reduce conflict (shift 70, reduce 31) on DIVASS
109: shift-reduce conflict (shift 71, reduce 31) on MODASS
109: shift-reduce conflict (shift 72, reduce 31) on ANDASS
109: shift-reduce conflict (shift 73, reduce 31) on ORASS
109: shift-reduce conflict (shift 74, reduce 31) on XORASS
109: shift-reduce conflict (shift 75, reduce 31) on SHLASS
109: shift-reduce conflict (shift 76, reduce 31) on SHRASS
state 109
	expr : expr . ASSIGN expr
	expr : expr ADDASS expr .  (31)
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 31


110: shift-reduce conflict (shift 66, reduce 32) on ASSIGN
110: shift-reduce conflict (shift 67, reduce 32) on ADDASS
110: shift-reduce conflict (shift 68, reduce 32) on SUBASS
110: shift-reduce conflict (shift 69, reduce 32) on MULASS
110: shift-reduce conflict (shift 70, reduce 32) on DIVASS
110: shift-reduce conflict (shift 71, reduce 32) on MODASS
110: shift-reduce conflict (shift 72, reduce 32) on ANDASS
110: shift-reduce conflict (shift 73, reduce 32) on ORASS
110: shift-reduce conflict (shift 74, reduce 32) on XORASS
110: shift-reduce conflict (shift 75, reduce 32) on SHLASS
110: shift-reduce conflict (shift 76, reduce 32) on SHRASS
state 110
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr SUBASS expr .  (32)
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 32


111: shift-reduce conflict (shift 66, reduce 33) on ASSIGN
111: shift-reduce conflict (shift 67, reduce 33) on ADDASS
111: shift-reduce conflict (shift 68, reduce 33) on SUBASS
111: shift-reduce conflict (shift 69, reduce 33) on MULASS
111: shift-reduce conflict (shift 70, reduce 33) on DIVASS
111: shift-reduce conflict (shift 71, reduce 33) on MODASS
111: shift-reduce conflict (shift 72, reduce 33) on ANDASS
111: shift-reduce conflict (shift 73, reduce 33) on ORASS
111: shift-reduce conflict (shift 74, reduce 33) on XORASS
111: shift-reduce conflict (shift 75, reduce 33) on SHLASS
111: shift-reduce conflict (shift 76, reduce 33) on SHRASS
state 111
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr MULASS expr .  (33)
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 33


112: shift-reduce conflict (shift 66, reduce 34) on ASSIGN
112: shift-reduce conflict (shift 67, reduce 34) on ADDASS
112: shift-reduce conflict (shift 68, reduce 34) on SUBASS
112: shift-reduce conflict (shift 69, reduce 34) on MULASS
112: shift-reduce conflict (shift 70, reduce 34) on DIVASS
112: shift-reduce conflict (shift 71, reduce 34) on MODASS
112: shift-reduce conflict (shift 72, reduce 34) on ANDASS
112: shift-reduce conflict (shift 73, reduce 34) on ORASS
112: shift-reduce conflict (shift 74, reduce 34) on XORASS
112: shift-reduce conflict (shift 75, reduce 34) on SHLASS
112: shift-reduce conflict (shift 76, reduce 34) on SHRASS
state 112
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr DIVASS expr .  (34)
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 34


113: shift-reduce conflict (shift 66, reduce 35) on ASSIGN
113: shift-reduce conflict (shift 67, reduce 35) on ADDASS
113: shift-reduce conflict (shift 68, reduce 35) on SUBASS
113: shift-reduce conflict (shift 69, reduce 35) on MULASS
113: shift-reduce conflict (shift 70, reduce 35) on DIVASS
113: shift-reduce conflict (shift 71, reduce 35) on MODASS
113: shift-reduce conflict (shift 72, reduce 35) on ANDASS
113: shift-reduce conflict (shift 73, reduce 35) on ORASS
113: shift-reduce conflict (shift 74, reduce 35) on XORASS
113: shift-reduce conflict (shift 75, reduce 35) on SHLASS
113: shift-reduce conflict (shift 76, reduce 35) on SHRASS
state 113
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr MODASS expr .  (35)
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 35


114: shift-reduce conflict (shift 66, reduce 36) on ASSIGN
114: shift-reduce conflict (shift 67, reduce 36) on ADDASS
114: shift-reduce conflict (shift 68, reduce 36) on SUBASS
114: shift-reduce conflict (shift 69, reduce 36) on MULASS
114: shift-reduce conflict (shift 70, reduce 36) on DIVASS
114: shift-reduce conflict (shift 71, reduce 36) on MODASS
114: shift-reduce conflict (shift 72, reduce 36) on ANDASS
114: shift-reduce conflict (shift 73, reduce 36) on ORASS
114: shift-reduce conflict (shift 74, reduce 36) on XORASS
114: shift-reduce conflict (shift 75, reduce 36) on SHLASS
114: shift-reduce conflict (shift 76, reduce 36) on SHRASS
state 114
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr ANDASS expr .  (36)
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 36


115: shift-reduce conflict (shift 66, reduce 37) on ASSIGN
115: shift-reduce conflict (shift 67, reduce 37) on ADDASS
115: shift-reduce conflict (shift 68, reduce 37) on SUBASS
115: shift-reduce conflict (shift 69, reduce 37) on MULASS
115: shift-reduce conflict (shift 70, reduce 37) on DIVASS
115: shift-reduce conflict (shift 71, reduce 37) on MODASS
115: shift-reduce conflict (shift 72, reduce 37) on ANDASS
115: shift-reduce conflict (shift 73, reduce 37) on ORASS
115: shift-reduce conflict (shift 74, reduce 37) on XORASS
115: shift-reduce conflict (shift 75, reduce 37) on SHLASS
115: shift-reduce conflict (shift 76, reduce 37) on SHRASS
state 115
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr ORASS expr .  (37)
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 37


116: shift-reduce conflict (shift 66, reduce 38) on ASSIGN
116: shift-reduce conflict (shift 67, reduce 38) on ADDASS
116: shift-reduce conflict (shift 68, reduce 38) on SUBASS
116: shift-reduce conflict (shift 69, reduce 38) on MULASS
116: shift-reduce conflict (shift 70, reduce 38) on DIVASS
116: shift-reduce conflict (shift 71, reduce 38) on MODASS
116: shift-reduce conflict (shift 72, reduce 38) on ANDASS
116: shift-reduce conflict (shift 73, reduce 38) on ORASS
116: shift-reduce conflict (shift 74, reduce 38) on XORASS
116: shift-reduce conflict (shift 75, reduce 38) on SHLASS
116: shift-reduce conflict (shift 76, reduce 38) on SHRASS
state 116
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr XORASS expr .  (38)
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 38


117: shift-reduce conflict (shift 66, reduce 39) on ASSIGN
117: shift-reduce conflict (shift 67, reduce 39) on ADDASS
117: shift-reduce conflict (shift 68, reduce 39) on SUBASS
117: shift-reduce conflict (shift 69, reduce 39) on MULASS
117: shift-reduce conflict (shift 70, reduce 39) on DIVASS
117: shift-reduce conflict (shift 71, reduce 39) on MODASS
117: shift-reduce conflict (shift 72, reduce 39) on ANDASS
117: shift-reduce conflict (shift 73, reduce 39) on ORASS
117: shift-reduce conflict (shift 74, reduce 39) on XORASS
117: shift-reduce conflict (shift 75, reduce 39) on SHLASS
117: shift-reduce conflict (shift 76, reduce 39) on SHRASS
state 117
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr SHLASS expr .  (39)
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 39


118: shift-reduce conflict (shift 66, reduce 40) on ASSIGN
118: shift-reduce conflict (shift 67, reduce 40) on ADDASS
118: shift-reduce conflict (shift 68, reduce 40) on SUBASS
118: shift-reduce conflict (shift 69, reduce 40) on MULASS
118: shift-reduce conflict (shift 70, reduce 40) on DIVASS
118: shift-reduce conflict (shift 71, reduce 40) on MODASS
118: shift-reduce conflict (shift 72, reduce 40) on ANDASS
118: shift-reduce conflict (shift 73, reduce 40) on ORASS
118: shift-reduce conflict (shift 74, reduce 40) on XORASS
118: shift-reduce conflict (shift 75, reduce 40) on SHLASS
118: shift-reduce conflict (shift 76, reduce 40) on SHRASS
state 118
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr SHRASS expr .  (40)
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 40


state 119
	fuc_asked_stmt : type_var ID ASSIGN . fuc_asked1_stmt

	ID  shift 148

	fuc_asked1_stmt  goto 149


state 120
	fuc_stmt : type_var ID LP . fuc_var RP block

	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17

	type_var  goto 150
	fuc_var  goto 151
	fuc1_var  goto 152


state 121
	id_list : expr COMMA . id_list

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 79
	id_list  goto 153
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 122
	var_stmt : type_var id_list SEMI .  (17)

	.  reduce 17


state 123
	bor_expr : bor_expr . BOR xor_expr
	and_expr : and_expr AND bor_expr .  (44)

	BOR  shift 97
	.  reduce 44


state 124
	sh_expr : sh_expr . SHR as_expr
	rala_expr : rala_expr GT sh_expr .  (57)
	sh_expr : sh_expr . SHL as_expr

	SHL  shift 91
	SHR  shift 92
	.  reduce 57


state 125
	sh_expr : sh_expr . SHR as_expr
	sh_expr : sh_expr . SHL as_expr
	rala_expr : rala_expr LT sh_expr .  (58)

	SHL  shift 91
	SHR  shift 92
	.  reduce 58


state 126
	sh_expr : sh_expr . SHR as_expr
	rala_expr : rala_expr GE sh_expr .  (55)
	sh_expr : sh_expr . SHL as_expr

	SHL  shift 91
	SHR  shift 92
	.  reduce 55


state 127
	sh_expr : sh_expr . SHR as_expr
	rala_expr : rala_expr LE sh_expr .  (56)
	sh_expr : sh_expr . SHL as_expr

	SHL  shift 91
	SHR  shift 92
	.  reduce 56


state 128
	md_expr : md_expr MUL term .  (66)

	.  reduce 66


state 129
	md_expr : md_expr DIV term .  (67)

	.  reduce 67


130: shift-reduce conflict (shift 89, reduce 48) on XOR
state 130
	xor_expr : xor_expr XOR xor_expr .  (48)
	xor_expr : xor_expr . XOR xor_expr

	XOR  shift 89
	.  reduce 48


state 131
	eq_expr : eq_expr . EQ rala_expr
	eq_expr : eq_expr . NE rala_expr
	band_expr : band_expr BAND eq_expr .  (50)

	NE  shift 93
	EQ  shift 94
	.  reduce 50


state 132
	as_expr : as_expr . SUB md_expr
	sh_expr : sh_expr SHL as_expr .  (60)
	as_expr : as_expr . ADD md_expr

	ADD  shift 95
	SUB  shift 96
	.  reduce 60


state 133
	sh_expr : sh_expr SHR as_expr .  (61)
	as_expr : as_expr . SUB md_expr
	as_expr : as_expr . ADD md_expr

	ADD  shift 95
	SUB  shift 96
	.  reduce 61


state 134
	rala_expr : rala_expr . GE sh_expr
	rala_expr : rala_expr . LE sh_expr
	eq_expr : eq_expr NE rala_expr .  (53)
	rala_expr : rala_expr . GT sh_expr
	rala_expr : rala_expr . LT sh_expr

	GT  shift 83
	LT  shift 84
	GE  shift 85
	LE  shift 86
	.  reduce 53


state 135
	eq_expr : eq_expr EQ rala_expr .  (52)
	rala_expr : rala_expr . GE sh_expr
	rala_expr : rala_expr . LE sh_expr
	rala_expr : rala_expr . GT sh_expr
	rala_expr : rala_expr . LT sh_expr

	GT  shift 83
	LT  shift 84
	GE  shift 85
	LE  shift 86
	.  reduce 52


state 136
	as_expr : as_expr ADD md_expr .  (63)
	md_expr : md_expr . DIV term
	md_expr : md_expr . MUL term

	MUL  shift 87
	DIV  shift 88
	.  reduce 63


state 137
	as_expr : as_expr SUB md_expr .  (64)
	md_expr : md_expr . DIV term
	md_expr : md_expr . MUL term

	MUL  shift 87
	DIV  shift 88
	.  reduce 64


state 138
	bor_expr : bor_expr BOR xor_expr .  (46)
	xor_expr : xor_expr . XOR xor_expr

	XOR  shift 89
	.  reduce 46


state 139
	if_stmt : IF LP expr RP . stmt
	if_stmt : IF LP expr RP . stmt ELSE stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 154
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 140
	for_stmt : FOR LP SEMI SEMI . RP stmt
	for_stmt : FOR LP SEMI SEMI . expr RP stmt

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24
	RP  shift 155

	or_expr  goto 27
	expr  goto 156
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 141
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	for_stmt : FOR LP SEMI expr . SEMI expr RP stmt
	for_stmt : FOR LP SEMI expr . SEMI RP stmt

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	SEMI  shift 157


state 142
	for_stmt : FOR LP expr SEMI . expr SEMI expr RP stmt
	for_stmt : FOR LP expr SEMI . SEMI RP stmt
	for_stmt : FOR LP expr SEMI . expr SEMI RP stmt
	for_stmt : FOR LP expr SEMI . SEMI expr RP stmt

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	SEMI  shift 158
	LP  shift 24

	or_expr  goto 27
	expr  goto 159
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 143
	while_stmt : WHILE LP expr RP . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 160
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 144
	input_stmt : CIN SHR ID SEMI .  (86)

	.  reduce 86


state 145
	output_stmt : COUT SHL ID SEMI .  (87)

	.  reduce 87


state 146
	fuc_asked1_stmt : ID LP expr_fuc RP . SEMI

	SEMI  shift 161


state 147
	expr_fuc : expr COMMA . expr

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24

	or_expr  goto 27
	expr  goto 162
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 148
	fuc_asked1_stmt : ID . LP expr_fuc RP SEMI

	LP  shift 58


state 149
	fuc_asked_stmt : type_var ID ASSIGN fuc_asked1_stmt .  (89)

	.  reduce 89


state 150
	fuc1_var : type_var . ID

	ID  shift 163


state 151
	fuc_stmt : type_var ID LP fuc_var . RP block

	RP  shift 164


state 152
	fuc_var : fuc1_var . COMMA fuc_var
	fuc_var : fuc1_var .  (19)

	COMMA  shift 165
	.  reduce 19


state 153
	id_list : expr COMMA id_list .  (28)

	.  reduce 28


state 154
	if_stmt : IF LP expr RP stmt .  (75)
	if_stmt : IF LP expr RP stmt . ELSE stmt

	ELSE  shift 166
	.  reduce 75


state 155
	for_stmt : FOR LP SEMI SEMI RP . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 167
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 156
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	for_stmt : FOR LP SEMI SEMI expr . RP stmt

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	RP  shift 168


state 157
	for_stmt : FOR LP SEMI expr SEMI . expr RP stmt
	for_stmt : FOR LP SEMI expr SEMI . RP stmt

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24
	RP  shift 169

	or_expr  goto 27
	expr  goto 170
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 158
	for_stmt : FOR LP expr SEMI SEMI . RP stmt
	for_stmt : FOR LP expr SEMI SEMI . expr RP stmt

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24
	RP  shift 171

	or_expr  goto 27
	expr  goto 172
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 159
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	for_stmt : FOR LP expr SEMI expr . SEMI expr RP stmt
	for_stmt : FOR LP expr SEMI expr . SEMI RP stmt

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	SEMI  shift 173


state 160
	while_stmt : WHILE LP expr RP stmt .  (85)

	.  reduce 85


state 161
	fuc_asked1_stmt : ID LP expr_fuc RP SEMI .  (91)

	.  reduce 91


state 162
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	expr_fuc : expr COMMA expr .  (92)

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	.  reduce 92


state 163
	fuc1_var : type_var ID .  (20)

	.  reduce 20


state 164
	fuc_stmt : type_var ID LP fuc_var RP . block

	LB  shift 5

	block  goto 174


state 165
	fuc_var : fuc1_var COMMA . fuc_var

	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17

	type_var  goto 150
	fuc_var  goto 175
	fuc1_var  goto 152


state 166
	if_stmt : IF LP expr RP stmt ELSE . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 176
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 167
	for_stmt : FOR LP SEMI SEMI RP stmt .  (84)

	.  reduce 84


state 168
	for_stmt : FOR LP SEMI SEMI expr RP . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 177
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 169
	for_stmt : FOR LP SEMI expr SEMI RP . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 178
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 170
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	for_stmt : FOR LP SEMI expr SEMI expr . RP stmt

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	RP  shift 179


state 171
	for_stmt : FOR LP expr SEMI SEMI RP . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 180
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 172
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	for_stmt : FOR LP expr SEMI SEMI expr . RP stmt

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	RP  shift 181


state 173
	for_stmt : FOR LP expr SEMI expr SEMI . expr RP stmt
	for_stmt : FOR LP expr SEMI expr SEMI . RP stmt

	ID  shift 59
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LP  shift 24
	RP  shift 182

	or_expr  goto 27
	expr  goto 183
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 174
	fuc_stmt : type_var ID LP fuc_var RP block .  (88)

	.  reduce 88


state 175
	fuc_var : fuc1_var COMMA fuc_var .  (18)

	.  reduce 18


state 176
	if_stmt : IF LP expr RP stmt ELSE stmt .  (76)

	.  reduce 76


state 177
	for_stmt : FOR LP SEMI SEMI expr RP stmt .  (81)

	.  reduce 81


state 178
	for_stmt : FOR LP SEMI expr SEMI RP stmt .  (82)

	.  reduce 82


state 179
	for_stmt : FOR LP SEMI expr SEMI expr RP . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 184
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 180
	for_stmt : FOR LP expr SEMI SEMI RP stmt .  (83)

	.  reduce 83


state 181
	for_stmt : FOR LP expr SEMI SEMI expr RP . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 185
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 182
	for_stmt : FOR LP expr SEMI expr SEMI RP . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 186
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 183
	expr : expr . ASSIGN expr
	expr : expr . ADDASS expr
	expr : expr . SUBASS expr
	expr : expr . MULASS expr
	expr : expr . XORASS expr
	expr : expr . ANDASS expr
	expr : expr . MODASS expr
	expr : expr . SHLASS expr
	expr : expr . SHRASS expr
	expr : expr . ORASS expr
	expr : expr . DIVASS expr
	for_stmt : FOR LP expr SEMI expr SEMI expr . RP stmt

	ASSIGN  shift 66
	ADDASS  shift 67
	SUBASS  shift 68
	MULASS  shift 69
	DIVASS  shift 70
	MODASS  shift 71
	ANDASS  shift 72
	ORASS  shift 73
	XORASS  shift 74
	SHLASS  shift 75
	SHRASS  shift 76
	RP  shift 187


state 184
	for_stmt : FOR LP SEMI expr SEMI expr RP stmt .  (78)

	.  reduce 78


state 185
	for_stmt : FOR LP expr SEMI SEMI expr RP stmt .  (79)

	.  reduce 79


state 186
	for_stmt : FOR LP expr SEMI expr SEMI RP stmt .  (80)

	.  reduce 80


state 187
	for_stmt : FOR LP expr SEMI expr SEMI expr RP . stmt

	IF  shift 7
	FOR  shift 8
	WHILE  shift 9
	CIN  shift 10
	COUT  shift 11
	INT  shift 12
	CHAR  shift 13
	VOID  shift 14
	FLOAT  shift 15
	DOUBLE  shift 16
	BOOL  shift 17
	ID  shift 18
	NUMBER  shift 19
	CHARVAL  shift 20
	NOT  shift 21
	BNOT  shift 22
	LB  shift 5
	SEMI  shift 23
	LP  shift 24
	RETURN  shift 25

	fuc_asked1_stmt  goto 26
	or_expr  goto 27
	expr_stmt  goto 28
	while_stmt  goto 29
	output_stmt  goto 31
	fuc_stmt  goto 32
	expr  goto 33
	for_stmt  goto 34
	fuc_asked_stmt  goto 35
	input_stmt  goto 36
	type_var  goto 37
	stmt  goto 188
	var_stmt  goto 39
	if_stmt  goto 40
	return_stmt  goto 41
	block  goto 42
	and_expr  goto 43
	rala_expr  goto 44
	md_expr  goto 45
	xor_expr  goto 46
	band_expr  goto 47
	sh_expr  goto 48
	eq_expr  goto 49
	as_expr  goto 50
	term  goto 51
	bor_expr  goto 52


state 188
	for_stmt : FOR LP expr SEMI expr SEMI expr RP stmt .  (77)

	.  reduce 77


##############################################################################
# Summary
##############################################################################

State 78 contains 1 shift-reduce conflict(s)
State 108 contains 10 shift-reduce conflict(s)
State 109 contains 11 shift-reduce conflict(s)
State 110 contains 11 shift-reduce conflict(s)
State 111 contains 11 shift-reduce conflict(s)
State 112 contains 11 shift-reduce conflict(s)
State 113 contains 11 shift-reduce conflict(s)
State 114 contains 11 shift-reduce conflict(s)
State 115 contains 11 shift-reduce conflict(s)
State 116 contains 11 shift-reduce conflict(s)
State 117 contains 11 shift-reduce conflict(s)
State 118 contains 11 shift-reduce conflict(s)
State 130 contains 1 shift-reduce conflict(s)


55 token(s), 33 nonterminal(s)
95 grammar rule(s), 189 state(s)


##############################################################################
# End of File
##############################################################################
