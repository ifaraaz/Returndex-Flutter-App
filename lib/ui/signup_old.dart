import 'package:flutter/material.dart';

class MySignUpPage extends StatefulWidget {
  @override
  _MySignUpState createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUpPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 70.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                
// second line text
                Container(
                  padding: EdgeInsets.fromLTRB(255.0, 70.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style:TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent
                    )
                  ),
                ),

// dot in same line

                


              ],
              
            ),
          ),





          //textfields 

Container(
  padding: EdgeInsets.only(top:25.0, left:20.0, right:20.0),
  child: Column(
    children: <Widget>[
      TextField(
        decoration: InputDecoration(
          labelText: 'Full Name',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )
        ),
      ),

SizedBox(height: 10.0), // just for spacing between textboxes

      TextField(
        decoration: InputDecoration(
          labelText: 'Mobile Number',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )
        ),
      ),

      SizedBox(height: 5.0,),

      TextField(
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )
        ),
      ),

      SizedBox(height: 10.0,),



InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) =>MySignUpPage()
    ));
  },
  child:

Container(
  height: 40.0,
  color: Colors.transparent,
  child: Container(
    decoration: BoxDecoration(
      border:Border.all(
        color:Colors.black,
        style:BorderStyle.solid,
        width: 1.0
      ),
      color:Colors.transparent,
      borderRadius: BorderRadius.circular(20.0),
    ),

    child: Center(
       
      child: Text(
        'SEND OTP',
        style:TextStyle(
          fontWeight: FontWeight.bold,

        )
      ),
    ),
  ),
),
),

SizedBox(height: 15.0,),


TextField(
        decoration: InputDecoration(
          labelText: 'Enter Verification OTP',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )
        ),
      ),


SizedBox(height: 10.0,),

Container(
  height: 40.0,
  child: Material(
    borderRadius: BorderRadius.circular(20.0),
    shadowColor: Colors.grey,
    color:Colors.redAccent,
    elevation:7.0,
    child: GestureDetector(
      onTap: () {},
      child: Center(
        child: Text(
          'CREATE NEW ACCOUNT',
          style:TextStyle(
            color:Colors.white,
            fontWeight:FontWeight.bold,
          )
        ),
      ),
    ),
  ),
),

SizedBox(height: 10.0,),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text(
      'Account already exists ! ',
      style: TextStyle(
        color: Colors.grey
      ),
    ),

    SizedBox(height: 10.0,),





    InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Text(
        'LOGIN HERE',
        style:TextStyle(
          color:Colors.blueAccent,
          decoration: TextDecoration.underline,
        )
      ),
    )
  ],
)



    ],
  ),
)


        ],
      ),
    );
  }
}