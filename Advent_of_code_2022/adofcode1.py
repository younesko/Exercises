#advent of code day 1

#solution of the second part
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



