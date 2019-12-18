	.486
	.model flat, stdcall
	option casemap :none

	include \masm32\macros\macros.asm
	include \masm32\include\msvcrt.inc
	includelib \masm32\lib\msvcrt.lib
	include \masm32\include\masm32.inc
	includelib \masm32\lib\masm32.lib
	include \masm32\include\user32.inc
	include \masm32\include\kernel32.inc
	includelib \masm32\lib\user32.lib
	includelib \masm32\lib\kernel32.lib


	.data
		_a DWORD 0
		_b DWORD 0
		_c DWORD 0
		_D BYTE 0
		t0 DWORD 0
		t1 DWORD 0
		t2 DWORD 0
		t3 DWORD 0
		t4 DWORD 0
		t5 DWORD 0
		t6 DWORD 0


	.code
	_start:
		MOV eax, 5
		MOV _a, eax
		MOV eax, 7
		MOV _c, eax
		invoke crt_scanf, SADD("%d",0), addr _b
		invoke StdIn,addr _D,8
		MOV eax,0
		MOV al,_D
		invoke crt_printf, SADD("%c", 13, 10), eax
		MOV eax, 0
		MOV al, 80
		MOV _D, al
		MOV eax,0
		MOV al,_D
		invoke crt_printf, SADD("%c", 13, 10), eax
	L0:
		MOV eax, _a
		ADD eax, 3
		MOV t0, eax
		MOV eax, _b
		ADD eax, 1
		MOV t1, eax
		MOV eax, t1
		ADD eax, 2
		MOV t1, eax
		MOV eax,t0
		CMP eax, t1
		jl L4
		jmp L3
	L4:
		MOV eax, _a
		CMP eax, _b
		je L3
		jmp L1
	L3:
		MOV eax, 1
		CMP eax, 1
		jne L1
		jmp L2
	L1:
		MOV eax, _a
		ADD eax, 1
		MOV t2, eax
		MOV eax, t2
		MOV _a, eax
		jmp L0
	L2:
		MOV eax, _c
		ADD eax, 1
		MOV t3, eax
		MOV eax, t3
		MOV _c, eax
	L5:
		MOV eax, _a
		CMP eax, _b
		jge L6
		jmp L7
	L6:
		invoke crt_printf, SADD("%d", 13, 10), _b
		MOV eax, _b
		ADD eax, 1
		MOV t4, eax
		MOV eax, t4
		MOV _b, eax
		jmp L5
	L7:
		invoke crt_printf, SADD("%d", 13, 10), _a
		invoke crt_printf, SADD("%d", 13, 10), _b
		MOV eax, _a
		CMP eax, _c
		je L10
		jmp L8
	L8:
		MOV eax, 10
		MOV _b, eax
		invoke crt_printf, SADD("%d", 13, 10), _c
		jmp L9
	L10:
		MOV eax, 100
		MOV _a, eax
		invoke crt_printf, SADD("%d", 13, 10), _c
		jmp L9
	L9:
		MOV eax, _c
		SUB eax, 1
		MOV t5, eax
		MOV eax, t5
		MOV _c, eax
		invoke crt_printf, SADD("%d", 13, 10), _a
		invoke crt_printf, SADD("%d", 13, 10), _b
		invoke crt_printf, SADD("%d", 13, 10), _c
		MOV eax, _b
		IMUL eax, _c
		MOV t6, eax
		MOV eax, _a
		ADD eax, t6
		MOV t6, eax
		invoke crt_printf, SADD("%d", 13, 10), t6
	L11:
		MOV eax, _a
		CMP eax, 0
		je L12
		jmp L13
	L12:
		MOV eax,0
		MOV al,_D
		invoke crt_printf, SADD("%c", 13, 10), eax
		jmp L11
	L13:
		invoke crt_printf, SADD("print any key to continue...")
		invoke crt__getch
		invoke crt__exit, 0
	end _start
