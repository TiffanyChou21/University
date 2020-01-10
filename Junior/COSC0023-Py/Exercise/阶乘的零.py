#给定一个正整数n,返回n!末尾0的数量
n=eval(input())
ans=0   #只计算5  5*5 5*5*5 ..的个数即可     时间复杂度O(logn)√
while n :
    n=int(n/5)  #必须转int否则变成小数答案不对
    ans+=n
print(ans)