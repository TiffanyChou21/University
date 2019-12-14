#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 72 of your 30 day trial period.
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
# Date: 11/27/19
# Time: 18:44:56
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : mainstmt $end

    1  mainstmt : MAIN LP RP comp_stmt
    2           | MAIN LP VOID RP comp_stmt
    3           | VOID MAIN LP RP comp_stmt
    4           | VOID MAIN LP VOID RP comp_stmt

    5  comp_stmt : LB stmt_list RB
    6            | LB RB
    7            | stmt

    8  stmt_list : stmt_list stmt
    9            | stmt

   10  stmt : var_dec
   11       | exp_stmt
   12       | if_stmt
   13       | for_stmt
   14       | exp_stmt
   15       | while_stmt
   16       | io_stmt
   17       | SEMICOLON

   18  io_stmt : CIN SHR exp SEMICOLON
   19          | COUT SHL exp SEMICOLON

   20  var_dec : type idlist SEMICOLON

   21  type : INT
   22       | CHAR
   23       | BOOL

   24  idlist : idlist COMMA id
   25         | id
   26         | idlist COMMA assign_exp
   27         | assign_exp

   28  id : ID

   29  if_stmt : IF LP exp RP comp_stmt ELSE comp_stmt
   30          | IF LP exp RP comp_stmt

   31  for_stmt : FOR LP exp SEMICOLON exp SEMICOLON exp RP comp_stmt
   32           | FOR LP SEMICOLON exp SEMICOLON exp RP comp_stmt
   33           | FOR LP exp SEMICOLON SEMICOLON exp RP comp_stmt
   34           | FOR LP exp SEMICOLON exp SEMICOLON RP comp_stmt
   35           | FOR LP SEMICOLON SEMICOLON exp RP comp_stmt
   36           | FOR LP SEMICOLON exp SEMICOLON RP comp_stmt
   37           | FOR LP exp SEMICOLON SEMICOLON RP comp_stmt
   38           | FOR LP SEMICOLON SEMICOLON RP comp_stmt

   39  while_stmt : WHILE LP exp RP comp_stmt
   40             | DO comp_stmt WHILE LP exp RP

   41  exp_stmt : exp SEMICOLON
   42           | SEMICOLON

   43  exp : assign_exp

   44  assign_exp : id ASSIGN exp
   45             | or_exp

   46  or_exp : or_exp OR and_exp
   47         | and_exp

   48  and_exp : and_exp AND bor_exp
   49          | bor_exp

   50  bor_exp : bor_exp BOR xor_exp
   51          | xor_exp

   52  xor_exp : xor_exp XOR band_exp
   53          | band_exp

   54  band_exp : band_exp BAND comp_exp
   55           | comp_exp

   56  comp_exp : comp_exp EQ sh_exp
   57           | comp_exp NE sh_exp
   58           | comp_exp LT sh_exp
   59           | comp_exp GT sh_exp
   60           | comp_exp LE sh_exp
   61           | comp_exp GE sh_exp
   62           | sh_exp

   63  sh_exp : sh_exp SHL as_exp
   64         | sh_exp SHR as_exp
   65         | as_exp

   66  as_exp : as_exp ADD term
   67         | as_exp SUB term
   68         | term

   69  term : term MUL factor
   70       | term DIV factor
   71       | term MOD factor
   72       | factor

   73  factor : LP exp RP
   74         | id
   75         | NUMBER
   76         | CONSTCHAR
   77         | NOT factor
   78         | BNOT factor


##############################################################################
# States
##############################################################################

state 0
	$accept : . mainstmt $end

	VOID  shift 1
	MAIN  shift 2

	mainstmt  goto 3


state 1
	mainstmt : VOID . MAIN LP RP comp_stmt
	mainstmt : VOID . MAIN LP VOID RP comp_stmt

	MAIN  shift 4


state 2
	mainstmt : MAIN . LP RP comp_stmt
	mainstmt : MAIN . LP VOID RP comp_stmt

	LP  shift 5


