string=eval(input("(list[str])："))#因为是前缀所以不用考虑中间开始换的情况直接判断即可
ans = ''
for c in zip(*string):   #相当于解压缩拆开
    # print(c)
    if len(set(c)) == 1:#拆出来的第？个字符完全一致
        ans = ans + c[0]#添加进去
    else:    #不一致退
        break
print("(str):"+ans)