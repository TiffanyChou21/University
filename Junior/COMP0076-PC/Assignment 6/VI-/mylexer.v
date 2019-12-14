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
# mylexer.v
# Lex verbose file generated from mylexer.l.
# 
# Date: 11/27/19
# Time: 18:44:56
# 
# ALex Version: 2.07
#############################################################################


#############################################################################
# Expressions
#############################################################################

    1  ("/*"([^*"]*|".*"|\*+[^/])*\**"*/")|("//".*)

    2  [\t\r\f\v]+

    3  [\n]

    4  "main"

    5  "int"

    6  "char"

    7  "void"

    8  "bool"

    9  "double"

   10  "cin"

   11  "cout"

   12  if

   13  else

   14  while

   15  do

   16  for

   17  break

   18  return

   19  "+"

   20  "-"

   21  "*"

   22  "/"

   23  "%"

   24  "++"

   25  "--"

   26  "="

   27  "{"

   28  "}"

   29  "("

   30  ")"

   31  "["

   32  "]"

   33  ";"

   34  ","

   35  "=="

   36  ">"

   37  "<"

   38  ">="

   39  "<="

   40  "!="

   41  "~"

   42  "&"

   43  "|"

   44  "&&"

   45  "||"

   46  "!"

   47  "^"

   48  "<<"

   49  ">>"

   50  \'([^\n\\]|(\\.))\'

   51  [_a-zA-Z][_a-zA-Z0-9]*

   52  [0-9]+(\.[0-9]+)?(E[+-]?[0-9]+)?

   53  .


#############################################################################
# States
#############################################################################

state 1
	INITIAL

	0x00 - 0x08 (9)    goto 3
	0x09               goto 4
	0x0a               goto 5
	0x0b - 0x0d (3)    goto 4
	0x0e - 0x20 (19)   goto 3
	0x21               goto 6
	0x22 - 0x24 (3)    goto 3
	0x25               goto 7
	0x26               goto 8
	0x27               goto 9
	0x28               goto 10
	0x29               goto 11
	0x2a               goto 12
	0x2b               goto 13
	0x2c               goto 14
	0x2d               goto 15
	0x2e               goto 3
	0x2f               goto 16
	0x30 - 0x39 (10)   goto 17
	0x3a               goto 3
	0x3b               goto 18
	0x3c               goto 19
	0x3d               goto 20
	0x3e               goto 21
	0x3f - 0x40 (2)    goto 3
	0x41 - 0x5a (26)   goto 22
	0x5b               goto 23
	0x5c               goto 3
	0x5d               goto 24
	0x5e               goto 25
	0x5f               goto 22
	0x60               goto 3
	0x61               goto 22
	0x62               goto 26
	0x63               goto 27
	0x64               goto 28
	0x65               goto 29
	0x66               goto 30
	0x67 - 0x68 (2)    goto 22
	0x69               goto 31
	0x6a - 0x6c (3)    goto 22
	0x6d               goto 32
	0x6e - 0x71 (4)    goto 22
	0x72               goto 33
	0x73 - 0x75 (3)    goto 22
	0x76               goto 34
	0x77               goto 35
	0x78 - 0x7a (3)    goto 22
	0x7b               goto 36
	0x7c               goto 37
	0x7d               goto 38
	0x7e               goto 39
	0x7f - 0xff (129)  goto 3


state 2
	^INITIAL

	0x00 - 0x08 (9)    goto 3
	0x09               goto 4
	0x0a               goto 5
	0x0b - 0x0d (3)    goto 4
	0x0e - 0x20 (19)   goto 3
	0x21               goto 6
	0x22 - 0x24 (3)    goto 3
	0x25               goto 7
	0x26               goto 8
	0x27               goto 9
	0x28               goto 10
	0x29               goto 11
	0x2a               goto 12
	0x2b               goto 13
	0x2c               goto 14
	0x2d               goto 15
	0x2e               goto 3
	0x2f               goto 16
	0x30 - 0x39 (10)   goto 17
	0x3a               goto 3
	0x3b               goto 18
	0x3c               goto 19
	0x3d               goto 20
	0x3e               goto 21
	0x3f - 0x40 (2)    goto 3
	0x41 - 0x5a (26)   goto 22
	0x5b               goto 23
	0x5c               goto 3
	0x5d               goto 24
	0x5e               goto 25
	0x5f               goto 22
	0x60               goto 3
	0x61               goto 22
	0x62               goto 26
	0x63               goto 27
	0x64               goto 28
	0x65               goto 29
	0x66               goto 30
	0x67 - 0x68 (2)    goto 22
	0x69               goto 31
	0x6a - 0x6c (3)    goto 22
	0x6d               goto 32
	0x6e - 0x71 (4)    goto 22
	0x72               goto 33
	0x73 - 0x75 (3)    goto 22
	0x76               goto 34
	0x77               goto 35
	0x78 - 0x7a (3)    goto 22
	0x7b               goto 36
	0x7c               goto 37
	0x7d               goto 38
	0x7e               goto 39
	0x7f - 0xff (129)  goto 3


state 3
	match 53


state 4
	0x09               goto 4
	0x0b - 0x0d (3)    goto 4

	match 2


state 5
	match 3


state 6
	0x3d               goto 40

	match 46


state 7
	match 23


state 8
	0x26               goto 41

	match 42


state 9
	0x00 - 0x09 (10)   goto 42
	0x0b - 0x5b (81)   goto 42
	0x5c               goto 43
	0x5d - 0xff (163)  goto 42

	match 53


state 10
	match 29


state 11
	match 30


state 12
	match 21


state 13
	0x2b               goto 44

	match 19


state 14
	match 34


state 15
	0x2d               goto 45

	match 20


state 16
	0x2a               goto 46
	0x2f               goto 47

	match 22


state 17
	0x2e               goto 48
	0x30 - 0x39 (10)   goto 17
	0x45               goto 49

	match 52


state 18
	match 33


state 19
	0x3c               goto 50
	0x3d               goto 51

	match 37


state 20
	0x3d               goto 52

	match 26


state 21
	0x3d               goto 53
	0x3e               goto 54

	match 36


state 22
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 51


state 23
	match 31


state 24
	match 32


state 25
	match 47


state 26
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6e (14)   goto 22
	0x6f               goto 55
	0x70 - 0x71 (2)    goto 22
	0x72               goto 56
	0x73 - 0x7a (8)    goto 22

	match 51


state 27
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x67 (7)    goto 22
	0x68               goto 57
	0x69               goto 58
	0x6a - 0x6e (5)    goto 22
	0x6f               goto 59
	0x70 - 0x7a (11)   goto 22

	match 51


state 28
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6e (14)   goto 22
	0x6f               goto 60
	0x70 - 0x7a (11)   goto 22

	match 51


state 29
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6b (11)   goto 22
	0x6c               goto 61
	0x6d - 0x7a (14)   goto 22

	match 51


state 30
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6e (14)   goto 22
	0x6f               goto 62
	0x70 - 0x7a (11)   goto 22

	match 51


state 31
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x65 (5)    goto 22
	0x66               goto 63
	0x67 - 0x6d (7)    goto 22
	0x6e               goto 64
	0x6f - 0x7a (12)   goto 22

	match 51


state 32
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61               goto 65
	0x62 - 0x7a (25)   goto 22

	match 51


state 33
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x64 (4)    goto 22
	0x65               goto 66
	0x66 - 0x7a (21)   goto 22

	match 51


state 34
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6e (14)   goto 22
	0x6f               goto 67
	0x70 - 0x7a (11)   goto 22

	match 51


state 35
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x67 (7)    goto 22
	0x68               goto 68
	0x69 - 0x7a (18)   goto 22

	match 51


state 36
	match 27


state 37
	0x7c               goto 69

	match 43


state 38
	match 28


state 39
	match 41


state 40
	match 40


state 41
	match 44


state 42
	0x27               goto 70


state 43
	0x00 - 0x09 (10)   goto 42
	0x0b - 0xff (245)  goto 42


state 44
	match 24


state 45
	match 25


state 46
	0x00 - 0x21 (34)   goto 46
	0x23 - 0x29 (7)    goto 46
	0x2a               goto 71
	0x2b - 0x2d (3)    goto 46
	0x2e               goto 72
	0x2f - 0xff (209)  goto 46


state 47
	0x00 - 0x09 (10)   goto 47
	0x0b - 0xff (245)  goto 47

	match 1


state 48
	0x30 - 0x39 (10)   goto 73


state 49
	0x2b               goto 74
	0x2d               goto 74
	0x30 - 0x39 (10)   goto 75


state 50
	match 48


state 51
	match 39


state 52
	match 35


state 53
	match 38


state 54
	match 49


state 55
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6e (14)   goto 22
	0x6f               goto 76
	0x70 - 0x7a (11)   goto 22

	match 51


state 56
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x64 (4)    goto 22
	0x65               goto 77
	0x66 - 0x7a (21)   goto 22

	match 51


state 57
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61               goto 78
	0x62 - 0x7a (25)   goto 22

	match 51


state 58
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6d (13)   goto 22
	0x6e               goto 79
	0x6f - 0x7a (12)   goto 22

	match 51


state 59
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x74 (20)   goto 22
	0x75               goto 80
	0x76 - 0x7a (5)    goto 22

	match 51


state 60
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x74 (20)   goto 22
	0x75               goto 81
	0x76 - 0x7a (5)    goto 22

	match 15


state 61
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x72 (18)   goto 22
	0x73               goto 82
	0x74 - 0x7a (7)    goto 22

	match 51


state 62
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x71 (17)   goto 22
	0x72               goto 83
	0x73 - 0x7a (8)    goto 22

	match 51


state 63
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 12


state 64
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x73 (19)   goto 22
	0x74               goto 84
	0x75 - 0x7a (6)    goto 22

	match 51


state 65
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x68 (8)    goto 22
	0x69               goto 85
	0x6a - 0x7a (17)   goto 22

	match 51


state 66
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x73 (19)   goto 22
	0x74               goto 86
	0x75 - 0x7a (6)    goto 22

	match 51


state 67
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x68 (8)    goto 22
	0x69               goto 87
	0x6a - 0x7a (17)   goto 22

	match 51


state 68
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x68 (8)    goto 22
	0x69               goto 88
	0x6a - 0x7a (17)   goto 22

	match 51


state 69
	match 45


state 70
	match 50


state 71
	0x00 - 0x29 (42)   goto 46
	0x2a               goto 89
	0x2b - 0x2e (4)    goto 46
	0x2f               goto 90
	0x30 - 0xff (208)  goto 46


state 72
	0x00 - 0x21 (34)   goto 46
	0x23 - 0x29 (7)    goto 46
	0x2a               goto 89
	0x2b - 0x2d (3)    goto 46
	0x2e               goto 72
	0x2f - 0xff (209)  goto 46


state 73
	0x30 - 0x39 (10)   goto 73
	0x45               goto 49

	match 52


state 74
	0x30 - 0x39 (10)   goto 75


state 75
	0x30 - 0x39 (10)   goto 75

	match 52


state 76
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6b (11)   goto 22
	0x6c               goto 91
	0x6d - 0x7a (14)   goto 22

	match 51


state 77
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61               goto 92
	0x62 - 0x7a (25)   goto 22

	match 51


state 78
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x71 (17)   goto 22
	0x72               goto 93
	0x73 - 0x7a (8)    goto 22

	match 51


state 79
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 10


state 80
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x73 (19)   goto 22
	0x74               goto 94
	0x75 - 0x7a (6)    goto 22

	match 51


state 81
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61               goto 22
	0x62               goto 95
	0x63 - 0x7a (24)   goto 22

	match 51


state 82
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x64 (4)    goto 22
	0x65               goto 96
	0x66 - 0x7a (21)   goto 22

	match 51


state 83
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 16


state 84
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 5


state 85
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6d (13)   goto 22
	0x6e               goto 97
	0x6f - 0x7a (12)   goto 22

	match 51


state 86
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x74 (20)   goto 22
	0x75               goto 98
	0x76 - 0x7a (5)    goto 22

	match 51


state 87
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x63 (3)    goto 22
	0x64               goto 99
	0x65 - 0x7a (22)   goto 22

	match 51


state 88
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6b (11)   goto 22
	0x6c               goto 100
	0x6d - 0x7a (14)   goto 22

	match 51


state 89
	0x00 - 0x21 (34)   goto 46
	0x22               goto 46
	0x23 - 0x29 (7)    goto 46
	0x2a               goto 89
	0x2b - 0x2d (3)    goto 46
	0x2e               goto 72
	0x2f               goto 101
	0x30 - 0xff (208)  goto 46


state 90
	match 1


state 91
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 8


state 92
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6a (10)   goto 22
	0x6b               goto 102
	0x6c - 0x7a (15)   goto 22

	match 51


state 93
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 6


state 94
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 11


state 95
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6b (11)   goto 22
	0x6c               goto 103
	0x6d - 0x7a (14)   goto 22

	match 51


state 96
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 13


state 97
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 4


state 98
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x71 (17)   goto 22
	0x72               goto 104
	0x73 - 0x7a (8)    goto 22

	match 51


state 99
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 7


state 100
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x64 (4)    goto 22
	0x65               goto 105
	0x66 - 0x7a (21)   goto 22

	match 51


state 101
	0x00 - 0x21 (34)   goto 46
	0x23 - 0x29 (7)    goto 46
	0x2a               goto 71
	0x2b - 0x2d (3)    goto 46
	0x2e               goto 72
	0x2f - 0xff (209)  goto 46

	match 1


state 102
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 17


state 103
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x64 (4)    goto 22
	0x65               goto 106
	0x66 - 0x7a (21)   goto 22

	match 51


state 104
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x6d (13)   goto 22
	0x6e               goto 107
	0x6f - 0x7a (12)   goto 22

	match 51


state 105
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 14


state 106
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 9


state 107
	0x30 - 0x39 (10)   goto 22
	0x41 - 0x5a (26)   goto 22
	0x5f               goto 22
	0x61 - 0x7a (26)   goto 22

	match 18


#############################################################################
# Summary
#############################################################################

1 start state(s)
53 expression(s), 107 state(s)


#############################################################################
# End of File
#############################################################################
