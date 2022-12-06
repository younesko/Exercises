#advent of code day 6

def uniq(s):
    return len(s)==len(set(s))

a = open("mypath\\input6.txt", 'r')
mydata = a.read()
i, j=0, 0

while not uniq(mydata[i:i+4]):
    i+=1
    
while not uniq(mydata[j:j+14]):
    j+=1
print ("start of packet marker at problem 1 and 2: ", i+4, j+14)
