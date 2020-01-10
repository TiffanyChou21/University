class SchoolMember:
    def __init__(self,nname,nage,nsex):
        self.name=nname
        self.age=nage
        self.sex=nsex
        self.enroll()
    def enroll(self):
        print(self.name)
class Teacher(SchoolMember):
    def __init__(self, nname, nage, nsex,ncourse):
        self.course=ncourse
        super().__init__(nname, nage, nsex)
    def teach(self):
        print('老师名：%s 在上的课程：%s'%(super().__self__.name,self.course))
class Student(SchoolMember):
    def __init__(self, nname, nage, nsex,ntution):
        self.tution=ntution
        super().__init__(nname, nage, nsex)
    def pay(self):
        print('花费学费：%f'%(self.tution))
if __name__=='__main__':
    teacher=Teacher('tea',30,'男','0035')#新增老师
    student=Student('zcf',19,'女',5800)#新增学生
    teacher.teach()#teach()方法
    student.pay()#pay()方法
