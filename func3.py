import mysql.connector

with open("pass.txt", "r") as file:
    content = file.read()



def GetProductStock(productID):
    
    cnx = mysql.connector.connect(user='root', host='127.0.0.1', password=content)
    cursor = cnx.cursor()
    cursor.execute('use store')
    # check if productID is valid
    cursor.execute("SELECT Stock FROM Product Where Product_ID = " + str(productID))
    result = cursor.fetchall() 
    temp = result[0]
    stock = ""
    for row in temp: 
        stock += str(row)
    print("Product has " + stock + " items in stock") 
    cursor.close()
    cnx.close()