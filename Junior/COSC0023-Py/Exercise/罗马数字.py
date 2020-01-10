roman=input()
data={'M':1000,'D':500,'C':100,'L':50,'X':10,'V':5,'I':1}#字典存储基本字母
ans =0
for i in range(len(roman)-1):
    if data[roman[i]]>=data[roman[i+1]]:  #前面比后面小就减掉
        ans += data[roman[i]]
    else:
        ans -= data[roman[i]]
ans+=data[roman[len(roman)-1]]#最后一位单独计算
print(ans)