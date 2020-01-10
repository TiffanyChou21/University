n=eval(input())#宿舍数目
sum=0
for i in range(n): 
    p=eval(input())
    q=eval(input())
    if q-p>=2:#用最大容量-已有人数符合条件的sum+1
        sum+=1
print(sum)