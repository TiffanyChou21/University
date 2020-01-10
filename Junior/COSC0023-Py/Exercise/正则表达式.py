#!/usr/bin/env python
# coding: utf-8

# In[67]:


import re


# 1. 试给出正则表达式`[a-zA-Z\_][0-9a-zA-Z\_]*`的含义，用书面语言输出，并给出符合该表达式的一个例子

# answer：表达式表示C++里面的变量名称,即第一位是大小字母或下划线,后跟0个-n个数字大小字母下划线组成的串
# example： _a,_1A,A2,a0

# 2. 尝试写一个验证Email地址的正则表达式
# 
# > 样例一：someone@gmail.com 
# 
# > 样例二：bill.gates@microsoft.com
# 
# > 样例三：bob#example.com
# 
# > 样例四：mr-bob@example.com

# In[68]:


test = 'someone@gmail.com'
if re.match(r'^[A-Za-z\d]+([_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}', test):
    print('ok')
else:
    print('failed')


# In[69]:


test = 'bill.gates@microsoft.com'
if re.match(r'^[A-Za-z\d]+([_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}', test):
    print('ok')
else:
    print('failed')


# In[70]:


test = 'bob#example.com'
if re.match(r'^[A-Za-z\d]+([_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}', test):
    print('ok')
else:
    print('failed')


# In[72]:


test = 'mr-bob@example.com'
if re.match(r'^[A-Za-z\d]+([_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}', test):
    print('ok')
else:
    print('failed')

