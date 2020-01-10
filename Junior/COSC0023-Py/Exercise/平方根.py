#1712991 周辰霏 平方根
def sqrt(x):
    result = 1.0  #取最小之后迭代
    while abs(result**2-x)>0.1:     #整数即可所以精度0.1必然可以
        result=(result+x/result)/2  #x=(与x轴交点+x/与x轴交点)/2
    return int(result)
x=eval(input())
print(sqrt(x))