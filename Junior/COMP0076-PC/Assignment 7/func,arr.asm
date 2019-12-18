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
		_c BYTE 0
		_y DWORD 0
		_z DWORD 0
		_m DWORD 0
		_i DWORD 0
		_t DWORD 0
		_g DWORD 0
		_h DWORD 0
		_k DWORD 0
		_d BYTE 0
		_a DWORD 0
		_b DWORD 0
		_n DWORD 0
		_te DWORD 10 dup(0)
		t0 DWORD 0
		t1 DWORD 0
		t2 DWORD 0
		t3 DWORD 0
		t4 DWORD 0


	.code
	io:
		push ebp
		MOV ebp,esp
		push ebx
		MOV bx,WORD ptr[ebp+8]
		MOV _c,bl
		MOV eax,0
		MOV al,_c
		invoke crt_printf, SADD("%c", 13, 10), eax
		pop ebx
		pop ebp
		ret
	fib:
		push ebp
		MOV ebp,esp
		push ebx
		MOV ebx, DWORD ptr[ebp+16]
		MOV _y,ebx
		MOV ebx, DWORD ptr[ebp+12]
		MOV _z,ebx
		MOV ebx, DWORD ptr[ebp+8]
		MOV _m,ebx
		MOV eax, 1
		MOV _i, eax
		invoke crt_printf, SADD("%d", 13, 10), _y
		invoke crt_printf, SADD("%d", 13, 10), _z
	L0:
		MOV eax,_i
		CMP eax, _m
		jl L1
		jmp L2
	L1:
		MOV eax, _z
		MOV _t, eax
		MOV eax, _y
		ADD eax, _z
		MOV t0, eax
		MOV eax, t0
		MOV _z, eax
		invoke crt_printf, SADD("%d", 13, 10), _z
		MOV eax, _t
		MOV _y, eax
		MOV eax, _i
		ADD eax, 1
		MOV t1, eax
		MOV eax, t1
		MOV _i, eax
		jmp L0
	L2:
		MOV eax,_z
		pop ebx
		pop ebp
		ret
	fac:
		MOV eax, 2
		MOV _g, eax
		MOV eax, 10
		MOV _h, eax
		MOV eax, 1
		MOV _k, eax
	L3:
		MOV eax, _g
		CMP eax, _h
		jle L4
		jmp L5
	L4:
		MOV eax, _k
		IMUL eax, _g
		MOV t2, eax
		MOV eax, t2
		MOV _k, eax
		MOV eax, _g
		INC eax
		MOV _g, eax
		jmp L3
	L5:
		invoke crt_printf, SADD("%d", 13, 10), _k
		ret
	_start:
		MOV eax, 0
		MOV al, 66
		MOV _d, al
		MOV bl,_d
		push bx
		call io
		pop bx
		MOV eax, 0
		MOV _a, eax
		MOV eax, 1
		MOV _b, eax
		invoke crt_scanf, SADD("%d",0), addr _n
		MOV ebx,_a
		push ebx
		MOV ebx,_b
		push ebx
		MOV ebx,_n
		push ebx
		call fib
		pop ebx
		pop ebx
		pop ebx
		MOV ebx,0
		MOV _te[4*ebx],eax
		push ebx
		call fac
		pop ebx
		MOV ebx,0
		MOV eax,_te[4*ebx]
		INC eax
		MOV _te, eax
		MOV ebx,0
		MOV eax,_te[4*ebx]
		invoke crt_printf, SADD("%d", 13, 10),eax
		MOV eax,0
		invoke crt_printf, SADD("print any key to continue...")
		invoke crt__getch
		invoke crt__exit, 0
	end _start
