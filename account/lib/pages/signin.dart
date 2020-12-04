import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}


class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();
  int formkeycount=0;
  String user;
  String password;
  Map data = {};


  Future<void> getData() async{
    try{
      Response response = await post("http://10.0.2.2:8000/account/signin/",
          body: {
            "user":this.user,
            "password":this.password
          }
      );
      setState(() {
        this.data = jsonDecode(response.body);
      });
    }catch(e){
      print("Error is : $e");
    }
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      body: Builder(
          builder: (BuildContext context)=> SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(width: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[900],
                          offset: Offset(0,5),
                        blurRadius: 10,
                        spreadRadius: 3
                      ),
                    ]
                  ),
                  child: Form(
                    key: this._formkey,
                    child: ListView(
                      children: [
                        this.mysizedbox(45),
                        this.myuserform(),
                        this.mysizedbox(20),
                        this.mypasswordform(),
                        this.mysizedbox(5),
                        this.mysignupbutton(context),
                        this.mysizedbox(5),
                        this.mysigninbutton(context),
                        this.myforgetpassword(context),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              )
            ],
          ),
        ),
      )),
    );
  }
  Widget myuserform(){
    return Row(
      children: [
        Expanded(
          child: Container(
            child: TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return "Please enter your password!";
                }
                if(this.user.length <7){
                  return "Invalid email or phone number!";
                }
                return null;
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  labelText: "Email or Phone Number",
                  hintText: "Enter your email or phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
              ),
              onChanged: (e){
                setState(() {
                  this.user = e;
                });

              },
            ),
            color: Colors.purple[50],
          ),
        )
      ],
    );
  }
  Widget mypasswordform(){
    return Row(
      children: [
        Expanded(
          child: Container(
            child: TextFormField(
              obscureText: true,
              validator: (value){
                if(value.isEmpty){
                  return "Please enter your password!";
                }
                if(this.password.length <7){
                  return "Password must be at least 8 characters!";
                }
                return null;
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
              ),
              onChanged: (e){
                setState(() {
                  this.password = e;
                });
              },
            ),
            color: Colors.purple[50],
          ),
        )
      ],
    );
  }

  Widget mysignupbutton(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("if you don't have account,"),
        TextButton(
          onPressed: (){
            Widget snackbar = SnackBar(
              duration: Duration(seconds: 1),
              content: Text("Sign up page"),
            );
            Scaffold.of(context).showSnackBar(snackbar);
          },
          child: Text("Sign up"),
        ),
      ],
    );
  }

  Widget mysigninbutton(BuildContext context){
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.purple[700],
              child: Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 4,
                ),
              ),
              onPressed: () async {
                if(this._formkey.currentState.validate()){
                  await this.getData();
                  if(this.data["message"] != null){
                    Widget snackbar = SnackBar(
                      backgroundColor: Colors.red[400],
                      duration: Duration(seconds: 2),
                      content: Text(this.data["message"]),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  }else if(this.data['message']==null){
                    print(this.data);

                    Navigator.pushReplacementNamed(context, '/home');
                  }
                }

              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            ),
          ),
      ],
    );
  }

  Widget myforgetpassword(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: Text("forget password"),
          onPressed: (){
            Widget snackbar = SnackBar(
              duration: Duration(seconds: 2),
              content: Text("Don't forget your password."),
            );
            Scaffold.of(context).showSnackBar(snackbar);
          },
        )
      ],
    );
  }

  Widget mysizedbox(double e){
    return SizedBox(
      height: e,
    );
  }
}