state 3
	$accept : mainstmt . $end  (0)

	$end  accept


state 4
	mainstmt : VOID MAIN . LP RP comp_stmt
	mainstmt : VOID MAIN . LP VOID RP comp_stmt

	LP  shift 6


state 5
	mainstmt : MAIN LP . RP comp_stmt
	mainstmt : MAIN LP . VOID RP comp_stmt

	VOID  shift 7
	RP  shift 8


state 6
	mainstmt : VOID MAIN LP . RP comp_stmt
	mainstmt : VOID MAIN LP . VOID RP comp_stmt

	VOID  shift 9
	RP  shift 10


state 7
	mainstmt : MAIN LP VOID . RP comp_stmt

	RP  shift 11


state 8
	mainstmt : MAIN LP RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 29
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 9
	mainstmt : VOID MAIN LP VOID . RP comp_stmt

	RP  shift 51


state 10
	mainstmt : VOID MAIN LP RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 52
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 11
	mainstmt : MAIN LP VOID RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 53
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 12
	type : INT .  (21)

	.  reduce 21


state 13
	type : CHAR .  (22)

	.  reduce 22


state 14
	type : BOOL .  (23)

	.  reduce 23


state 15
	id : ID .  (28)

	.  reduce 28


state 16
	comp_stmt : LB . stmt_list RB
	comp_stmt : LB . RB

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	RB  shift 54
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	stmt_list  goto 55
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 56
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 17
	factor : LP . exp RP

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 57
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


18: reduce-reduce conflict (reduce 17, reduce 42) on $end
18: reduce-reduce conflict (reduce 17, reduce 42) on INT
18: reduce-reduce conflict (reduce 17, reduce 42) on CHAR
18: reduce-reduce conflict (reduce 17, reduce 42) on BOOL
18: reduce-reduce conflict (reduce 17, reduce 42) on ID
18: reduce-reduce conflict (reduce 17, reduce 42) on RB
18: reduce-reduce conflict (reduce 17, reduce 42) on LP
18: reduce-reduce conflict (reduce 17, reduce 42) on SEMICOLON
18: reduce-reduce conflict (reduce 17, reduce 42) on BNOT
18: reduce-reduce conflict (reduce 17, reduce 42) on NOT
18: reduce-reduce conflict (reduce 17, reduce 42) on IF
18: reduce-reduce conflict (reduce 17, reduce 42) on ELSE
18: reduce-reduce conflict (reduce 17, reduce 42) on WHILE
18: reduce-reduce conflict (reduce 17, reduce 42) on DO
18: reduce-reduce conflict (reduce 17, reduce 42) on FOR
18: reduce-reduce conflict (reduce 17, reduce 42) on CIN
18: reduce-reduce conflict (reduce 17, reduce 42) on COUT
18: reduce-reduce conflict (reduce 17, reduce 42) on NUMBER
18: reduce-reduce conflict (reduce 17, reduce 42) on CONSTCHAR
state 18
	stmt : SEMICOLON .  (17)
	exp_stmt : SEMICOLON .  (42)

	.  reduce 17


state 19
	factor : BNOT . factor

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	factor  goto 59


state 20
	factor : NOT . factor

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	factor  goto 60


state 21
	if_stmt : IF . LP exp RP comp_stmt ELSE comp_stmt
	if_stmt : IF . LP exp RP comp_stmt

	LP  shift 61


state 22
	while_stmt : WHILE . LP exp RP comp_stmt

	LP  shift 62


state 23
	while_stmt : DO . comp_stmt WHILE LP exp RP

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 63
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 24
	for_stmt : FOR . LP exp SEMICOLON exp SEMICOLON exp RP comp_stmt
	for_stmt : FOR . LP SEMICOLON exp SEMICOLON exp RP comp_stmt
	for_stmt : FOR . LP exp SEMICOLON SEMICOLON exp RP comp_stmt
	for_stmt : FOR . LP SEMICOLON SEMICOLON RP comp_stmt
	for_stmt : FOR . LP exp SEMICOLON SEMICOLON RP comp_stmt
	for_stmt : FOR . LP SEMICOLON SEMICOLON exp RP comp_stmt
	for_stmt : FOR . LP SEMICOLON exp SEMICOLON RP comp_stmt
	for_stmt : FOR . LP exp SEMICOLON exp SEMICOLON RP comp_stmt

	LP  shift 64


