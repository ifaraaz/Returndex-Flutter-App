import 'package:flutter/material.dart';
import 'package:returndex/ui/home.dart';
import 'package:returndex/ui/otp_verify.dart';
import 'package:returndex/ui/signup.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
          resizeToAvoidBottomPadding: false,
          //backgroundColor: Colors.grey,
          body: Container(
            child: ListView(
              // fit: StackFit.expand,
              children: <Widget>[
                //   Container(
                //   decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage("images/back6.jpg"),
                //     fit: BoxFit.cover,
                //   )

                // ),
                //     ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 0.0),
                            child: Text('Login',
                                style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),

// second line text
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 115.0, 0.0, 0.0),
                            child: Text('Here',
                                style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),

// dot in same line

                          Container(
                            padding:
                                EdgeInsets.fromLTRB(180.0, 115.0, 0.0, 0.0),
                            child: Text('.',
                                style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                )),
                          ),
                        ],
                      ),
                    ),

                    //textfields

                    Container(
                      padding:
                          EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                )),
                          ),

                          SizedBox(
                              height:
                                  10.0), // just for spacing between textboxes

                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                )),
                          ),

                          SizedBox(
                            height: 30.0,
                          ),

                          Container(
                            height: 40.0,
                            width: 200.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.grey,
                              color: Colors.redAccent,
                              elevation: 7.0,
                              child: InkWell(
                                onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
                                },
                                child: Center(
                                  child: Text('LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 15.0,
                          ),

                          Container(
                            height: 40.0,
                            width: 200.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VerifyOTP()));
                                },
                                child: Center(
                                  child: Text('LOGIN WITH OTP',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 45.0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                },
                                child: Text('CREATE A NEW ACCOUNT HERE',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
