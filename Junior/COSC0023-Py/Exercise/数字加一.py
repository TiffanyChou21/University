digits=eval(input())#一开始还想了半天怎么输入。。
print([int(j) for j in str(int(''.join('%s' % i for i in digits))+1)])#先用join转换数字然后+1，再将其转换成list输出