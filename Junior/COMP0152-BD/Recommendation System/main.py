import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
import math
import time

NumOfUser = 19835
MovieNum = []
ReadBuffer = [[] for i in range(NumOfUser)]
VerMovieNum = [-1 for i in range(NumOfUser)]
Verify = []
def draw():
    data=open('data-new/train.txt')
    users = []
    nums= []
    for each_line in data :
        if not each_line.find('|')==-1:
            (user_id,item_num)=each_line.split ('|',1)
            for i in range( int (item_num) ) :
                users.append(int(user_id ))
            nums.append(int(item_num))
    data.close()
    users=np.array(users).reshape(len(users),1)

    with open('data-new/train.txt','r')as f:
        lines=f.readlines()
    with open('data-new/process-train.txt' , 'w') as fw :
        for line in lines :
            if (not line.find('|')==-1):
                continue 
            fw.write(line) 
    record_data=np.loadtxt ('data-new/process-train.txt').astype( int )
    items=record_data[: ,0 ]
    scores=record_data[: ,1 ]
    sns.distplot(scores)  # 分数分布区间
    plt.show()
def split(size):
    # deal with train.txt
    x=0
    user=[]
    item=[]
    score=[]
    raw=[]
    sc=False
    data=open('data-new/train.txt')
    for each_line in data :
        if not each_line.find('|')==-1:
            (users,item_num)=each_line.split('|',1) 
            user.append(users)
            sc=True
            x=0
            continue
        if sc:
            if x==int(item_num):
                sc=False
                continue
            (items,scores)=each_line.split('  ',1) 
            item.append(items)
            score.append(scores.replace('\n', '').replace('\r', '').strip())
            dict1 = dict(user_id=int(users), item_id=int(items), score=int(scores.replace('\n', '').replace('\r', '').strip())) 
            raw.append(dict1)
            x+=1
    data.close()
    df = pd.DataFrame(raw)
    # df.head()
    n_users = df.user_id.unique().shape[0]
    n_items = df.item_id.unique().shape[0]
    max_items = df.item_id.max()   #624960     
    print (str(n_users) + ' users')   #19835    19834
    print (str(n_items) + ' items')   # 455309  

    # split
    val_size=size
    val = pd.DataFrame()
    train = pd.DataFrame()
    last_user=0
    last_index=0
    items=0
    for index, row in df.iterrows():
        now_user=row['user_id']
        if last_user==now_user:
            items+=1
        else:
            val=val.append(df[last_index:math.floor((index-last_index)*0.15)+last_index])
            train=train.append(df[math.floor((index-last_index)*0.15)+last_index:index])
            last_user=now_user
            last_index=index
            items=0
    val=val.append(df[last_index:math.floor((index-last_index)*0.15)+last_index])
    train=train.append(df[math.floor((index-last_index)*0.15)+last_index:index])
    # train.to_csv('trainset.csv',index=False)
    # val.to_csv('valset.csv',index=False)

    # writetrainset
    last_user=-1
    obj=train['user_id']
    obj=obj.value_counts()
    obj=obj.sort_index()
    with open('trainset.txt' , 'w') as fw :
        for index, row in train.iterrows():
            now_user=row['user_id']
            if last_user==now_user:
                fw.write(str(row['item_id'])+'  '+str(row['score'])+'\n')
            else:
                last_user=now_user
                fw.write(str(now_user)+'|'+str(obj[now_user:now_user+1][now_user])+'\n') 
                fw.write(str(row['item_id'])+'  '+str(row['score'])+'\n')
            
    # writevalset
    last_user=-1
    obj=val['user_id']
    obj=obj.value_counts()
    obj=obj.sort_index()
    with open('valset.txt' , 'w') as fw :
        for index, row in val.iterrows():
            now_user=row['user_id']
            if last_user==now_user:
                fw.write(str(row['item_id'])+'  '+str(row['score'])+'\n')
            else:
                last_user=now_user
                fw.write(str(now_user)+'|'+str(obj[now_user:now_user+1][now_user])+'\n') 
                fw.write(str(row['item_id'])+'  '+str(row['score'])+'\n')


class MovieScore():
    def __init__(self, id, score):
        self.IDOfMovie = id
        self.ScoreOfMovie = score

Data = [[] for i in range(NumOfUser)]
PearData = [[] for i in range(NumOfUser)]

