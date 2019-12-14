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
# post.v
# YACC verbose file generated from post.y.
# 
# Date: 10/15/19
# Time: 20:34:02
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
   10       | ID

   11  ID : CHAR
   12     | ID CHAR

   13  CHAR : '0'
   14       | '1'
   15       | '2'
   16       | '3'
   17       | '4'
   18       | '5'
   19       | '6'
   20       | '7'
   21       | '8'
   22       | '9'
   23       | '_'
   24       | 'a'
   25       | 'b'
   26       | 'c'
   27       | 'd'
   28       | 'e'
   29       | 'f'
   30       | 'g'
   31       | 'h'
   32       | 'i'
   33       | 'j'
   34       | 'k'
   35       | 'l'
   36       | 'm'
   37       | 'n'
   38       | 'o'
   39       | 'p'
   40       | 'q'
   41       | 'r'
   42       | 's'
   43       | 't'
   44       | 'u'
   45       | 'v'
   46       | 'w'
   47       | 'x'
   48       | 'y'
   49       | 'z'
   50       | 'A'
   51       | 'B'
   52       | 'C'
   53       | 'D'
   54       | 'E'
   55       | 'F'
   56       | 'G'
   57       | 'H'
   58       | 'I'
   59       | 'J'
   60       | 'K'
   61       | 'L'
   62       | 'M'
   63       | 'N'
   64       | 'O'
   65       | 'P'
   66       | 'Q'
   67       | 'R'
   68       | 'S'
   69       | 'T'
   70       | 'U'
   71       | 'V'
   72       | 'W'
   73       | 'X'
   74       | 'Y'
   75       | 'Z'


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
	'0'  shift 2
	'1'  shift 3
	'2'  shift 4
	'3'  shift 5
	'4'  shift 6
	'5'  shift 7
	'6'  shift 8
	'7'  shift 9
	'8'  shift 10
	'9'  shift 11
	';'  shift 12
	'A'  shift 13
	'B'  shift 14
	'C'  shift 15
	'D'  shift 16
	'E'  shift 17
	'F'  shift 18
	'G'  shift 19
	'H'  shift 20
	'I'  shift 21
	'J'  shift 22
	'K'  shift 23
	'L'  shift 24
	'M'  shift 25
	'N'  shift 26
	'O'  shift 27
	'P'  shift 28
	'Q'  shift 29
	'R'  shift 30
	'S'  shift 31
	'T'  shift 32
	'U'  shift 33
	'V'  shift 34
	'W'  shift 35
	'X'  shift 36
	'Y'  shift 37
	'Z'  shift 38
	'_'  shift 39
	'a'  shift 40
	'b'  shift 41
	'c'  shift 42
	'd'  shift 43
	'e'  shift 44
	'f'  shift 45
	'g'  shift 46
	'h'  shift 47
	'i'  shift 48
	'j'  shift 49
	'k'  shift 50
	'l'  shift 51
	'm'  shift 52
	'n'  shift 53
	'o'  shift 54
	'p'  shift 55
	'q'  shift 56
	'r'  shift 57
	's'  shift 58
	't'  shift 59
	'u'  shift 60
	'v'  shift 61
	'w'  shift 62
	'x'  shift 63
	'y'  shift 64
	'z'  shift 65
	SUB  shift 66
	LP  shift 67

	expr  goto 68
	ID  goto 69
	CHAR  goto 70


state 2
	CHAR : '0' .  (13)

	.  reduce 13


state 3
	CHAR : '1' .  (14)

	.  reduce 14


state 4
	CHAR : '2' .  (15)

	.  reduce 15


state 5
	CHAR : '3' .  (16)

	.  reduce 16


state 6
	CHAR : '4' .  (17)

	.  reduce 17


state 7
	CHAR : '5' .  (18)

	.  reduce 18


state 8
	CHAR : '6' .  (19)

	.  reduce 19


state 9
	CHAR : '7' .  (20)

	.  reduce 20


state 10
	CHAR : '8' .  (21)

	.  reduce 21


state 11
	CHAR : '9' .  (22)

	.  reduce 22


state 12
	lines : lines ';' .  (2)

	.  reduce 2


state 13
	CHAR : 'A' .  (50)

	.  reduce 50


state 14
	CHAR : 'B' .  (51)

	.  reduce 51


