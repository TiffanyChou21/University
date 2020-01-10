import numpy as np
import matplotlib.pyplot as plt
x1, y1 = np.random.multivariate_normal([1,1],[[2,0],[0,2]],600).T
x2, y2 = np.random.multivariate_normal([4,4],[[2,0],[0,2]],300).T
x3, y3 = np.random.multivariate_normal([8,1],[[2,0],[0,2]],100).T
l1,=plt.plot(x1, y1, 'r.')
l2,=plt.plot(x2, y2, 'g.')
l3,=plt.plot(x3, y3, 'b.') 
le = plt.legend([l1, l2,l3], ["Distribution1", "Distribution2","Distribution3"], loc='upper right')
plt.savefig("example.png")
plt.show()