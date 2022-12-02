#advent of code day 1


def file2list(o):
    '''create a list of lists with elfs items'''
    inner, outer=[], []
    for x in o:
        try:
            inner.append(int(x))
        except:
            outer.append(inner)
            inner=[]
    return outer


filep= "filepath\\input2.txt"
o = open(filep, "r")

print(sum(sorted(map(sum, file2list(o)))[-3:]))


'''
elfs= enumerate(file2list(o))

calmax=0
total=[]

for x, y in elfs:
    a=sum(y)
    total.append(a)
    if a> calmax:
        calmax=a
        index=x+1
        
print ("elf number ", sum(sorted(total)[-3:]))
    
o.close()
    
'''