state 25
	io_stmt : CIN . SHR exp SEMICOLON

	SHR  shift 65


state 26
	io_stmt : COUT . SHL exp SEMICOLON

	SHL  shift 66


state 27
	factor : NUMBER .  (75)

	.  reduce 75


state 28
	factor : CONSTCHAR .  (76)

	.  reduce 76


state 29
	mainstmt : MAIN LP RP comp_stmt .  (1)

	.  reduce 1


state 30
	stmt : var_dec .  (10)

	.  reduce 10


state 31
	stmt : if_stmt .  (12)

	.  reduce 12


32: reduce-reduce conflict (reduce 11, reduce 14) on $end
32: reduce-reduce conflict (reduce 11, reduce 14) on INT
32: reduce-reduce conflict (reduce 11, reduce 14) on CHAR
32: reduce-reduce conflict (reduce 11, reduce 14) on BOOL
32: reduce-reduce conflict (reduce 11, reduce 14) on ID
32: reduce-reduce conflict (reduce 11, reduce 14) on RB
32: reduce-reduce conflict (reduce 11, reduce 14) on LP
32: reduce-reduce conflict (reduce 11, reduce 14) on SEMICOLON
32: reduce-reduce conflict (reduce 11, reduce 14) on BNOT
32: reduce-reduce conflict (reduce 11, reduce 14) on NOT
32: reduce-reduce conflict (reduce 11, reduce 14) on IF
32: reduce-reduce conflict (reduce 11, reduce 14) on ELSE
32: reduce-reduce conflict (reduce 11, reduce 14) on WHILE
32: reduce-reduce conflict (reduce 11, reduce 14) on DO
32: reduce-reduce conflict (reduce 11, reduce 14) on FOR
32: reduce-reduce conflict (reduce 11, reduce 14) on CIN
32: reduce-reduce conflict (reduce 11, reduce 14) on COUT
32: reduce-reduce conflict (reduce 11, reduce 14) on NUMBER
32: reduce-reduce conflict (reduce 11, reduce 14) on CONSTCHAR
state 32
	stmt : exp_stmt .  (11)
	stmt : exp_stmt .  (14)

	.  reduce 11


state 33
	stmt : for_stmt .  (13)

	.  reduce 13


state 34
	comp_stmt : stmt .  (7)

	.  reduce 7


state 35
	assign_exp : id . ASSIGN exp
	factor : id .  (74)

	ASSIGN  shift 67
	.  reduce 74


state 36
	comp_exp : comp_exp . LE sh_exp
	comp_exp : comp_exp . NE sh_exp
	comp_exp : comp_exp . GE sh_exp
	band_exp : comp_exp .  (55)
	comp_exp : comp_exp . EQ sh_exp
	comp_exp : comp_exp . LT sh_exp
	comp_exp : comp_exp . GT sh_exp

	EQ  shift 68
	GT  shift 69
	LT  shift 70
	GE  shift 71
	LE  shift 72
	NE  shift 73
	.  reduce 55


state 37
	and_exp : bor_exp .  (49)
	bor_exp : bor_exp . BOR xor_exp

	BOR  shift 74
	.  reduce 49


state 38
	xor_exp : band_exp .  (53)
	band_exp : band_exp . BAND comp_exp

	BAND  shift 75
	.  reduce 53


state 39
	sh_exp : sh_exp . SHL as_exp
	sh_exp : sh_exp . SHR as_exp
	comp_exp : sh_exp .  (62)

	SHL  shift 76
	SHR  shift 77
	.  reduce 62


