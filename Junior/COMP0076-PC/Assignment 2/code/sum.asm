.486;��ʾʹ��486������
.model flat,stdcall
option casemap :none

include \masm32\include\msvcrt.inc 
includelib \masm32\lib\msvcrt.lib

.data 
result dd 0   ;���ս��
datan dd ?;����n
typen db '%d',0
i dd 1
data1 db 'Hello World',0dh,0ah,0  ;13,10��ʾ����,0��ʾ��ֹ
data2 db 'Press any key to continue...',0


.code
sum:
    add eax,i
    inc i
    cmp i,ecx
    jle sum
    ret  
start:
    ;----------------------------����---------------------------------
    invoke crt_scanf,addr typen,addr datan ;����n scanf("%d",n)
    mov eax,0   ;eax=result
    mov ecx,datan
    ;----------------------------����---------------------------------
    call sum
    ;----------------------------���---------------------------------
    mov result,eax
    invoke crt_printf,addr typen,result
    invoke crt_printf, 0dh,0ah,0
    invoke crt_printf,addr data2
    ret
end start