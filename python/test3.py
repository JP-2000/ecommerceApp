from itertools import permutations 
from itertools import product

global noOfSalesman
noOfSalesman = int()
global nodesDictionary
nodesDictionary = dict()
global matrix
global totalWeightAndPathList
global totalPathWeightList
global finalList
global bestpath
bestpath = list() 
totalWeightAndPathList = list()
totalPathWeightList = list()
finalList =list()

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

def idk(arr):
    for i in arr:
        idealValueDifferenceArray(i)
    parseDictionary()


def addTotalWeightAndPath(node):

	pathsList = []
	for i in node:
		pathsList.append(list(i))
	for i in pathsList:
		i.insert(0, 0)
		i.append(0)		
	
	totalPathWeight = 0
	for i in pathsList:
		totalPathWeight = totalPathWeight + pathWeight(i)

	totalPathWeightList.append(totalPathWeight)
	
	tempList = []	
	tempList.append(totalPathWeight)
	tempList.append(pathsList)
	totalWeightAndPathList.append(tempList)


def combinations(str1, rno):
  chars = list(str1)
  results = []
  for c in product(chars, repeat = rno):
    results.append(c)
  return results

def lengthCombinations(nodes, noOfSalesman):
	tempNodes = nodes
	
	string = ""
	for i in tempNodes:
		string = string + str(i)

    #add to List
	temp =[]
	for k in combinations(string, noOfSalesman):
	    temp.append(k)

	#tuples to lists
	temp2 = []
	for i in temp:
	    temp2.append(list(i))

	#strings to ints
	for j in range(0, len(temp2)):
	    for k in range(0, len(temp2[j])):
	        temp2[j][k] = int(temp2[j][k])

	#create List with sum 6
	lengthCombinationsList = []
	for i in temp2:
	    sum = 0
	    for j in i:           
	        sum = sum + j
	    if(sum == max(tempNodes)):
	        lengthCombinationsList.append(i)
	temp = []
	temp2 = []
	temp3 = []

	for a in lengthCombinationsList:
		temp.clear()
		c = 0
		temp2.clear()
		for b in a:
			temp3.clear()
			for e in range(0, b):
				temp3.append(tempNodes[c])
				c = c + 1
			temp2.append(tuple(temp3))
		addTotalWeightAndPath(temp2)

def pathWeight(path):
	weight = 0
	for i in range (0, len(path) - 1):
		weight = weight + matrix[path[i]][path[i + 1]]
	return weight

def calc(nodes):	
	for i in list(permutations(nodes)):
			lengthCombinations(list(i), noOfSalesman)

	for i in totalWeightAndPathList:
		if(i[0] == min(totalPathWeightList)):
			finalList.append(i)
	
	pathLengthsList = []
	for i in finalList:
		temp = []
		for j in i[1]:
			temp.append(pathWeight(j))
		i.append(temp)
		pathLengthsList.append(temp)
	idk(pathLengthsList)

	for i in finalList:
		if(i[2] == optimalPathLengthsList[0]):
			bestpath.append(i[1])
			break

def calc2(nodes):
	temp = []
	temp2 = []
	for i in nodes:
		temp.append([0, i, 0])
	bestpath.append(temp)


def main():
	
	matrix = [
		[0, 1, 2,  3,  4],
		[1, 0, 5,  6,  7],
		[2, 5, 0,  8,  9],
		[0, 6, 8,  0, 10],
		[0, 7, 9, 10,  0],
	]

	nodesDictionary = {
		0 : [22.834665, 75.436932],
		1 : [21.859202, 48.718181],
		2 : [2.018592, 17.780681],
		3 : [-6.705950, -44.386064],
		4 : [27.860554, -108.150714]
	}
	
	nodes = []
	nodes.clear()
	for i in range(1, len(matrix)):
		nodes.append(i)
	print(nodes)

	noOfSalesman = 3;

	if(noOfSalesman > len(nodes)):
		print('No of Salesman are more than the no of places to deliver')
		test.noOfSalesman = len(nodes)
		calc2(nodes)

	if(noOfSalesman < len(nodes)):
		print('test2')
		calc(nodes)
		
	if(noOfSalesman == len(nodes)):
		print('test3')
		calc2(nodes)

	print(bestpath[0])

main()


