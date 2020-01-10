# 1712991 周辰霏 Loan
R=eval(input('R%=')) #年利率       #5.75,15,25000
Y=eval(input('Y='))  #年份
L=eval(input('L='))  #贷款金额
M=(L*(0.01*R/12))/(1-(1/((1+(0.01*R/12))**(12*Y)))) #代入公式
print("{:.2f}".format(M)) #月交付
print("{:.2f}".format(M*Y*12)) #总还款