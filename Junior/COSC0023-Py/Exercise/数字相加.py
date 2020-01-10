n=eval(input())
while n > 9:
    n = eval('+'.join(n for n in str(n)))#转换成字符串用+拼接再转换回数字加
print(n)

#不循环
# n=eval(input())
# print((n % 9) or(n and 9))