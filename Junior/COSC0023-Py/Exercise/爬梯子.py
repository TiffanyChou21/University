n=eval(input())#很明显的动规
if n < 1:
    print(0)
stair = {}
stair[1] = 1
stair[2] = 2
for i in range(3, n+1):#备忘录
    stair[i] = stair[i-1] + stair[i-2]
print(stair[n])