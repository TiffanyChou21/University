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
data1 db 'Hello World',0dh,0ah,0  ;13,10��ʾ����,0��ʾ��ֹ
data2 db 'Press any key to continue...',0
typen db '%d',0
result dd 1;���ս��


.code
start:
      invoke crt_printf, addr data1
      invoke crt_printf, addr data2
      invoke crt__getch
      .if (eax == 0) || (eax == 0E0h)
        invoke crt__getch
      .endif   
    ret
    

END start



