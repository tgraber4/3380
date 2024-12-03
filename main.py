import mysql.connector

import re

import func1
import func2
import func3
import func4

with open("pass.txt", "r") as file:
    content = file.read()




#         Function Formats
# ----------------------------------
# func1.addEmployee("Bob", "Jay", "Howard", "877676565", "M", "Cashier", "217 Lowry Lane", "1978-09-07", "123456789", ["776-865-3422", "987-787-6856"]) 
# func2.addOrder(5, 499.95, 'Furnature Inc.', 'Bob Miller', '2024-11-29', 'Ordered', 1, 1)
# func4.updateOrderStatus(4, "Delivered")
# func3.GetProductStock(4)





def GetIntFromUser(message):
    while True:
        try:
            user_input = int(input(message))
            return user_input
        except ValueError:
            print("That's not a valid integer. Please try again.")

def GetStringFromUser(message):
    user_input = input(message)
    return user_input

def GetStringOfLength(length, message):
    while True:
        user_input = input(message)
        if len(user_input) == length:
            return user_input
        else:
            print("Your input must be exactly " + length + " characters long. Please try again.")

def isValidDay(month, day):
    days_in_month = {
        1: 31, 2: 29, 3: 31, 4: 30, 5: 31, 6: 30,
        7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31
    }
    if day < 1 or day > days_in_month.get(month, 0):
        return False 
    return True 


def getDate(message1, message2, message3):
    tempTruthValue = True
    birthYear = 0
    while tempTruthValue:
        birthYear = GetIntFromUser(message1)
        if birthYear > 2024 or birthYear < 1800:
            print("Year entered is invalid.")
        else:
            tempTruthValue = False
    tempTruthValue = True
    birthMonth = 0
    months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
    ]
    i = 1
    for item in months:
        print(str(i) + " - " + item)
        i += 1
    while tempTruthValue:
        birthMonth = GetIntFromUser(message2)
        if birthMonth < 1 or birthMonth > 12:
            print("Day entered is invalid.")
        else:
            tempTruthValue = False
    tempTruthValue = True
    birthDay = 0
    while tempTruthValue:
        birthDay = GetIntFromUser(message3)
        if isValidDay(birthMonth, birthDay):
            tempTruthValue = False
        else:
            print("Day entered is invalid.")
    return str(birthYear) + "-" + str(birthMonth) + "-" + str(birthDay)

def getListofPhoneNumbers():
    tempTruthValue = True
    tempList = []
    print("Type 'done' when finished entering phone numbers.")
    while tempTruthValue:
        tempValue = GetStringFromUser("Input phone number for employee: ")
        if tempValue == "done":
            tempTruthValue = False
            break
        if len(tempValue) > 15:
            print("Phone Number entered is invalid.")
        else:
            tempList.append(tempValue)
    return tempList

# uses Regex pattern(re)
def getDemicalFromUser(message):
    pattern = r'^\d{1,10}(\.\d{1,2})?$'
    
    tempTruthValue = True
    while tempTruthValue:
        number = input(message)
        number_str = str(number)
        if re.match(pattern, number_str):
            return float(number_str)
        else:
            print("Incorrect format.")

userInput = ""
while (userInput != "exit"):
    print("Add Employee - 1")
    print("Add Product Order - 2")
    print("Get Invetory For Product - 3")
    print("Update Product Order Status - 4")
    print("End Program - exit")
    userInput = input("Choose a function: ")
    print("\n")
    if userInput == "exit":
        break
    try:
        if int(userInput) == 1:
            fName = GetStringFromUser("First name: ")
            mName = GetStringFromUser("Middle name: ")
            lName = GetStringFromUser("Last name: ")
            SSN = GetStringOfLength(9, "SSN: ")
            gender = GetStringOfLength(1, "Gender(M/F): ")
            position = GetStringFromUser("Position: ")
            address = GetStringFromUser("Address: ")
            mgrSSN = GetStringOfLength(9, "Manager's SSN: ")
            dob = getDate("Input year employee was born: ", "Input month employee was born in using number format: ", "Input day employee was born: ")
            phoneNumbers = getListofPhoneNumbers()
            func1.addEmployee(fName, mName, lName, SSN, gender, position, address, dob, mgrSSN, phoneNumbers)
        elif int(userInput) == 2:
            quantity = GetIntFromUser("Enter quantity of product ordered: ")
            pricePaid = getDemicalFromUser("Enter price paid for order: ")
            supplerName = GetStringFromUser("Enter Supplier Name: ")
            supplerContactName = GetStringFromUser("Enter name of Contact for Supplier: ")
            shippingDate = getDate("Input year order was made: ", "Input month order was made: ", "Input day order was made: ")
            status = GetStringFromUser("Enter order status: ")
            empID = GetIntFromUser("Enter ID of employee that made order: ")
            productID = GetIntFromUser("Enter ID of product order is for: ")
            func2.addOrder(quantity, pricePaid, supplerName, supplerContactName, shippingDate, status, empID, productID)
        elif int(userInput) == 3:
            productID = GetIntFromUser("Enter ID of product you want the inventory of: ")
            print("\n")
            func3.GetProductStock(productID)
            print("\n")
        elif int(userInput) == 4:
            productID = GetIntFromUser("Enter ID of order you want to update: ")
            status = GetStringFromUser("Enter new order status: ")
            func4.updateOrderStatus(productID, status)
        else:
            print("Invalid number.")
    except ValueError:
        print("That's not a valid response.")
    
    


