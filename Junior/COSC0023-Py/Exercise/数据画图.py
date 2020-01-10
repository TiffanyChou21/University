#!/usr/bin/env python
# coding: utf-8

# In[52]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import warnings
# plt.rcParams['font.sans-serif'] = [u'SimHei']    #显示不了中文放弃了不显示了
# plt.rcParams['axes.unicode_minus'] = False
warnings.filterwarnings('ignore')
pd.set_option('display.max_rows',None)
iris=pd.read_csv('iris.csv',names=['花萼长度','花萼宽度','花瓣长度','花瓣宽度','类别'])


# ## 作业一
# 画出花萼长度和花萼宽度的散点图

# In[19]:


plt.xlabel('length')
plt.ylabel('width')
plt.scatter(iris['花萼长度'],iris['花萼宽度'],c='r',marker='.')


# ## 作业二
# 按照花萼长度排序作为X轴，画出花萼宽度随着花萼长度变化的折线图，包括图表标题、轴标签、刻度等

# In[20]:


plt.xlabel('length')
plt.ylabel('width')
plt.title("width-length")
plt.plot(iris.sort_index(by='花萼长度')['花萼长度'],iris['花萼宽度'],'r') 


# ## 作业三
# 画出花瓣长度和花瓣宽度的散点图，要求不同类别花样本点的颜色不同。

# In[42]:


plt.xlabel('length')
plt.ylabel('width')
plt.scatter(iris['花瓣长度'], iris['花瓣宽度'], c=iris['类别'])


# ## 作业四
# 计算每个特征的平均值，画出直方图

# In[30]:


iris1=iris.drop(['类别'],axis=1)
m=np.array(iris1.mean())


# In[45]:


# labels = ['花萼长度', '花萼宽度', '花瓣长度', '花瓣宽度']#中文显示有问题花萼对应s 花瓣对应f
labels = ['slength', 'swidth', 'flength', 'fwidth']
plt.bar(np.arange(4)+1,m,color='c',tick_label=labels)
for x, y in zip(np.arange(4)+1, m):
    plt.text(x , y, '%.2f' % y, ha='center', va='bottom')


# ## 作业五
# 计算每种花的样本数量百分比，画出饼状图。

# In[67]:


count_df = iris.groupby('类别').count()
test_df = pd.DataFrame(count_df)
perc=test_df/test_df.sum()
perc=perc.drop(['花萼宽度','花瓣长度','花瓣宽度'],axis=1)
perc=np.array(perc)


# In[70]:


plt.pie(perc,labels=['0','1','2'],autopct='%1.1f')

