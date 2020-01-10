C=eval(input())
C.sort()#从小到大排序
tri=0
for i in range(len(C)-3,-1,-1):#从大到小算
    if C[i]+C[i+1]>C[i+2]:
        tri=C[i]+C[i+1]+C[i+2]
        break
print(tri)