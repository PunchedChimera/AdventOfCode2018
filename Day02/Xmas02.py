inputFile = open("Day02\\PuzzleInput.txt","r")

puzzleInput = []

for line in inputFile:
    output = line.replace("\n",'')
    puzzleInput.append(output)

def XmasFunction01(ids):
    countDoubles = 0
    countTriples = 0
    for id in ids:
        idLength = len(id)
        foundDouble = False
        foundTriple = False
        for index in range(idLength):
            charCount = id.count(id[index])
            if(charCount==2 and foundDouble!=True):
                countDoubles+=1
                foundDouble = True
            elif(charCount==3 and foundTriple!=True):
                countTriples+=1
                foundTriple = True
            if(foundDouble and foundTriple):
                break ## we have found one of each so we don't need to continue
    return countDoubles * countTriples

def getDifferences(first, second):
    count = 0
    ## will error if ids are different length
    for i in range(len(first)):
        if first[i] is not second[i]:
            count += 1
    return count

def getSameChars(first,second):
    difCharIndex = getDifCharIndex(first,second)
    result = first[:difCharIndex] + first[difCharIndex+1:]
    if(result==first):
        return "FAIL"
    else:
        return result

def getDifCharIndex(first,second):
    for i in range(len(first)):
        if first[i] is not second[i]:
            return i
    

def XmasFunction02(ids):
    for id in ids:
        for index in range(0,len(ids)):
            id2 = ids[index]
            dif = getDifferences(id,id2)
            if (dif==1):
                return getSameChars(id,id2)

testInput =["abcde"
            ,"fghij"
            ,"klmno"
            ,"pqrst"
            ,"fguij"
            ,"axcye"
            ,"wvxyz"
]

print(XmasFunction01(puzzleInput))
print(XmasFunction02(puzzleInput))