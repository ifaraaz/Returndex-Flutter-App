import 'package:flutter/material.dart';
import 'package:ReturnDex/reuseable/networkUtility.dart';
import 'package:ReturnDex/ui/otp_verify.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   final GlobalKey<ScaffoldState> _scaffoldKey_register = new GlobalKey<ScaffoldState>();
  var _formKey_register =GlobalKey<FormState>();
  var mobileKey_register = GlobalKey<FormFieldState>();

  TextEditingController registerController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey_register,
        body: Form(
          key: _formKey_register,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                      child: Text('Signup',
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
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(45.0, 5.0, 45.0, 5.0),
                  ),
                  ImageHolder(),
                  SizedBox(height: 15.0),
                  Text("Enter your mobile number to ",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      )),
                  Text("create new account ",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text("We will send you One Time Password (OTP)"),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 300.0,
                    child: Center(
                      child: TextFormField(
                        controller: registerController,
                        keyboardType: TextInputType.number,
                            maxLength: 10,
                            validator: (String value){
                              if (value.isEmpty) {
                                return "Please enter Mobile Number";
                              }
                              else if(value.isNotEmpty){
                                 var result = value.length < 10 ? "Invalid Mobile Number" : null;
                                 return result;

                              }
                            },
                        decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            )),
                      ),
                    ),
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
                          setState(() {
                           if (_formKey_register.currentState.validate()) {
                             _regiterButtonClicked();
                                                        } 
                                                       });
                                                       },
                                                     child: Center(
                                                       child: Text('SEND OTP',
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
                             
                               void _regiterButtonClicked() async{
                                 showSnackBar(_scaffoldKey_register, 'Please wait ...');
                                  var responseJson =await registerwithOTP(registerController.text);
                                  print(responseJson);

  	                              if(responseJson == null) {
                                	showSnackBar(_scaffoldKey_register, 'Something Went Wrong !');
                                  	}

                                else{
              
                                     String otp =responseJson.otpValue;
                                      print("faraaz " + otp);
                                      bool checkuser =responseJson.checkUserexist;
                                      if (checkuser ==true) {
                                    	showSnackBar(_scaffoldKey_register, 'This Number already Registered, please Login');        
                                    }
                                else if(checkuser == false){
                                    	showSnackBar(_scaffoldKey_register, 'Sending SMS to ' + registerController.text);
                                      Navigator.push(
                                                    context,
                                            MaterialPageRoute(builder: (context) => VerifyOTP(mobileNumber: registerController.text, requestType: "Register",)),
                                            );}
                                }
                               }
}

class ImageHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/signup2.png');
    Image image = Image(image: assetImage, width: 60.0, height: 80.0);

    return Container(child: image);
  }
}