state 40
	var_dec : type . idlist SEMICOLON

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 78
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	idlist  goto 79
	or_exp  goto 44
	assign_exp  goto 80
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 41
	stmt : io_stmt .  (16)

	.  reduce 16


state 42
	stmt : while_stmt .  (15)

	.  reduce 15


state 43
	exp_stmt : exp . SEMICOLON

	SEMICOLON  shift 81


state 44
	assign_exp : or_exp .  (45)
	or_exp : or_exp . OR and_exp

	OR  shift 82
	.  reduce 45


state 45
	exp : assign_exp .  (43)

	.  reduce 43


state 46
	or_exp : and_exp .  (47)
	and_exp : and_exp . AND bor_exp

	AND  shift 83
	.  reduce 47


state 47
	xor_exp : xor_exp . XOR band_exp
	bor_exp : xor_exp .  (51)

	XOR  shift 84
	.  reduce 51


state 48
	sh_exp : as_exp .  (65)
	as_exp : as_exp . ADD term
	as_exp : as_exp . SUB term

	ADD  shift 85
	SUB  shift 86
	.  reduce 65


state 49
	as_exp : term .  (68)
	term : term . MUL factor
	term : term . MOD factor
	term : term . DIV factor

	MUL  shift 87
	DIV  shift 88
	MOD  shift 89
	.  reduce 68


state 50
	term : factor .  (72)

	.  reduce 72


state 51
	mainstmt : VOID MAIN LP VOID RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 90
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 52
	mainstmt : VOID MAIN LP RP comp_stmt .  (3)

	.  reduce 3


state 53
	mainstmt : MAIN LP VOID RP comp_stmt .  (2)

	.  reduce 2


state 54
	comp_stmt : LB RB .  (6)

	.  reduce 6


state 55
	comp_stmt : LB stmt_list . RB
	stmt_list : stmt_list . stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	RB  shift 91
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 92
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 56
	stmt_list : stmt .  (9)

	.  reduce 9


state 57
	factor : LP exp . RP

	RP  shift 93


state 58
	factor : id .  (74)

	.  reduce 74


state 59
	factor : BNOT factor .  (78)

	.  reduce 78


state 60
	factor : NOT factor .  (77)

	.  reduce 77


state 61
	if_stmt : IF LP . exp RP comp_stmt ELSE comp_stmt
	if_stmt : IF LP . exp RP comp_stmt

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 94
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 62
	while_stmt : WHILE LP . exp RP comp_stmt

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 95
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 63
	while_stmt : DO comp_stmt . WHILE LP exp RP

	WHILE  shift 96


state 64
	for_stmt : FOR LP . exp SEMICOLON exp SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP . SEMICOLON exp SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP . exp SEMICOLON SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP . SEMICOLON SEMICOLON RP comp_stmt
	for_stmt : FOR LP . exp SEMICOLON SEMICOLON RP comp_stmt
	for_stmt : FOR LP . SEMICOLON SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP . SEMICOLON exp SEMICOLON RP comp_stmt
	for_stmt : FOR LP . exp SEMICOLON exp SEMICOLON RP comp_stmt

	ID  shift 15
	LP  shift 17
	SEMICOLON  shift 97
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 98
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 65
	io_stmt : CIN SHR . exp SEMICOLON

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 99
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 66
	io_stmt : COUT SHL . exp SEMICOLON

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 100
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 67
	assign_exp : id ASSIGN . exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 101
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 68
	comp_exp : comp_exp EQ . sh_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	sh_exp  goto 102
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 69
	comp_exp : comp_exp GT . sh_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	sh_exp  goto 103
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 70
	comp_exp : comp_exp LT . sh_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	sh_exp  goto 104
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 71
	comp_exp : comp_exp GE . sh_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	sh_exp  goto 105
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 72
	comp_exp : comp_exp LE . sh_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	sh_exp  goto 106
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 73
	comp_exp : comp_exp NE . sh_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	sh_exp  goto 107
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 74
	bor_exp : bor_exp BOR . xor_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	comp_exp  goto 36
	band_exp  goto 38
	sh_exp  goto 39
	xor_exp  goto 108
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 75
	band_exp : band_exp BAND . comp_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	comp_exp  goto 109
	sh_exp  goto 39
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 76
	sh_exp : sh_exp SHL . as_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	as_exp  goto 110
	term  goto 49
	factor  goto 50


