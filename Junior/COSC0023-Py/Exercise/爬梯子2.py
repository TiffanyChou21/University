floorcost=eval(input())
fl1=fl2=0 
for i in reversed(floorcost):  #递归 从后往前即可fl[i] = floorcost[i] + min(fl[i+1], fl[i+2])
    fl1,fl2 = i+min(fl1,fl2),fl1
print(min(fl1, fl2))