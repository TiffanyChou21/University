n=eval(input()) #不好意思还是C++思路   成员函数老是用混
i=0
li=[]
while i<n:            
    goal=input()
    li.append(goal)
    i+=1
li.sort()
count=0
i=0
while i<n:                 #找到最大计数
    if li.count(li[i])>=count:
        count=li.count(li[i])
    i+=1
i=0
while i<n:         #输出最大计数对应的值
    if li.count(li[i])==count:
        print(li[i])
        i=n-1
    i+=1