state 77
	sh_exp : sh_exp SHR . as_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	as_exp  goto 111
	term  goto 49
	factor  goto 50


78: reduce-reduce conflict (reduce 25, reduce 74) on SEMICOLON
78: reduce-reduce conflict (reduce 25, reduce 74) on COMMA
state 78
	idlist : id .  (25)
	assign_exp : id . ASSIGN exp
	factor : id .  (74)

	ASSIGN  shift 67
	SEMICOLON  reduce 25
	COMMA  reduce 25
	.  reduce 74


state 79
	idlist : idlist . COMMA id
	idlist : idlist . COMMA assign_exp
	var_dec : type idlist . SEMICOLON

	SEMICOLON  shift 112
	COMMA  shift 113


state 80
	idlist : assign_exp .  (27)

	.  reduce 27


state 81
	exp_stmt : exp SEMICOLON .  (41)

	.  reduce 41


state 82
	or_exp : or_exp OR . and_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	and_exp  goto 114
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 83
	and_exp : and_exp AND . bor_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	comp_exp  goto 36
	bor_exp  goto 115
	band_exp  goto 38
	sh_exp  goto 39
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 84
	xor_exp : xor_exp XOR . band_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	comp_exp  goto 36
	band_exp  goto 116
	sh_exp  goto 39
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 85
	as_exp : as_exp ADD . term

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	term  goto 117
	factor  goto 50


state 86
	as_exp : as_exp SUB . term

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	term  goto 118
	factor  goto 50


state 87
	term : term MUL . factor

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	factor  goto 119


state 88
	term : term DIV . factor

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	factor  goto 120


state 89
	term : term MOD . factor

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 58
	factor  goto 121


state 90
	mainstmt : VOID MAIN LP VOID RP comp_stmt .  (4)

	.  reduce 4


state 91
	comp_stmt : LB stmt_list RB .  (5)

	.  reduce 5


state 92
	stmt_list : stmt_list stmt .  (8)

	.  reduce 8


state 93
	factor : LP exp RP .  (73)

	.  reduce 73


state 94
	if_stmt : IF LP exp . RP comp_stmt ELSE comp_stmt
	if_stmt : IF LP exp . RP comp_stmt

	RP  shift 122


state 95
	while_stmt : WHILE LP exp . RP comp_stmt

	RP  shift 123


state 96
	while_stmt : DO comp_stmt WHILE . LP exp RP

	LP  shift 124


state 97
	for_stmt : FOR LP SEMICOLON . exp SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP SEMICOLON . SEMICOLON RP comp_stmt
	for_stmt : FOR LP SEMICOLON . SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP SEMICOLON . exp SEMICOLON RP comp_stmt

	ID  shift 15
	LP  shift 17
	SEMICOLON  shift 125
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 126
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 98
	for_stmt : FOR LP exp . SEMICOLON exp SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP exp . SEMICOLON SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP exp . SEMICOLON SEMICOLON RP comp_stmt
	for_stmt : FOR LP exp . SEMICOLON exp SEMICOLON RP comp_stmt

	SEMICOLON  shift 127


state 99
	io_stmt : CIN SHR exp . SEMICOLON

	SEMICOLON  shift 128


state 100
	io_stmt : COUT SHL exp . SEMICOLON

	SEMICOLON  shift 129


state 101
	assign_exp : id ASSIGN exp .  (44)

	.  reduce 44


state 102
	sh_exp : sh_exp . SHL as_exp
	sh_exp : sh_exp . SHR as_exp
	comp_exp : comp_exp EQ sh_exp .  (56)

	SHL  shift 76
	SHR  shift 77
	.  reduce 56


