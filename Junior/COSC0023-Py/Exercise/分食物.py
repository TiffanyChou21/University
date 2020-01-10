food=eval(input())
if len(set(food))>=len(food)/2:#前面len是食物种类，利用set
    print(int(len(food)/2))
else:
    print(int(len(set(food))))