state 15
	CHAR : 'C' .  (52)

	.  reduce 52


state 16
	CHAR : 'D' .  (53)

	.  reduce 53


state 17
	CHAR : 'E' .  (54)

	.  reduce 54


state 18
	CHAR : 'F' .  (55)

	.  reduce 55


state 19
	CHAR : 'G' .  (56)

	.  reduce 56


state 20
	CHAR : 'H' .  (57)

	.  reduce 57


state 21
	CHAR : 'I' .  (58)

	.  reduce 58


state 22
	CHAR : 'J' .  (59)

	.  reduce 59


state 23
	CHAR : 'K' .  (60)

	.  reduce 60


state 24
	CHAR : 'L' .  (61)

	.  reduce 61


state 25
	CHAR : 'M' .  (62)

	.  reduce 62


state 26
	CHAR : 'N' .  (63)

	.  reduce 63


state 27
	CHAR : 'O' .  (64)

	.  reduce 64


state 28
	CHAR : 'P' .  (65)

	.  reduce 65


state 29
	CHAR : 'Q' .  (66)

	.  reduce 66


state 30
	CHAR : 'R' .  (67)

	.  reduce 67


state 31
	CHAR : 'S' .  (68)

	.  reduce 68


state 32
	CHAR : 'T' .  (69)

	.  reduce 69


state 33
	CHAR : 'U' .  (70)

	.  reduce 70


state 34
	CHAR : 'V' .  (71)

	.  reduce 71


state 35
	CHAR : 'W' .  (72)

	.  reduce 72


state 36
	CHAR : 'X' .  (73)

	.  reduce 73


state 37
	CHAR : 'Y' .  (74)

	.  reduce 74


state 38
	CHAR : 'Z' .  (75)

	.  reduce 75


state 39
	CHAR : '_' .  (23)

	.  reduce 23


state 40
	CHAR : 'a' .  (24)

	.  reduce 24


state 41
	CHAR : 'b' .  (25)

	.  reduce 25


state 42
	CHAR : 'c' .  (26)

	.  reduce 26


state 43
	CHAR : 'd' .  (27)

	.  reduce 27


state 44
	CHAR : 'e' .  (28)

	.  reduce 28


state 45
	CHAR : 'f' .  (29)

	.  reduce 29


state 46
	CHAR : 'g' .  (30)

	.  reduce 30


state 47
	CHAR : 'h' .  (31)

	.  reduce 31


state 48
	CHAR : 'i' .  (32)

	.  reduce 32


state 49
	CHAR : 'j' .  (33)

	.  reduce 33


state 50
	CHAR : 'k' .  (34)

	.  reduce 34


state 51
	CHAR : 'l' .  (35)

	.  reduce 35


state 52
	CHAR : 'm' .  (36)

	.  reduce 36


state 53
	CHAR : 'n' .  (37)

	.  reduce 37


state 54
	CHAR : 'o' .  (38)

	.  reduce 38


state 55
	CHAR : 'p' .  (39)

	.  reduce 39


state 56
	CHAR : 'q' .  (40)

	.  reduce 40


state 57
	CHAR : 'r' .  (41)

	.  reduce 41


state 58
	CHAR : 's' .  (42)

	.  reduce 42


state 59
	CHAR : 't' .  (43)

	.  reduce 43


state 60
	CHAR : 'u' .  (44)

	.  reduce 44


state 61
	CHAR : 'v' .  (45)

	.  reduce 45


state 62
	CHAR : 'w' .  (46)

	.  reduce 46


state 63
	CHAR : 'x' .  (47)

	.  reduce 47


state 64
	CHAR : 'y' .  (48)

	.  reduce 48


state 65
	CHAR : 'z' .  (49)

	.  reduce 49