state 103
	sh_exp : sh_exp . SHL as_exp
	sh_exp : sh_exp . SHR as_exp
	comp_exp : comp_exp GT sh_exp .  (59)

	SHL  shift 76
	SHR  shift 77
	.  reduce 59


state 104
	sh_exp : sh_exp . SHL as_exp
	sh_exp : sh_exp . SHR as_exp
	comp_exp : comp_exp LT sh_exp .  (58)

	SHL  shift 76
	SHR  shift 77
	.  reduce 58


state 105
	comp_exp : comp_exp GE sh_exp .  (61)
	sh_exp : sh_exp . SHL as_exp
	sh_exp : sh_exp . SHR as_exp

	SHL  shift 76
	SHR  shift 77
	.  reduce 61


state 106
	comp_exp : comp_exp LE sh_exp .  (60)
	sh_exp : sh_exp . SHL as_exp
	sh_exp : sh_exp . SHR as_exp

	SHL  shift 76
	SHR  shift 77
	.  reduce 60


state 107
	comp_exp : comp_exp NE sh_exp .  (57)
	sh_exp : sh_exp . SHL as_exp
	sh_exp : sh_exp . SHR as_exp

	SHL  shift 76
	SHR  shift 77
	.  reduce 57


state 108
	bor_exp : bor_exp BOR xor_exp .  (50)
	xor_exp : xor_exp . XOR band_exp

	XOR  shift 84
	.  reduce 50


state 109
	comp_exp : comp_exp . LE sh_exp
	comp_exp : comp_exp . NE sh_exp
	comp_exp : comp_exp . GE sh_exp
	comp_exp : comp_exp . EQ sh_exp
	comp_exp : comp_exp . LT sh_exp
	comp_exp : comp_exp . GT sh_exp
	band_exp : band_exp BAND comp_exp .  (54)

	EQ  shift 68
	GT  shift 69
	LT  shift 70
	GE  shift 71
	LE  shift 72
	NE  shift 73
	.  reduce 54


state 110
	sh_exp : sh_exp SHL as_exp .  (63)
	as_exp : as_exp . ADD term
	as_exp : as_exp . SUB term

	ADD  shift 85
	SUB  shift 86
	.  reduce 63


state 111
	sh_exp : sh_exp SHR as_exp .  (64)
	as_exp : as_exp . ADD term
	as_exp : as_exp . SUB term

	ADD  shift 85
	SUB  shift 86
	.  reduce 64


state 112
	var_dec : type idlist SEMICOLON .  (20)

	.  reduce 20


state 113
	idlist : idlist COMMA . id
	idlist : idlist COMMA . assign_exp

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 130
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	or_exp  goto 44
	assign_exp  goto 131
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 114
	or_exp : or_exp OR and_exp .  (46)
	and_exp : and_exp . AND bor_exp

	AND  shift 83
	.  reduce 46


state 115
	bor_exp : bor_exp . BOR xor_exp
	and_exp : and_exp AND bor_exp .  (48)

	BOR  shift 74
	.  reduce 48


state 116
	xor_exp : xor_exp XOR band_exp .  (52)
	band_exp : band_exp . BAND comp_exp

	BAND  shift 75
	.  reduce 52


state 117
	as_exp : as_exp ADD term .  (66)
	term : term . MUL factor
	term : term . MOD factor
	term : term . DIV factor

	MUL  shift 87
	DIV  shift 88
	MOD  shift 89
	.  reduce 66


state 118
	as_exp : as_exp SUB term .  (67)
	term : term . MUL factor
	term : term . MOD factor
	term : term . DIV factor

	MUL  shift 87
	DIV  shift 88
	MOD  shift 89
	.  reduce 67


state 119
	term : term MUL factor .  (69)

	.  reduce 69


state 120
	term : term DIV factor .  (70)

	.  reduce 70


state 121
	term : term MOD factor .  (71)

	.  reduce 71


