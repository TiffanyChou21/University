state=list(input())#codeforces AC
i=0           #并没有用新学的内容，以前的内容用的比较熟写的比较快就用了
j=0
ref=state[0]  #记录第一位作为参照状态
for i in range(0,len(state)): 
    if state[i]== ref:#一样的话个数+1 ，过7break输出
        j+=1
        if j>=7:
            break
    else :  #ref改变  个数置1重新计数
        ref = state[i]
        j=1
if(j>=7):
    print('YES')
else:
    print('NO')