class Account:
    def __init__(self):
        __id=0
        __balance=0.0
        __annualInterestRate=0.0
    def SetAccount(self,newid,newbalance,newAIR):
        self.__id=newid
        self.__balance=newbalance
        self.__annualInterestRate=newAIR
    def withdraw(self,money):
        self.__balance-=money
    def deposit(self,money):
        self.__balance+=money
if __name__=='__main__':
    Account1=Account()   #初始化
    Account2=Account()   #初始化
    Account2.SetAccount(0,100,0)  #设置账户信息
    #访问私有属性
    print('账户2ID：%d'%Account2._Account__id)
    print('账户2余额：%f'%Account2._Account__balance)
    print('账户2年利率：%f'%Account2._Account__annualInterestRate)
    #取钱
    Account2.withdraw(10)
    print('取钱后')
    print('账户2ID：%d'%Account2._Account__id)
    print('账户2余额：%f'%Account2._Account__balance)
    print('账户2年利率：%f'%Account2._Account__annualInterestRate)    
    #存钱
    Account2.deposit(100)
    print('存钱后')
    print('账户2ID：%d'%Account2._Account__id)
    print('账户2余额：%f'%Account2._Account__balance)
    print('账户2年利率：%f'%Account2._Account__annualInterestRate) 