state 122
	if_stmt : IF LP exp RP . comp_stmt ELSE comp_stmt
	if_stmt : IF LP exp RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 132
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 123
	while_stmt : WHILE LP exp RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 133
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 124
	while_stmt : DO comp_stmt WHILE LP . exp RP

	ID  shift 15
	LP  shift 17
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 134
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 125
	for_stmt : FOR LP SEMICOLON SEMICOLON . RP comp_stmt
	for_stmt : FOR LP SEMICOLON SEMICOLON . exp RP comp_stmt

	ID  shift 15
	LP  shift 17
	RP  shift 135
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 136
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 126
	for_stmt : FOR LP SEMICOLON exp . SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP SEMICOLON exp . SEMICOLON RP comp_stmt

	SEMICOLON  shift 137


state 127
	for_stmt : FOR LP exp SEMICOLON . exp SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP exp SEMICOLON . SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP exp SEMICOLON . SEMICOLON RP comp_stmt
	for_stmt : FOR LP exp SEMICOLON . exp SEMICOLON RP comp_stmt

	ID  shift 15
	LP  shift 17
	SEMICOLON  shift 138
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 139
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 128
	io_stmt : CIN SHR exp SEMICOLON .  (18)

	.  reduce 18


state 129
	io_stmt : COUT SHL exp SEMICOLON .  (19)

	.  reduce 19


130: reduce-reduce conflict (reduce 24, reduce 74) on SEMICOLON
130: reduce-reduce conflict (reduce 24, reduce 74) on COMMA
state 130
	idlist : idlist COMMA id .  (24)
	assign_exp : id . ASSIGN exp
	factor : id .  (74)

	ASSIGN  shift 67
	SEMICOLON  reduce 24
	COMMA  reduce 24
	.  reduce 74


state 131
	idlist : idlist COMMA assign_exp .  (26)

	.  reduce 26


state 132
	if_stmt : IF LP exp RP comp_stmt . ELSE comp_stmt
	if_stmt : IF LP exp RP comp_stmt .  (30)

	ELSE  shift 140
	.  reduce 30


state 133
	while_stmt : WHILE LP exp RP comp_stmt .  (39)

	.  reduce 39


state 134
	while_stmt : DO comp_stmt WHILE LP exp . RP

	RP  shift 141


state 135
	for_stmt : FOR LP SEMICOLON SEMICOLON RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 142
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 136
	for_stmt : FOR LP SEMICOLON SEMICOLON exp . RP comp_stmt

	RP  shift 143


state 137
	for_stmt : FOR LP SEMICOLON exp SEMICOLON . exp RP comp_stmt
	for_stmt : FOR LP SEMICOLON exp SEMICOLON . RP comp_stmt

	ID  shift 15
	LP  shift 17
	RP  shift 144
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 145
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 138
	for_stmt : FOR LP exp SEMICOLON SEMICOLON . exp RP comp_stmt
	for_stmt : FOR LP exp SEMICOLON SEMICOLON . RP comp_stmt

	ID  shift 15
	LP  shift 17
	RP  shift 146
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 147
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 139
	for_stmt : FOR LP exp SEMICOLON exp . SEMICOLON exp RP comp_stmt
	for_stmt : FOR LP exp SEMICOLON exp . SEMICOLON RP comp_stmt

	SEMICOLON  shift 148


state 140
	if_stmt : IF LP exp RP comp_stmt ELSE . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 149
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 141
	while_stmt : DO comp_stmt WHILE LP exp RP .  (40)

	.  reduce 40


state 142
	for_stmt : FOR LP SEMICOLON SEMICOLON RP comp_stmt .  (38)

	.  reduce 38


state 143
	for_stmt : FOR LP SEMICOLON SEMICOLON exp RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 150
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 144
	for_stmt : FOR LP SEMICOLON exp SEMICOLON RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 151
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 145
	for_stmt : FOR LP SEMICOLON exp SEMICOLON exp . RP comp_stmt

	RP  shift 152


