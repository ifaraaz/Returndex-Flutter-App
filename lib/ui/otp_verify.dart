import 'package:flutter/material.dart';
import 'package:returndex/reuseable/networkUtility.dart';
import 'package:returndex/walkthrough.dart';

class VerifyOTP extends StatefulWidget {
  final String mobileNumber ;
  final String requestType;
  VerifyOTP({Key key , this.mobileNumber, this.requestType }): super (key : key) ;

  

  @override
  _VerifyOTPState createState() => _VerifyOTPState();

}

class _VerifyOTPState extends State<VerifyOTP> {
   final GlobalKey<ScaffoldState> _scaffoldKey_otp = new GlobalKey<ScaffoldState>();
  var _formKey_otp =GlobalKey<FormState>();
  var mobileKey_otp = GlobalKey<FormFieldState>();

  TextEditingController otpValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        key: _scaffoldKey_otp,
        body: Form(
          key:_formKey_otp,
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

                  
                  Text("We have send OTP to "),
                  Text("${widget.mobileNumber}"),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 300.0,
                    child: Center(
                      child: TextFormField(
                        key: mobileKey_otp,
                         keyboardType: TextInputType.number,
                            maxLength: 8,
                        controller: otpValueController,
                         validator: (String value){
                              if (value.isEmpty) {
                                return "Please enter OTP received via SMS";
                              }
                              else if(value.isNotEmpty){
                                 var result = value.length < 8 ? "Invalid OTP" : null;
                                 return result;

                              }
                         },
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
                          setState(() {
                           if(_formKey_otp.currentState.validate()){
                             String checkRequestType = "${widget.requestType}";
                             if (checkRequestType == "Login") {
                                verifyOTPandNavigate();
                             }
                             else if (checkRequestType == "Register"){
                               verifyOTPandRegister();

                             }
                             

                           } 
                          });                         
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
                          
     void verifyOTPandNavigate() async{
       	showSnackBar(_scaffoldKey_otp, 'Please wait ...');

		var responseJson =await authenticateUser("1","${widget.mobileNumber}",otpValueController.text);
    print(responseJson);     
			if(responseJson == null) {
				showSnackBar(_scaffoldKey_otp, 'Something went wrong! Please enter Correct OTP');
			} 
     
       else {
         
        	showSnackBar(_scaffoldKey_otp, 'Login Successful');

				/**
				 * Removes stack and start with the new page.
				 * In this case on press back on HomePage app will exit.
				 * **/
			 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyWalkthroughScreen()));
			}
        }



     //used when verify OTP for Register New User   

   void verifyOTPandRegister() async{
       	showSnackBar(_scaffoldKey_otp, 'Please wait ...');

		var responseJson =await registerNewUser("${widget.mobileNumber}",otpValueController.text);
      print(responseJson);     
			if(responseJson == null) {
				showSnackBar(_scaffoldKey_otp, 'Something went wrong! Please enter Correct OTP');
			} 
     
       else {
         
        	showSnackBar(_scaffoldKey_otp, 'Register Successful');

				/**
				 * Removes stack and start with the new page.
				 * In this case on press back on HomePage app will exit.
				 * **/
			 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyWalkthroughScreen()));
			}
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