n=eval(input())  #输入n
o=eval(input())  #原始状态
p=eval(input())  #密码
ori=list(str(o)) #转换为list操作
pwd=list(str(p))
ans=0
for i in range(n): #比较最小的数相加得到最终结果
    ans+=min(abs(int(ori[i])-int(pwd[i])),min(abs(10+int(ori[i])-int(pwd[i])),10+int(pwd[i])-int(ori[i])))
print(ans)