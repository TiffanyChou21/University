m = {'2': ['A','B','C'],'3': ['D','E','F'],'4': ['G','H','I'],'5': ['J','K','L'],'6': ['M','N','O'],'7': ['P','Q','R','S'],'8': ['T','U','V'],'9': ['W','X','Y','Z']}#字典
digits=input()
res=['']
for i in digits:
    res=[x+y for x in res for y in m[i]]#用已在res中的串与m[i]拼接即可
print(res)