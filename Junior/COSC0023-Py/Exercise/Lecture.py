n,m=eval(input().replace(" ",",")) ##AC on Codeforces 499B  并写不出来老师那么短的代码
li1=[]
li2=[]
dic={}
for i in range(m):                 #短的就设置为对应字典value
    li1.append(input().split(' '))
    if len(li1[i][0])>len(li1[i][1]):
        dic[li1[i][0]]=li1[i][1]
    else:
        dic[li1[i][0]]=li1[i][0]
li2=input().split(' ')    
for i in range(n):
    li2[i]=dic[li2[i]]    #利用字典value替换
print(" ".join(li2))   #join输出
