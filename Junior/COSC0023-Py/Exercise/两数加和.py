array=eval(input())
target=eval(input())
j=-1
for i in range(1,len(array)):
    temp = array[:i]#重复查找必然超时,所以只对当前选定的一个数字向后查
    if (target - array[i]) in temp:
        j = temp.index(target - array[i])
        break
if j>=0:
    print(str('['+str(j)+','+str(i)+']'))