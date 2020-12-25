import mysql.connector

#connection
mydb = mysql.connector.connect(host = "localhost", user = "root", password = "", database = "milk_app_database")

if(mydb):
	print("Connection Successful")
else:
	print("Connection Failure")

mycursor = mydb.cursor()
mycursor.execute("SELECT latitude, longitude FROM addresses")

myresult = mycursor.fetchall()

for i in myresult:
	print(i)


'''for db in mycursor:
	print(db)

#create table
mycursor.execute("CREATE TABLE test (name varchar(256), id int)")

for db in mycursor:
	print(db)'''

