i=1
matrix=[]
while i <=5:   #每次都输入格式要命,空格str转换老记不住，这次变量少就先这么着
    a,b,c,d,e=map(int,input().split())
    matrix+=[a,b,c,d,e]
    i+=1
i=1
while i<=25:
    if matrix[i]!=0:
        break
    i+=1#找到不为0的那一个，通过%/计算找到坐标,然后-3加起来输出就行
print(abs(int((i+1)%5)-3)+abs(int((i+1)/5)-3)-1)