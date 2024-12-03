import mysql.connector

with open("pass.txt", "r") as file:
    content = file.read()



def addOrder(quantity, pricePaid, supplierName, supplierContactName, shippingDate, status, empID, productID):
    
    cnx = mysql.connector.connect(user='root', host='127.0.0.1', password=content)
    cursor = cnx.cursor()
    cursor.execute('use store')
    cursor.execute("INSERT INTO PRODUCT_ORDER (Quantity, Price_Paid, Supplier_Name, Sup_Contact_Name, Shipping_Date, Status, Emp_ID, Product_ID) VALUES(" + str(quantity) + ", " + str(pricePaid) + ", '" + supplierName + "', '" + supplierContactName + "', '" + shippingDate + "', '" + status + "', " + str(empID) + ", " + str(productID) + ")")
    
    print("\n")
    print("Order added.")
    print("\n")
    cnx.commit()
    cursor.close()
    cnx.close()