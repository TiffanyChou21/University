n=eval(input())
i=0
box=[]
while i<n:
    ai=eval(input())
    box.append(ai)
    i+=1
box.sort()     #本质排序
print(" ".join('%s' %id for id in box))  #将数字转成字符串以免无法使用join