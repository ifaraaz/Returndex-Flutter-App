import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ReturnDex/reuseable/networkUtility.dart';
import 'package:ReturnDex/ui/login.dart';
import 'package:ReturnDex/ui/otp_verify.dart';
import 'package:ReturnDex/ui/tags.dart';
import 'package:ReturnDex/ui/welcome.dart';
import 'package:ReturnDex/walkthrough.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
    primaryColor: Colors.red,
    accentColor: Colors.lightBlue,)
    ,
      home: MySplashScreen(),
      routes: <String, WidgetBuilder> {
    '/login': (BuildContext context) => MyLoginPage(),
    '/verifyOTP' : (BuildContext context) => VerifyOTP(),
    '/walkthrough' : (BuildContext context) => MyWalkthroughScreen(),
    '/welcome' : (BuildContext context) => MyWelcomePage(),
    '/tags' : (BuildContext context) => MyTagsPage()
  },
    );
  }
}


class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  String _token = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTokenPreferences().then(updateToken);
    
        Timer(
      Duration(
        seconds: 4 // set duration of splash screen in seconds
      ),

()=>

navigateRoute()
     // ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage() ))

      //()=> Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage() )) /// need to place login page here 
    );

    

    
  }



void navigateRoute(){
internetConnectivityCheck().then((intenet) {
      if (intenet != null && intenet) {
        // Internet Present Case
        if (_token == "" || _token == null) {
    //not login
   // print(_token);
    Navigator.of(context).pushReplacementNamed('/login');
  }
  else{
    //login
    print(_token + " login ");
     Navigator.of(context).pushReplacementNamed('/welcome');
  }
      }
      else{
         // No-Internet Case
         showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Error !'),
        content: new Text('No Internet Connectivity.'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => exit(0),
            child: new Text('Close'),
          ),
         
        ],
      ),
    ) ?? false;
      }
     
    });
}



void updateToken(String token)
{
  setState(() {
   this._token =token; 
  });
}




 @override
  Widget build(BuildContext context)
  {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
body: Stack(
  fit: StackFit.expand,
  children: <Widget>[
    Container(
      decoration: BoxDecoration(color: Colors.black87),
      
      child: Image(
              image: AssetImage('images/22.jpg'),
              fit: BoxFit.fill,
      )
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Padding(
                  padding: EdgeInsets.only(top: 10.0,left: 10),
                ),
                LogoImage(), // Logo Image
                Text(
                  "ReturnDex",
                  style:TextStyle(
                    
                    color:Colors.white,
                    fontSize:50.0,
                    fontFamily: 'Bauhaus',
                    fontWeight: FontWeight.bold
                    
                  )
                )
              ],
            ),
          ),
        ),

Expanded(
  flex: 1,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CircularProgressIndicator(),
      Padding(padding: EdgeInsets.only(top: 20.0),
      ),
      Text("India's Recovery Service",style:TextStyle(
        color:Colors.white,
                    fontSize:ScreenUtil(allowFontScaling: true).setSp(45),
                    fontWeight: FontWeight.bold

      )
      )
    ],
  ),
)

      ],
    )
  ],
),
    );
  }

}

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image image = Image(image: assetImage, width: 120.0, height: 120.0);
    
    return Container(child: image);
  }
}
