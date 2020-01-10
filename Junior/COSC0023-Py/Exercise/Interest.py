n=1                              #课上的求10000翻一番
while 10000*(1.019**n)<20000 :   #但其实无论本金多少都是37年 因为n=ln2/ln1.019≈36.83
    n+=1
print(n)
# import math
# interest=eval(input('interest=__%'))                        #求不同利率  
# print(math.ceil(math.log(2)/math.log(1+0.01*interest)))