state 66
	expr : SUB . expr

	'0'  shift 2
	'1'  shift 3
	'2'  shift 4
	'3'  shift 5
	'4'  shift 6
	'5'  shift 7
	'6'  shift 8
	'7'  shift 9
	'8'  shift 10
	'9'  shift 11
	'A'  shift 13
	'B'  shift 14
	'C'  shift 15
	'D'  shift 16
	'E'  shift 17
	'F'  shift 18
	'G'  shift 19
	'H'  shift 20
	'I'  shift 21
	'J'  shift 22
	'K'  shift 23
	'L'  shift 24
	'M'  shift 25
	'N'  shift 26
	'O'  shift 27
	'P'  shift 28
	'Q'  shift 29
	'R'  shift 30
	'S'  shift 31
	'T'  shift 32
	'U'  shift 33
	'V'  shift 34
	'W'  shift 35
	'X'  shift 36
	'Y'  shift 37
	'Z'  shift 38
	'_'  shift 39
	'a'  shift 40
	'b'  shift 41
	'c'  shift 42
	'd'  shift 43
	'e'  shift 44
	'f'  shift 45
	'g'  shift 46
	'h'  shift 47
	'i'  shift 48
	'j'  shift 49
	'k'  shift 50
	'l'  shift 51
	'm'  shift 52
	'n'  shift 53
	'o'  shift 54
	'p'  shift 55
	'q'  shift 56
	'r'  shift 57
	's'  shift 58
	't'  shift 59
	'u'  shift 60
	'v'  shift 61
	'w'  shift 62
	'x'  shift 63
	'y'  shift 64
	'z'  shift 65
	SUB  shift 66
	LP  shift 67

	expr  goto 71
	ID  goto 69
	CHAR  goto 70


state 67
	expr : LP . expr RP

	'0'  shift 2
	'1'  shift 3
	'2'  shift 4
	'3'  shift 5
	'4'  shift 6
	'5'  shift 7
	'6'  shift 8
	'7'  shift 9
	'8'  shift 10
	'9'  shift 11
	'A'  shift 13
	'B'  shift 14
	'C'  shift 15
	'D'  shift 16
	'E'  shift 17
	'F'  shift 18
	'G'  shift 19
	'H'  shift 20
	'I'  shift 21
	'J'  shift 22
	'K'  shift 23
	'L'  shift 24
	'M'  shift 25
	'N'  shift 26
	'O'  shift 27
	'P'  shift 28
	'Q'  shift 29
	'R'  shift 30
	'S'  shift 31
	'T'  shift 32
	'U'  shift 33
	'V'  shift 34
	'W'  shift 35
	'X'  shift 36
	'Y'  shift 37
	'Z'  shift 38
	'_'  shift 39
	'a'  shift 40
	'b'  shift 41
	'c'  shift 42
	'd'  shift 43
	'e'  shift 44
	'f'  shift 45
	'g'  shift 46
	'h'  shift 47
	'i'  shift 48
	'j'  shift 49
	'k'  shift 50
	'l'  shift 51
	'm'  shift 52
	'n'  shift 53
	'o'  shift 54
	'p'  shift 55
	'q'  shift 56
	'r'  shift 57
	's'  shift 58
	't'  shift 59
	'u'  shift 60
	'v'  shift 61
	'w'  shift 62
	'x'  shift 63
	'y'  shift 64
	'z'  shift 65
	SUB  shift 66
	LP  shift 67

	expr  goto 72
	ID  goto 69
	CHAR  goto 70


state 68
	lines : lines expr . ';'
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	';'  shift 73
	ADD  shift 74
	SUB  shift 75
	MUL  shift 76
	DIV  shift 77


state 69
	ID : ID . CHAR
	expr : ID .  (10)

	'0'  shift 2
	'1'  shift 3
	'2'  shift 4
	'3'  shift 5
	'4'  shift 6
	'5'  shift 7
	'6'  shift 8
	'7'  shift 9
	'8'  shift 10
	'9'  shift 11
	'A'  shift 13
	'B'  shift 14
	'C'  shift 15
	'D'  shift 16
	'E'  shift 17
	'F'  shift 18
	'G'  shift 19
	'H'  shift 20
	'I'  shift 21
	'J'  shift 22
	'K'  shift 23
	'L'  shift 24
	'M'  shift 25
	'N'  shift 26
	'O'  shift 27
	'P'  shift 28
	'Q'  shift 29
	'R'  shift 30
	'S'  shift 31
	'T'  shift 32
	'U'  shift 33
	'V'  shift 34
	'W'  shift 35
	'X'  shift 36
	'Y'  shift 37
	'Z'  shift 38
	'_'  shift 39
	'a'  shift 40
	'b'  shift 41
	'c'  shift 42
	'd'  shift 43
	'e'  shift 44
	'f'  shift 45
	'g'  shift 46
	'h'  shift 47
	'i'  shift 48
	'j'  shift 49
	'k'  shift 50
	'l'  shift 51
	'm'  shift 52
	'n'  shift 53
	'o'  shift 54
	'p'  shift 55
	'q'  shift 56
	'r'  shift 57
	's'  shift 58
	't'  shift 59
	'u'  shift 60
	'v'  shift 61
	'w'  shift 62
	'x'  shift 63
	'y'  shift 64
	'z'  shift 65
	.  reduce 10

	CHAR  goto 78


