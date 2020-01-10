n=eval(input())   #-1000003不对
if n>=0:
    print(n)
else:
    n0=int(n/10)
    n1=-(n%10)+int(n/100)*10
    if n0>n1:
        print(n0)
    else :
        print(n1)