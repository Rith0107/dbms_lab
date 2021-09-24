import mysql.connector

class sqlhandler:
    
    def myfunc(data,f):
        
        from mysql.connector import Error


        try:
            connection = mysql.connector.connect(host='localhost',
                                                 database='UserDB',
                                                 user='root',
                                                 password='rithwik17')
            if connection.is_connected():
                db_Info = connection.get_server_info()
                cursor = connection.cursor(buffered=True)
                cursor.execute("select database();")


                def display_table(data) :
                    query= ("select * from user_data")
                    cursor.execute(query)
                    for rows in cursor:
                        print(rows)

                def add_user(data) :
                    na=data["name"]
                    ph=data["phno"]
                    do=data["dob"]
                    query=("insert into user_data(name,phno,dob)" "values(%s,%s,%s)");
                    data=(na,ph,do)
                    cursor.execute(query,data)
                    connection.commit()

                def delete_user(data) :
                    na=data["name"]
                    query=("delete from user_data where name='%s' "%(na));
                    cursor.execute(query)
                    connection.commit()

                def update_user(data) :
                    na=data["name"]
                    field=data["field"]
                    value=data["value"]
                    query=("update user_data set %s='%s' where name='%s' " %(field,value,na))
                    cursor.execute(query)
                    connection.commit()

                
                if f==1 :
                    display_table(data)
                elif f==2 :
                    add_user(data)
                elif f==3 :
                    update_users(data)
                elif f==4 :
                    delete_user(data)
                else :
                    print("Wrong Format") 

        except Error as e:
            print("Error", e)
            
    
