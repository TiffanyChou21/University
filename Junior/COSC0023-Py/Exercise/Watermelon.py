#1712991 周辰霏 Watermelon
w=eval(input()) #重量
print('YES' if w%2==0 and w!=2 else 'NO')  #2为特例只要偶数都可
# R = ["NO","YES"]        #不使用ifelse的写法list
# print(R[w%2==0 and w>2])