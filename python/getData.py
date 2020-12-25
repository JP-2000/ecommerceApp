import mysql.connector
import distance

global matrix
matrix = list()
global nodesDictonary
nodesDictonary = dict()
global latLong
latLong = list()

def getNodesDictionary():
#connection
	mydb = mysql.connector.connect(host = "localhost", user = "root", password = "", database = "milk_app_database")

	if(mydb):
		print("Connection Successful")
	else:
		print("Connection Failure")

	mycursor = mydb.cursor()
	mycursor.execute("SELECT latitude, longitude FROM addresses")

	myresult = mycursor.fetchall()

	latLong.clear()
	for i in myresult:
		latLong.append(list(i))
	for i in range(0, len(latLong)):
		for j in range(0, len(latLong[i])):
			latLong[i][j] = float(latLong[i][j])

	for i in range(0, len(latLong)):
		nodesDictonary[i] = latLong[i]

	return nodesDictonary

def getMatrix():
	index = 0
	for k1 in nodesDictonary.keys():
		while(index <= k1):
			temp = []
			for k2,v in nodesDictonary.items():
				lat1 = nodesDictonary[index][0]
				long1 = nodesDictonary[index][1]
				lat2 = v[0]
				long2 = v[1]
				distanceBetweenNodes = distance.distance(lat1, lat2, long1, long2)
				temp.append(distanceBetweenNodes)
			matrix.append(temp)
			index = index + 1

	return matrix


