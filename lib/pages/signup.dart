import 'dart:convert';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:http/http.dart';



class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formkey = GlobalKey<FormState>();
  int formkeycount = 0;
  bool check = false;
  Map data = {};
  String first_name;
  String last_name;
  String email;
  String phone;
  String password;
  String confirm_password;

  Future<void> getData() async {
    print('getting...');
    try {
      Response response = await post(
          // "http://35.213.188.65/account/signup/", body: {
        "http://10.0.2.2:8000/account/signup/",
        body: {
        "first_name": this.first_name,
        "last_name": this.last_name,
        "email": this.email,
        "phone": this.phone,
        "password": this.password
      });
      // print("${response.statusCode} and ${response.body}");
      setState(() {
        this.data = json.decode(response.body);
      });
    } catch (e) {
      print("error is dar : $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: Builder(
        builder: (BuildContext context){
          return SafeArea(
            child: Form(
              key: this._formkey,
              child: Column(
              children: [
              this.MyLogo()
              ,
              Expanded(
              child: Container(
              decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
              width: 0.1,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
              BoxShadow(
              color: Colors.grey[900],
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5),
              ),
              ],
              ),

              child: Padding(
              padding: const EdgeInsets.fromLTRB(9, 5, 9, 5),
              child: ListView(
              children: [

              this.MyBox(30),
              this.MyNameField(),
              this.MyBox(8),
              this.MyEmailField(),
              this.MyBox(8),
              this.MyPhoneField(),
              this.MyBox(8),
              this.MyPasswordField(),
              this.MyBox(10),
              this.TermsField(),
              this.MyBox(10),
              this.MySignupField(context),
              TextButton(
              child: Text("Terms and conditions"),
              onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("apk")));
              },
              )
              ],
              ),
              ),
              ),
              flex: 6,
              ),
              Expanded(
              flex: 2,
              child: Container(),
              )
              ],
              //       // color: Colors.limeAccent,
              //       // child: Text(
              //       //     "Sign in page",
              //       //   style: TextStyle(
              //       //     color: Colors.white,
              //       //   ),
              //       ),

              ),
              ),
              );
            },

          ),
        );
    //   ),
    // );
  }


  Widget MyLogo() {
    return Expanded(
      child: Container(
        child: Center(
          child: Text(
            "Zayy",
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey[200],
            ),
          ),
        ),
      ),
      flex: 2,
    );
  }

  Widget MyNameField() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter you first name!";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'First Name',
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(0.5)
              // )
            ),
            onChanged: (e) {
              setState(() {
                this.first_name = e;
              });
              if(this.formkeycount>0){
                this._formkey.currentState.validate();
              }

            },

          ),
        ),
        Expanded(
          child: Container(

          ),
          flex: 1,
        ),
        Expanded(
          flex: 5,
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter you last name!";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Last Name',

            ),
            onChanged: (e) {
              setState(() {
                this.last_name = e;
              });
              if(this.formkeycount>0){
                this._formkey.currentState.validate();
              }

            },

          ),
        ),

      ],
    );
  }

  Widget MyEmailField() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            validator: (value) {
              String re = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              if (value.isEmpty) {
                return "Please enter your email address!";
              }
              if(!RegExp(re).hasMatch(this.email.toLowerCase())){
                return "Invalid email address!";
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: 'Email',
                hintText: "Enter your email e.g. abc@gmail.com",
                hintStyle: TextStyle(
                  fontSize: 13,
                )
            ),
            onChanged: (e) {
              setState(() {
                this.email = e;
              });
              if(this.formkeycount>0){
                this._formkey.currentState.validate();
              }

            },

          ),
        ),
      ],
    );
  }

  Widget MyPhoneField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,6),
              child: Text(
                "+95",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
        ),
        Expanded(
          flex: 7,
          child: TextFormField(
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your phone number!";
              }
              if(value.length<6){
                return "Invalid phone number!";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Phone Number',
            ),
            onChanged: (e) {
              setState(() {
                this.phone = e;
              });
              if(this.formkeycount>0){
                this._formkey.currentState.validate();
              }

            },

          ),
        ),
        Expanded(
          flex: 0,
          child: Container(

          ),
        ),
      ],
    );
  }

  Widget MyPasswordField() {
    return Row(
      children: [

        Expanded(
          flex: 5,
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Enter your password!";
              }
              if (this.password.length<8){
                return "Password must be at least eight characters!";
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',

            ),
            onChanged: (e) {
              setState(() {
                this.password = e;
              });
              if(this.formkeycount>0){
                this._formkey.currentState.validate();
              }

            },

          ),
        ),
        Expanded(
          child: Container(

          ),
          flex: 1,
        ),
        Expanded(
          flex: 5,
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Enter your confirm password!";
              }
              if(this.confirm_password != this.password){
                return "Passwords are not same!";
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',

            ),
            onChanged: (e) {
              setState(() {
                this.confirm_password = e;
              });
              if(this.formkeycount>0){
                this._formkey.currentState.validate();
              }
            },

          ),
        ),
      ],
    );
  }

  Widget TermsField() {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: Text(
                "I have read and I accpet the terms and conditions."
            ),
            onChanged: (e) {
              if (this.check) {
                setState(() {
                  this.check = false;
                });
              } else {
                setState(() {
                  this.check = true;
                });
              }
            },
            value: this.check,

          ),
        ),
        // Expanded(
        //   flex: 2,
        //   child: Container(),
        // )
      ],
    );
  }

  Widget MySignupField(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(),
        ),
        Expanded(
          flex: 3,
          child: FlatButton(
            disabledColor: Colors.grey[400],
            disabledTextColor: Colors.white,
            child: Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            onPressed: !this.check ? null : () async {
              setState(() {
                this.formkeycount +=1;
              });
              if (this._formkey.currentState.validate()) {
                  await this.getData();
                if (this.data['message']!=null){
                  Scaffold.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red[400],
                        content: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Text(
                                this.data['message'],
                                style: TextStyle(
                                  color: Colors.grey[200]
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.error,
                                size: 30,
                                color: Colors.grey[200],
                              ),
                            ),
                          ],
                        )
                      )
                  );
                  setState(() {
                    this.data['message']=null;
                  });

                }else if(this.data['message']==null){
                  Scaffold.of(context).showSnackBar(
                      SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                          content: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "Your account is created",
                                  style: TextStyle(
                                      color: Colors.grey[100]
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.check_circle,
                                  size: 30,
                                  color: Colors.grey[100],
                                ),
                              ),
                            ],
                          )
                      )
                  );
                }

              }
            },
            color: Colors.deepPurple,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(),
        )
      ],
    );
  }

  Widget MyBox(double _height) {
    return SizedBox(
      height: _height,
    );
  }

  //  void _onpress(BuildContext context) {
  //
  // }
}
