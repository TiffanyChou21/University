.486;表示使用486处理器
.model flat,stdcall
include \masm32\include\msvcrt.inc 
includelib \masm32\lib\msvcrt.lib

.data
typen db '%d',0
datan dd ?
result dd ?
data1 db '1.and2.or3.not4.xor5.shl6.shr',0dh,0ah,0
data2 db 'Press any key to continue...',0
data3 db 'error!'

.code
start:
;---------------------------------输入----------------------------
invoke crt_printf,addr data1
invoke crt_scanf,addr typen,addr datan
mov eax,datan
;---------------------------------判断----------------------------
cmp eax,1d
je iand
cmp eax,2d
je ior
cmp eax,3d
je inot
cmp eax,4d
je ixor
cmp eax,5d
je ishl
cmp eax,6d
je ishr
jmp error
;---------------------------------条件----------------------------
iand:
mov ebx,01100011b
and ebx,00111011b
mov result,ebx
jmp output
ior:
mov ebx,01100011b
or ebx,00111011b
mov result,ebx
jmp output
inot:
mov ebx,01100011b
not ebx
mov result,ebx
jmp output
ixor:
mov ebx,01100011b
xor ebx,00111011b
mov result,ebx
jmp output
ishl:
mov ebx,01100011b
shl ebx,1
mov result,ebx
jmp output
ishr:
mov ebx,01100011b
shr ebx,1
mov result,ebx
jmp output
;---------------------------------输出---------------------------
output:
invoke crt_printf,addr typen,result
invoke crt_printf,0dh,0ah,0
invoke crt_printf,addr data2
ret
error:
invoke crt_printf,addr data3
invoke crt_printf,addr data2
ret

end start
