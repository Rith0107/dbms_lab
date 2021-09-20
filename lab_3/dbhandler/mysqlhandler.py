import mysql.connector

class mysqlhandler:
    def __init__(self):
        pass;

    def myfunc(self):

        from mysql.connector import Error
        try:
            pwd = input("Enter mysql password: ")
            connection = mysql.connector.connect(host='localhost',
                                                 database='UserDB',
                                                 user='root',
                                                 password= pwd)
            if connection.is_connected():
                db_Info = connection.get_server_info()
                cursor = connection.cursor(buffered=True)
                cursor.execute("select database();")
                
                
                def display_users() :
                    query= ("Select * from user_data")
                    cursor.execute(query)
                    for i in cursor:
                        print(i)

                def add_user() :
                    na=input("Enter name of user : ")
                    ph=input("Enter phone number of user : ")
                    do=input("Enter dob of user:")
                    query=("insert into user_data(name,phno,dob)" "values(%s,%s,%s)");
                    data=(na,ph,do)
                    cursor.execute(query,data)
                    connection.commit()

                def delete_user() :
                    na=input("Enter name of the user to delete : ")
                    query=("delete from user_data where name='%s' "%(na));
                    cursor.execute(query)
                    connection.commit()

                def update_user() :
                    na=input("Enter the user's name whose details you want to update :")
                    field=input("Enter the field you want to update :")
                    value=input("The value you want to update the field with :")
                    query=("update user_data set %s='%s' where name='%s' " %(field,value,na))
                    cursor.execute(query)
                    connection.commit()
                
                f=int(input("Function Codes :\n Enter 1 for displaying users \n Enter 2 for adding user data \n Enter 3 for deleting a user \n Enter 4 for updating a user data \n"))
                if f==1 :
                    display_users()
                elif f==2 :
                    add_user()
                elif f==3 :
                    delete_user()
                elif f==4 :
                    update_user()
                else :
                    print("give a valid input") 

        except Error as e:
            print("Error", e)
                
if __name__ == "__main__":
    mydb = mysqlhandler()
    mydb.myfunc()