state 146
	for_stmt : FOR LP exp SEMICOLON SEMICOLON RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 153
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 147
	for_stmt : FOR LP exp SEMICOLON SEMICOLON exp . RP comp_stmt

	RP  shift 154


state 148
	for_stmt : FOR LP exp SEMICOLON exp SEMICOLON . exp RP comp_stmt
	for_stmt : FOR LP exp SEMICOLON exp SEMICOLON . RP comp_stmt

	ID  shift 15
	LP  shift 17
	RP  shift 155
	BNOT  shift 19
	NOT  shift 20
	NUMBER  shift 27
	CONSTCHAR  shift 28

	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	exp  goto 156
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 149
	if_stmt : IF LP exp RP comp_stmt ELSE comp_stmt .  (29)

	.  reduce 29


state 150
	for_stmt : FOR LP SEMICOLON SEMICOLON exp RP comp_stmt .  (35)

	.  reduce 35


state 151
	for_stmt : FOR LP SEMICOLON exp SEMICOLON RP comp_stmt .  (36)

	.  reduce 36


state 152
	for_stmt : FOR LP SEMICOLON exp SEMICOLON exp RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 157
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 153
	for_stmt : FOR LP exp SEMICOLON SEMICOLON RP comp_stmt .  (37)

	.  reduce 37


state 154
	for_stmt : FOR LP exp SEMICOLON SEMICOLON exp RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 158
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 155
	for_stmt : FOR LP exp SEMICOLON exp SEMICOLON RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 159
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 156
	for_stmt : FOR LP exp SEMICOLON exp SEMICOLON exp . RP comp_stmt

	RP  shift 160


state 157
	for_stmt : FOR LP SEMICOLON exp SEMICOLON exp RP comp_stmt .  (32)

	.  reduce 32


state 158
	for_stmt : FOR LP exp SEMICOLON SEMICOLON exp RP comp_stmt .  (33)

	.  reduce 33


state 159
	for_stmt : FOR LP exp SEMICOLON exp SEMICOLON RP comp_stmt .  (34)

	.  reduce 34


state 160
	for_stmt : FOR LP exp SEMICOLON exp SEMICOLON exp RP . comp_stmt

	INT  shift 12
	CHAR  shift 13
	BOOL  shift 14
	ID  shift 15
	LB  shift 16
	LP  shift 17
	SEMICOLON  shift 18
	BNOT  shift 19
	NOT  shift 20
	IF  shift 21
	WHILE  shift 22
	DO  shift 23
	FOR  shift 24
	CIN  shift 25
	COUT  shift 26
	NUMBER  shift 27
	CONSTCHAR  shift 28

	comp_stmt  goto 161
	var_dec  goto 30
	if_stmt  goto 31
	exp_stmt  goto 32
	for_stmt  goto 33
	stmt  goto 34
	id  goto 35
	comp_exp  goto 36
	bor_exp  goto 37
	band_exp  goto 38
	sh_exp  goto 39
	type  goto 40
	io_stmt  goto 41
	while_stmt  goto 42
	exp  goto 43
	or_exp  goto 44
	assign_exp  goto 45
	and_exp  goto 46
	xor_exp  goto 47
	as_exp  goto 48
	term  goto 49
	factor  goto 50


state 161
	for_stmt : FOR LP exp SEMICOLON exp SEMICOLON exp RP comp_stmt .  (31)

	.  reduce 31


Rules never reduced
	stmt : exp_stmt  (14)
	exp_stmt : SEMICOLON  (42)


##############################################################################
# Summary
##############################################################################

State 18 contains 19 reduce-reduce conflict(s)
State 32 contains 19 reduce-reduce conflict(s)
State 78 contains 2 reduce-reduce conflict(s)
State 130 contains 2 reduce-reduce conflict(s)


44 token(s), 26 nonterminal(s)
79 grammar rule(s), 162 state(s)


##############################################################################
# End of File
##############################################################################
