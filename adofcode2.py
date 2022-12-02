#AoC 2022 day 2


def solvepart1(a):
    #points=[lost, tie, won]
    points = [["A Z\n", "B X\n", "C Y\n"], ["A X\n", "B Y\n", "C Z\n"], ["A Y\n", "B Z\n", "C X\n"]]
    myscore = {'X': 1, 'Y' : 2, 'Z':3}
    totalscore=0
    for x in a:
       
        for n in range(3):
            if x in points[n]:
                totalscore += n*3+ (myscore[x[-2]])
                break
    return totalscore
                

def solvepart2(a):
    lose = {'A':3 , 'B': 1, 'C':2 } 
    tie = {'A':1 , 'B':2 , 'C': 3}
    win = {'A':2 , 'B':3 , 'C':1 }
    totscore =0
    for x in a:
        if x[-2]=='X':
            totscore += lose[x[0]]
        if x[-2]=='Y':
            totscore += tie[x[0]] +3
        if x[-2]=='Z':
            totscore += win[x[0]] +6
    return totscore
            
            
        
    


PATH="mypath\\input.txt" #insert your file path here
file = open(PATH, "r")

print(solvepart1(file))
print(solvepart2(file))