def Binsearch(R, uid, n, k):
    low = 0
    high = n - 1
    while low <= high:
        if R[uid][low].IDOfMovie == k:
            return low
        if R[uid][high].IDOfMovie == k:
            return high
        mid = int(low + ((high - low) / 2))
        if R[uid][mid].IDOfMovie == k:
            return mid
        if R[uid][mid].IDOfMovie < k:
            low = mid + 1
        else:
            high = mid - 1
    if low > high:
        return -1

def load():
    f = open("trainset.txt")

    blank = " "
    line = "|"
    UserID = -1

    for s in f:
        LocLine = s.find(line)
        if s == "":
            break

        if LocLine != -1:
            UserID += 1

            ss = s[LocLine + 1:]
            NumOfMovie = int(ss)

            MovieNum.append(NumOfMovie)
        else:
            LocBlack = s.find(blank)
            IDOfMovie = s[: LocBlack]
            sco = s[LocBlack + 2:]

            score = float(sco)
            MovieID = int(IDOfMovie)
            MS = MovieScore(MovieID, score)
            Data[UserID].append(MS)
    f.close()
    print("trainset.txt 读取完毕")

def SortMovieID():
    for i in range(NumOfUser):
        Data[i].sort(key=lambda MovieScore: MovieScore.IDOfMovie)

def AvgAll():
    sum = 0
    count = 0
    for i in range(NumOfUser):
        for j in range(MovieNum[i]):
            sum += Data[i][j].ScoreOfMovie
            count += 1
    return sum / count

def AvgUser(UserID):
    sum = 0
    for i in range(MovieNum[UserID]):
        sum += Data[UserID][i].ScoreOfMovie
    return sum / MovieNum[UserID]

def AvgItem(ItemID):
    sum = 0
    count = 0
    for i in range(NumOfUser):
        j = Binsearch(Data, i, MovieNum[i], ItemID)
        if j != -1:
            sum += Data[i][j].ScoreOfMovie
            count += 1
    return sum / count

def bxi(UserID, ItemID, u):
    bx = AvgUser(UserID) - u
    bi = AvgItem(ItemID) - u
    return u + bx + bi

def Pearson():
    for i in range(NumOfUser):
        avguser = AvgUser(i)

        for j in range(MovieNum[i]):
            MS = MovieScore(Data[i][j].IDOfMovie, Data[i][j].ScoreOfMovie - avguser)
            PearData[i].append(MS)

def PearSimAB(UserA, UserB):
    numerator = []
    if MovieNum[UserA] <= MovieNum[UserB]:
        for i in range(MovieNum[UserA]):
            j = Binsearch(PearData, UserB, MovieNum[UserB], PearData[UserA][i].IDOfMovie)
            if j != -1:
                numerator.append(PearData[UserA][i].ScoreOfMovie * PearData[UserB][j].ScoreOfMovie)

    if MovieNum[UserA] > MovieNum[UserB]:
        for i in range(MovieNum[UserB]):
            j = Binsearch(PearData, UserA, MovieNum[UserA], PearData[UserB][i].IDOfMovie)
            if j != -1:
                numerator.append(PearData[UserB][i].ScoreOfMovie * PearData[UserA][j].ScoreOfMovie)

    PeaNumerator = sum(numerator)

    SumUserA = 0
    for i in range(MovieNum[UserA]):
        SumUserA += PearData[UserA][i].ScoreOfMovie * PearData[UserA][i].ScoreOfMovie
    SqrtUserA = SumUserA ** 0.5

    SumUserB = 0
    for i in range(MovieNum[UserB]):
        SumUserB = SumUserB + PearData[UserB][i].ScoreOfMovie * PearData[UserB][i].ScoreOfMovie
    SqrtUserB = SumUserB ** 0.5

    try:
        pearson = PeaNumerator / (SqrtUserA * SqrtUserB)
    except:
        pearson = 0
    return pearson

def rxi(UserID, ItemID, u):
    SumSij = 0
    Sum_Sij_rjx = 0
    for i in range(NumOfUser):
        j = Binsearch(Data, i, MovieNum[i], ItemID)
        if j != -1:
            a = PearSimAB(UserID, i)
            if a > 0:
                SumSij += a
                Sum_Sij_rjx += a * (Data[i][j].ScoreOfMovie - bxi(i, Data[i][j].IDOfMovie, u))

    if SumSij != 0 and Sum_Sij_rjx != 0:
        return Sum_Sij_rjx / SumSij
    else:
        return 1000

