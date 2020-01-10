import math
class Circle: 
    radius=5 
    def setRadius(self,newradius):
        self.radius=newradius
    def getPerimeter(self):
        return 2*math.pi*self.radius
    def getArea(self): 
        return math.pi*self.radius**2
if __name__=='__main__':
    circle1=Circle()
    circle2=Circle()
    circle1.setRadius(10)
    print(circle1.getPerimeter())
    print(circle2.getPerimeter())
    print(circle1.getArea())
    print(circle2.getArea())
