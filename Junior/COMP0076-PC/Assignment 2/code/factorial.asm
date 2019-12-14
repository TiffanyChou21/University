.486;表示使用486处理器
.model flat,stdcall
option casemap :none
    
include \masm32\include\windows.inc 
include \masm32\include\kernel32.inc 
includelib \masm32\lib\kernel32.lib
    
include \masm32\macros\macros.asm

include \masm32\include\msvcrt.inc 
includelib \masm32\lib\msvcrt.lib

.data 
result dd 1   ;最终结果
datan dd ?;输入n
typen db '%d',0
data1 db 'Hello World',0dh,0ah,0  ;13,10表示换行,0表示终止
data2 db 'Press any key to continue...',0


.code 
start:
    ;----------------------------输入---------------------------------
    invoke crt_scanf,addr typen,addr datan ;输入n scanf("%d",n)
    mov eax,result   ;eax=result
    mov ecx,2d       ;ecx计数寄存器ecx=2
    push eax
    ;----------------------------循环---------------------------------
    @@:  ;发现一个很好用的跳转,@B寻找前一个最近的@@,@F寻找后一个最近的
    pop eax
    mul cx     ;最大计算到17
    inc ecx
    push eax 
    cmp ecx,datan   ;datan-ecx 改变标志位,ZF=1则二者相等
    jle @B          ;≤时跳转到前一个最近的@@
    ;----------------------------输出---------------------------------
    pop eax
    mov result,eax
    invoke crt_printf,addr typen,result
    invoke crt_printf, 0dh,0ah,0
    invoke crt_printf,addr data2
    ret
end start

