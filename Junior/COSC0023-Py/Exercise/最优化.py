from scipy.optimize import minimize
fun = lambda x: (x[0] - 2/3) /(x[0]+x[1]+x[2]-2)
cons = ({'type': 'eq', 'fun': lambda x: x[0]*x[1]*x[2]})
bnds = ((0, None), (0, None), (0, None))
res = minimize(fun, (4,0,2), method='SLSQP', bounds=bnds, constraints=cons)
print('最小值：',res.fun)
print('最优解：',res.x)
print('迭代终止是否成功：', res.success)
print('迭代终止原因：', res.message)
# 最小值： -0.024799463736109733
# 最优解： [2.65680375e-15 0.00000000e+00 2.88823017e+01]
# 迭代终止是否成功： True
# 迭代终止原因： Optimization terminated successfully.