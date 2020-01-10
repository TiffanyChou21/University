n=eval(input())    #DP 
if n == 0:
    print([])
bracket = []
bracket.append([None])   
bracket.append(["()"])    # n=1就只有()
for i in range(2,n+1):    # DP备忘录
    l = []        
    for j in range(i):    # p+q=i-1 依次遍历
        li1 = bracket[j]    
        li2 = bracket[i-1-j]    
        for k in li1:  
            for m in li2:
                if k == None:
                    k = ""
                if m == None:
                    m = ""
                br = "(" + k + ")" + m
                l.append(br)   
    bracket.append(l)    
print(bracket[n])