#!/usr/bin/env python
# coding: utf-8

# In[36]:


import numpy as np
import matplotlib.pyplot as plt
#对单点计算马氏距离
def fm(x,y):
    tmp=np.matrix([x,y])
    ans=(tmp-mu)*sigma*(tmp-mu).T
    return np.sqrt(ans)

mu=np.matrix([2.1,1.9])
sigma=np.matrix([[1.2, 0.4], [0.4, 1.8]])
X = np.arange(-10,10,0.01)
Y = np.arange(-10,10,0.01)
X_grid, Y_grid = np.meshgrid(X,Y)
Z_grid=np.array([[0 for j in range(2000)]for i in range(2000)])
#处理出所有点的马氏距离
for i in range(2000):
    for j in range(2000):
        Z_grid[i][j]=fm(X_grid[i][j],Y_grid[i][j])


# In[43]:


a=plt.contour(X_grid,Y_grid,Z_grid,[1],colors=['yellow'],linewidths=0.8)
b=plt.contour(X_grid,Y_grid,Z_grid,[2],colors=['cyan'],linewidths=0.8)
c=plt.contour(X_grid,Y_grid,Z_grid,[3],linewidths=0.8)
plt.clabel(a,inline=True)
plt.clabel(b,inline=True)
plt.clabel(c,inline=True)
plt.xlim(xmin=-3,xmax=7)
plt.ylim(ymin=-2,ymax=6)
plt.scatter(2,2)
plt.show()


# In[ ]:




