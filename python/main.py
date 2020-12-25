import test

global bestpath
bestpath = list()


def main():
	
	test.matrix = [
		[0, 1, 2,  3,  4],
		[1, 0, 5,  6,  7],
		[2, 5, 0,  8,  9],
		[0, 6, 8,  0, 10],
		[0, 7, 9, 10,  0],
	]

	test.nodesDictionary = {
		0 : [22.834665, 75.436932],
		1 : [21.859202, 48.718181],
		2 : [2.018592, 17.780681],
		3 : [-6.705950, -44.386064],
		4 : [27.860554, -108.150714]
	}
	
	nodes = []
	nodes.clear()
	for i in range(1, len(test.matrix)):
		nodes.append(i)
	print(nodes)

	test.noOfSalesman = 3;

	if(test.noOfSalesman > len(nodes)):
		print('No of Salesman are more than the no of places to deliver')
		test.noOfSalesman = len(nodes)
		test.calc2(nodes)

	if(test.noOfSalesman < len(nodes)):
		print('test2')
		test.calc(nodes)
		
	if(test.noOfSalesman == len(nodes)):
		print('test3')
		test.calc2(nodes)

	bestpath = test.bestpath[0]

	print(bestpath)


main()