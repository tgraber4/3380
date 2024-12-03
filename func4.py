import mysql.connector

with open("pass.txt", "r") as file:
    content = file.read()



def updateOrderStatus(orderID, status):
    
    cnx = mysql.connector.connect(user='root', host='127.0.0.1', password=content)
    cursor = cnx.cursor()
    cursor.execute('use store')
    # check if order id is valid
    cursor.execute("UPDATE Product_Order SET Status = '" + status + "' Where Order_ID = " + str(orderID))
    print("\n")
    print("Order status updated to '" + status + "'.")
    print("\n")
    cnx.commit()
    cursor.close()
    cnx.close()