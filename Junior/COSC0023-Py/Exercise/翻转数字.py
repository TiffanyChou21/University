#1712991 周辰霏 翻转数字
def reverse(num):
    result=0                    #%/方法
    pos=True       #标记正负
    if num==0:     #0
        return 0
    elif num<0:    #提取负号
        pos=False
        num=-num
    while num!=0:     #！=0前一直先取余再整除
        result=result*10+num%10
        num=int(num/10)
    if pos==False:    #恢复负号
        result=-result
    return result   #返回result
num=eval(input())
print(reverse(num))

# s=str(num)   # 字符串切片  未考虑0结尾  想到的别的办法不完整QAQ
# result = s[::-1]
# print(result)
# l=list(str(num)) #列表reverse12 
# l.reverse()
# result = "".join(l)
# print(result)

