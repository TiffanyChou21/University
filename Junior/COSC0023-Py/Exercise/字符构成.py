s1,s2=eval(input().replace(" ",","))  #输入   还是C++思路并没有用counter
li1=list(s1)
li1.sort()
li2=list(s2)
li2.sort()
ls1=list(set(li1))
ls2=list(set(li2))     #以上去重转换便于生成字典
num=[]         #计数
for i in range(len(set(li2))):
    num.append(li2.count(ls2[i]))
i=0
dic={}
for i in range(len(set(li2))):      #生成字典
    dic[ls2[i]]=num[i]
bo=True
for i in range(len(set(li1))):   #有几种字符就几次
    if li1.count(ls1[i])>dic[ls1[i]]:      #如果str1的计数大于dic对应数字，那肯定false
        bo=False
        break
print(bo)
