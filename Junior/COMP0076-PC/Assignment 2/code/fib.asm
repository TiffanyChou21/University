.486;��ʾʹ��486������
.model flat,stdcall
option casemap :none
    
include \masm32\include\windows.inc 
include \masm32\include\kernel32.inc 
includelib \masm32\lib\kernel32.lib
    
include \masm32\macros\macros.asm

include \masm32\include\msvcrt.inc 
includelib \masm32\lib\msvcrt.lib

.data
    f0 dd 0  
    f1 dd 1
    i dd 1;��֪��Ϊʲôֱ�Ӹ�ֵecx���������ᱨ��,�����м�������
    temp dd ?    ;��һ��result
    typen db '%d',0
    datan dd ?
    space db ' ',0   
    data1 db 'Press any key to continue...',0


.code
start:
    ;------------------------����----------------------------
    invoke crt_scanf,addr typen,addr datan;����n      
    invoke crt_printf,addr typen,f1  ;���fib(1)
    invoke crt_printf,addr space
    mov ecx,i
    cmp ecx,datan
    jl @F     ;��������ת
    ;------------------------����----------------------------
    @@:
    mov ebx,f1
    mov temp,ebx
    mov eax,f0
    add ebx,eax
    mov f1,ebx
    invoke crt_printf,addr typen,f1
    invoke crt_printf,addr space
    mov eax,temp     
    mov f0,eax
    inc i                          ;inc ecx
    mov ecx,i
    cmp ecx,datan
    jl @B           ;��������ת
    ;------------------------������--------------------------
    invoke crt_printf,0dh,0ah,0
    invoke crt_printf,addr data1
    ret
  end start
