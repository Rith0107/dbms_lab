from flask import Flask, request
from mysqlhandler import sqlhandler

# create the Flask app
app = Flask(__name__)



@app.route('/user/add',methods=['POST'])
def add():  
     
    data=request.get_json()
   
    sqlhandler.func(data,1)
    return("User Added")

@app.route('/user/delete',methods=['POST'])
def delete():  
     
    data=request.get_json()
    
    sqlhandler.func(data,3)
    return("User Deleted")

@app.route('/user/update',methods=['POST'])
def update():  
     
    data=request.get_json()
    
    sqlhandler.func(data,2)
    return("User Updated")

@app.route('/user/view',methods=['GET'])
def display():  
    data=dict()
    sqlhandler.func(data,4)
    return("Info Displayed on Terminal")



if __name__ == '__main__':
    # run app in debug mode on port 5000
    app.run(debug=True)