def End(UserID, ItemID, u):
    rxi1 = rxi(UserID, ItemID, u)

    if rxi1 == 1000:
        end = AvgUser(UserID)
    else:
        end = rxi1 + bxi(UserID, ItemID, u)
        if end > 100:
            end = 100
        if end < 0:
            end = 0
    print("UserID = %d, ItemID = %d, End = %f" % (UserID, ItemID, end))
    return end

def ReadtoBuffer():
    f = open("data-new/test.txt")
    line = "|"
    Row = -1

    for s in f:
        LocLine = s.find(line)
        if s == "":
            break
        if LocLine != -1:
            Row += 1
            i = 0
        else:
            ReadBuffer[Row].append(int(s))
    f.close()

    f = open("valset.txt")
    Row = -1
    blank = " "
    for s in f:
        LocLine = s.find(line)
        if s == "":
            break
        if LocLine != -1:
            Verify.append([])
            Row += 1
            ss = s[LocLine + 1:]
            VerMovieNum[Row] = int(ss)
        else:
            LocBlack = s.find(blank)
            IDOfMovie = s[:LocBlack]
            Verify[-1].append(int(IDOfMovie))
    f.close()

def WriteText(u):
    f = open("test_result.txt", 'a')
    for i in range(NumOfUser):
        for j in range(6):
            if j==0:
                s="%d|6\n" % (i)
                f.write(s)
                s = "%d  %d\n" %(ReadBuffer[i][j], int(End(i, ReadBuffer[i][j], u)))
                f.write(s)
            else:
                s = "%d  %d\n" % (ReadBuffer[i][j], int(End(i, ReadBuffer[i][j], u)))
                f.write(s)
    f.close()
    
    f = open("verify_result.txt", 'a')
    for i in range(NumOfUser):
        for j in range(VerMovieNum[i]):
            if j == 0:
                s = "%d|%d\n" % (i, VerMovieNum[i])
                f.write(s)
                s = "%d  %d\n" %(Verify[i][j], int(End(i, Verify[i][j], u)))
                f.write(s)
            else:
                s = "%d  %d\n" % (Verify[i][j], int(End(i, Verify[i][j], u)))
                f.write(s)
    f.close()

def rmse():
    # get score calculation
    # val
    x=0
    user=[]
    item=[]
    score=[]
    raw=[]
    sc=False
    data=open('valset.txt')
    for each_line in data :
        if not each_line.find('|')==-1:
            (users,item_num)=each_line.split('|',1) 
            user.append(users)
            sc=True
            x=0
            continue
        if sc:
            if x==int(item_num):
                sc=False
                continue
            (items,scores)=each_line.split('  ',1) 
            item.append(items)
            score.append(scores.replace('\n', '').replace('\r', '').strip())
            dict1 = dict(user_id=int(users), item_id=int(items), score=int(scores.replace('\n', '').replace('\r', '').strip())) 
            raw.append(dict1)
            x+=1
    data.close()
    dfre = pd.DataFrame(raw)
    # pred
    x=0
    user=[]
    item=[]
    score=[]
    raw=[]
    sc=False
    data=open('verify_result.txt.txt')
    for each_line in data :
        if not each_line.find('|')==-1:
            (users,item_num)=each_line.split('|',1) 
            user.append(users)
            sc=True
            x=0
            continue
        if sc:
            if x==int(item_num):
                sc=False
                continue
            (items,scores)=each_line.split('  ',1) 
            item.append(items)
            score.append(scores.replace('\n', '').replace('\r', '').strip())
            dict1 = dict(user_id=int(users), item_id=int(items), score=int(scores.replace('\n', '').replace('\r', '').strip())) 
            raw.append(dict1)
            x+=1
    data.close()
    dfpre = pd.DataFrame(raw)

     cal rmse
    time_start=time.time()
    rmse=0
    for i in range (5):
        rmse+=((dfpre[i:i+1]['score'][i]-dfre[i:i+1]['score'][i])**2)
    rmse=math.sqrt(rmse)
    time_end=time.time()
    print('rmse:',str(rmse))
    print('rmse time cost',time_end-time_start,'s')

if __name__ == '__main__':
    # draw() 
    time_start=time.time()
    split(0.15)
    time_end=time.time()
    print('split time cost',time_end-time_start,'s')
    time_start=time.time()
    load()
    ReadtoBuffer()
    u = AvgAll()
    SortMovieID()
    Pearson()
    WriteText(u)
    time_end=time.time()
    print('calculation time cost',time_end-time_start,'s')
    rmse()

