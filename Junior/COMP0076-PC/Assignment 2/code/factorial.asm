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
result dd 1   ;���ս��
datan dd ?;����n
typen db '%d',0
data1 db 'Hello World',0dh,0ah,0  ;13,10��ʾ����,0��ʾ��ֹ
data2 db 'Press any key to continue...',0


.code 
start:
    ;----------------------------����---------------------------------
    invoke crt_scanf,addr typen,addr datan ;����n scanf("%d",n)
    mov eax,result   ;eax=result
    mov ecx,2d       ;ecx�����Ĵ���ecx=2
    push eax
    ;----------------------------ѭ��---------------------------------
    @@:  ;����һ���ܺ��õ���ת,@BѰ��ǰһ�������@@,@FѰ�Һ�һ�������
    pop eax
    mul cx     ;�����㵽17
    inc ecx
    push eax 
    cmp ecx,datan   ;datan-ecx �ı��־λ,ZF=1��������
    jle @B          ;��ʱ��ת��ǰһ�������@@
    ;----------------------------���---------------------------------
    pop eax
    mov result,eax
    invoke crt_printf,addr typen,result
    invoke crt_printf, 0dh,0ah,0
    invoke crt_printf,addr data2
    ret
end start

