import test

global optimalPathLengthsList    
optimalPathLengthsList = []
global dictionary
dictionary = dict()


def compareDifferences(arr1, arr2):
    points = {
        "arr1" : 0,
        "arr2" : 0
    }
    for i in range(0, len(arr1)):
        if(arr1[i] < arr2[i]):
            points["arr1"] += 1
        elif(arr2[i] < arr1[i]):
            points["arr2"] += 1
    if(points["arr1"] >= points["arr2"]):
        return arr1
    else:
        return arr2

def parseDictionary():
    index = []
    temp = list(dictionary.values())[0]
    for i in temp:
        index.append(i) 
    for i in list(dictionary.values()):
        index = compareDifferences(index, i)
    for key, value in dictionary.items():
        if(value == index):
            answer(key)
def answer(ans):
    optimalPathLengthsList.append(list(ans))

def idealValue(arr):
    tempSum = 0
    for i in arr:
        tempSum = tempSum + i
    return tempSum / len(arr)

def idealValueDifferenceArray(arr):
    temp = []
    for i in arr:
        if(idealValue(arr) > i):
            tempDiff = idealValue(arr) - i 
        else:
            tempDiff = i - idealValue(arr)
        temp.append(tempDiff)
    dictionary[tuple(arr)] = temp 

def calc(arr):
    for i in arr:
        idealValueDifferenceArray(i)
    parseDictionary()