state 70
	ID : CHAR .  (11)

	.  reduce 11


state 71
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : SUB expr .  (9)

	.  reduce 9


state 72
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : LP expr . RP

	ADD  shift 74
	SUB  shift 75
	MUL  shift 76
	DIV  shift 77
	RP  shift 79


state 73
	lines : lines expr ';' .  (1)

	.  reduce 1


state 74
	expr : expr ADD . expr

	'0'  shift 2
	'1'  shift 3
	'2'  shift 4
	'3'  shift 5
	'4'  shift 6
	'5'  shift 7
	'6'  shift 8
	'7'  shift 9
	'8'  shift 10
	'9'  shift 11
	'A'  shift 13
	'B'  shift 14
	'C'  shift 15
	'D'  shift 16
	'E'  shift 17
	'F'  shift 18
	'G'  shift 19
	'H'  shift 20
	'I'  shift 21
	'J'  shift 22
	'K'  shift 23
	'L'  shift 24
	'M'  shift 25
	'N'  shift 26
	'O'  shift 27
	'P'  shift 28
	'Q'  shift 29
	'R'  shift 30
	'S'  shift 31
	'T'  shift 32
	'U'  shift 33
	'V'  shift 34
	'W'  shift 35
	'X'  shift 36
	'Y'  shift 37
	'Z'  shift 38
	'_'  shift 39
	'a'  shift 40
	'b'  shift 41
	'c'  shift 42
	'd'  shift 43
	'e'  shift 44
	'f'  shift 45
	'g'  shift 46
	'h'  shift 47
	'i'  shift 48
	'j'  shift 49
	'k'  shift 50
	'l'  shift 51
	'm'  shift 52
	'n'  shift 53
	'o'  shift 54
	'p'  shift 55
	'q'  shift 56
	'r'  shift 57
	's'  shift 58
	't'  shift 59
	'u'  shift 60
	'v'  shift 61
	'w'  shift 62
	'x'  shift 63
	'y'  shift 64
	'z'  shift 65
	SUB  shift 66
	LP  shift 67

	expr  goto 80
	ID  goto 69
	CHAR  goto 70


state 75
	expr : expr SUB . expr

	'0'  shift 2
	'1'  shift 3
	'2'  shift 4
	'3'  shift 5
	'4'  shift 6
	'5'  shift 7
	'6'  shift 8
	'7'  shift 9
	'8'  shift 10
	'9'  shift 11
	'A'  shift 13
	'B'  shift 14
	'C'  shift 15
	'D'  shift 16
	'E'  shift 17
	'F'  shift 18
	'G'  shift 19
	'H'  shift 20
	'I'  shift 21
	'J'  shift 22
	'K'  shift 23
	'L'  shift 24
	'M'  shift 25
	'N'  shift 26
	'O'  shift 27
	'P'  shift 28
	'Q'  shift 29
	'R'  shift 30
	'S'  shift 31
	'T'  shift 32
	'U'  shift 33
	'V'  shift 34
	'W'  shift 35
	'X'  shift 36
	'Y'  shift 37
	'Z'  shift 38
	'_'  shift 39
	'a'  shift 40
	'b'  shift 41
	'c'  shift 42
	'd'  shift 43
	'e'  shift 44
	'f'  shift 45
	'g'  shift 46
	'h'  shift 47
	'i'  shift 48
	'j'  shift 49
	'k'  shift 50
	'l'  shift 51
	'm'  shift 52
	'n'  shift 53
	'o'  shift 54
	'p'  shift 55
	'q'  shift 56
	'r'  shift 57
	's'  shift 58
	't'  shift 59
	'u'  shift 60
	'v'  shift 61
	'w'  shift 62
	'x'  shift 63
	'y'  shift 64
	'z'  shift 65
	SUB  shift 66
	LP  shift 67

	expr  goto 81
	ID  goto 69
	CHAR  goto 70


