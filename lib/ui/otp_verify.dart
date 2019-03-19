import 'package:flutter/material.dart';
import 'package:returndex/reuseable/functions.dart';

class VerifyOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                      child: Text('Verify',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),

// second line text
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent)),
                    ),
                  ],
                ),
              ),


SizedBox(height: 20.0,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(45.0, 5.0, 45.0, 5.0),
                  ),
                  ImageHolder(),
                  SizedBox(height:15.0),
                  Text("Enter OTP recieved on your",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      )),
                  Text("mobile number ",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      )),


                  SizedBox(
                    height: 15.0,
                  ),

                  
                  Text("We have send OTP to 8574151908"),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 300.0,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Enter OTP',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("If you didn't recieve the code ",style: TextStyle(
                        color:Colors.grey,
                      ),),
 InkWell(
                    onTap: (){

                    },
                    child: Text("RESEND", style:TextStyle(
                      color:Colors.redAccent,
                      fontWeight: FontWeight.bold,

                    )),
                  ),
                    ],
                  ),
                  
                 
                  SizedBox(
                    height: 20.0,
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
                          verifyOTPandNavigate();
                                 },
                                                  child: Center(
                                                    child: Text('VERIFY',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          
                            void verifyOTPandNavigate() {
//check for otp verification throught API
String isOTPvalid = "";

if (isOTPvalid == "") {
  //OTP valid 
  //check whether it is registartion or login
  //save values to shared preferences 
  saveTokenPreferences("testing token");
}
else{
  //show alert for invalid re-enter the value
}

// Navigator.push(context, MaterialPageRoute(builder: (context) => MyWalkthroughScreen() ));
                                             
                            }
}

class ImageHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/verifyotp.png');
    Image image = Image(image: assetImage, width: 60.0, height: 80.0);

    return Container(child: image);
  }
}
