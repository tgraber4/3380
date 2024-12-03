import mysql.connector

with open("pass.txt", "r") as file:
    content = file.read()


 # delete from employee_manager where emp_id = 34;
 # delete from Phone_numbers where emp_id = 34;
 # delete from employee where emp_id = 34;

def addEmployee(fName, mName, lName, SSN, gender, companyPosition, address, DOB, mgrSSN, phoneNumbers):
    
    cnx = mysql.connector.connect(user='root', host='127.0.0.1', password=content)
    cursor = cnx.cursor()
    cursor.execute('use store')
    cursor.execute("INSERT INTO Employee (FName, MName, LName, SSN, Gender, Position, Address, Dob) VALUES ('" + fName + "', '" + mName + "', '" + lName + "', '" + SSN + "', '" + gender + "', '" + companyPosition + "', '" + address + "', '" + DOB + "')")
    cursor.execute("select emp_id from employee where FName = '" + fName + "'AND SSN = '" + SSN + "'")
    result = cursor.fetchall() 
    values = [t[0] for t in result]
    tempString = ""
    for t in values:
        tempString += str(t)

    cursor.execute("INSERT INTO Employee_Manager Values ("  + tempString + ", " + mgrSSN + ")")
    for element in phoneNumbers:
        cursor.execute("INSERT INTO Phone_Numbers Values ("  + tempString + ", '" + element + "')")
    print("\n")
    print("Added Employee with id: " + tempString)
    print("\n")
    cnx.commit()
    cursor.close()
    cnx.close()