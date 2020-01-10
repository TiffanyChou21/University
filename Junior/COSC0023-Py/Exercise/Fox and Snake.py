n,m=map(int,input().split())#已在Codeforces上AC,原先输入格式不规范所以无法AC 
i=1
while i<=n:
    if i%4==1 or i%4==3:
        print("#"*m)     #1和3 #####
    elif i%4==2:
        print("."*(m-1)+"#")   #2...#
    else:
        print("#"+"."*(m-1))   #4 #....
    i+=1