state 76
	expr : expr MUL . expr

	'0'  shift 2
	'1'  shift 3
	'2'  shift 4
	'3'  shift 5
	'4'  shift 6
	'5'  shift 7
	'6'  shift 8
	'7'  shift 9
	'8'  shift 10
	'9'  shift 11
	'A'  shift 13
	'B'  shift 14
	'C'  shift 15
	'D'  shift 16
	'E'  shift 17
	'F'  shift 18
	'G'  shift 19
	'H'  shift 20
	'I'  shift 21
	'J'  shift 22
	'K'  shift 23
	'L'  shift 24
	'M'  shift 25
	'N'  shift 26
	'O'  shift 27
	'P'  shift 28
	'Q'  shift 29
	'R'  shift 30
	'S'  shift 31
	'T'  shift 32
	'U'  shift 33
	'V'  shift 34
	'W'  shift 35
	'X'  shift 36
	'Y'  shift 37
	'Z'  shift 38
	'_'  shift 39
	'a'  shift 40
	'b'  shift 41
	'c'  shift 42
	'd'  shift 43
	'e'  shift 44
	'f'  shift 45
	'g'  shift 46
	'h'  shift 47
	'i'  shift 48
	'j'  shift 49
	'k'  shift 50
	'l'  shift 51
	'm'  shift 52
	'n'  shift 53
	'o'  shift 54
	'p'  shift 55
	'q'  shift 56
	'r'  shift 57
	's'  shift 58
	't'  shift 59
	'u'  shift 60
	'v'  shift 61
	'w'  shift 62
	'x'  shift 63
	'y'  shift 64
	'z'  shift 65
	SUB  shift 66
	LP  shift 67

	expr  goto 82
	ID  goto 69
	CHAR  goto 70


state 77
	expr : expr DIV . expr

	'0'  shift 2
	'1'  shift 3
	'2'  shift 4
	'3'  shift 5
	'4'  shift 6
	'5'  shift 7
	'6'  shift 8
	'7'  shift 9
	'8'  shift 10
	'9'  shift 11
	'A'  shift 13
	'B'  shift 14
	'C'  shift 15
	'D'  shift 16
	'E'  shift 17
	'F'  shift 18
	'G'  shift 19
	'H'  shift 20
	'I'  shift 21
	'J'  shift 22
	'K'  shift 23
	'L'  shift 24
	'M'  shift 25
	'N'  shift 26
	'O'  shift 27
	'P'  shift 28
	'Q'  shift 29
	'R'  shift 30
	'S'  shift 31
	'T'  shift 32
	'U'  shift 33
	'V'  shift 34
	'W'  shift 35
	'X'  shift 36
	'Y'  shift 37
	'Z'  shift 38
	'_'  shift 39
	'a'  shift 40
	'b'  shift 41
	'c'  shift 42
	'd'  shift 43
	'e'  shift 44
	'f'  shift 45
	'g'  shift 46
	'h'  shift 47
	'i'  shift 48
	'j'  shift 49
	'k'  shift 50
	'l'  shift 51
	'm'  shift 52
	'n'  shift 53
	'o'  shift 54
	'p'  shift 55
	'q'  shift 56
	'r'  shift 57
	's'  shift 58
	't'  shift 59
	'u'  shift 60
	'v'  shift 61
	'w'  shift 62
	'x'  shift 63
	'y'  shift 64
	'z'  shift 65
	SUB  shift 66
	LP  shift 67

	expr  goto 83
	ID  goto 69
	CHAR  goto 70


state 78
	ID : ID CHAR .  (12)

	.  reduce 12


state 79
	expr : LP expr RP .  (8)

	.  reduce 8


state 80
	expr : expr ADD expr .  (4)
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 76
	DIV  shift 77
	.  reduce 4


state 81
	expr : expr . ADD expr
	expr : expr SUB expr .  (5)
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 76
	DIV  shift 77
	.  reduce 5


state 82
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr MUL expr .  (6)
	expr : expr . MUL expr
	expr : expr . DIV expr

	.  reduce 6


state 83
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr DIV expr .  (7)
	expr : expr . DIV expr

	.  reduce 7


##############################################################################
# Summary
##############################################################################

73 token(s), 5 nonterminal(s)
76 grammar rule(s), 84 state(s)


##############################################################################
# End of File
##############################################################################
