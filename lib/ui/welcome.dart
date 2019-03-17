import 'package:flutter/material.dart';
import 'tags.dart';
import 'package:returndex/reuseable/slideanimation.dart';

class MyWelcomePage extends StatefulWidget {
  @override
  _MyWelcomePageState createState() => _MyWelcomePageState();
}

class _MyWelcomePageState extends State<MyWelcomePage> {

Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }



  @override
  Widget build(BuildContext context) {
     return WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
        
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 15.0, 15.0, 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "ReturnDex",
                    style:TextStyle(
                      fontSize: 25.0,
                      color:Colors.grey.shade700,
                      fontFamily: "Bauhaus",
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  SizedBox(width:95.0),
                  IconButton(
icon: Icon(Icons.notifications),
color: Colors.grey.shade500,
iconSize: 30.0,
onPressed: (){}, // icon pressed function
                  ),
                   SizedBox(width:8.0),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage("images/usericon.png"),
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
            


            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              child: Container(
                padding: EdgeInsets.only(left:10.0),
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade200,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 40.0,
                  )
                  ]
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      
                      icon: Icon(Icons.receipt,color:Colors.blue),
                      iconSize: 50.0,
                      highlightColor: Colors.deepOrange,
                      onPressed: (){
                        print("fsf");
                      }, // press event
                    ),

                    SizedBox(width: 5.0,),
                    Padding(
                      padding: EdgeInsets.only(top: 1.0,left: 1.0),
                      child: Center(
                        child: Text(
                          "Activate Your Tag",
                          style:TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            
                          )
                        ),
                      ),
                      ),

                      SizedBox(width: 10.0,),
IconButton(
  icon: Icon(Icons.arrow_forward_ios,color:Colors.grey.shade500),
  iconSize: 30.0,
  onPressed: (
      
  ){
 Navigator.push(context, SlideLeftRoute(widget: MyTagsPage())); 
      
  }, // icon pressed function

)
                  ],
                ),

              ),
            ),



            Padding(
              padding:EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 5.0) ,
              child: Container(
  height: 40.0,
  child:RaisedButton(
color:Colors.redAccent,
 child: Text(
            'REPORT LOST ITEM',
            style:TextStyle(
              color:Colors.white,
              fontWeight:FontWeight.bold,
            )
          ),
        elevation: 7.0,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
        onPressed: (){

        },
  )
  
),


              ),
              SizedBox(height:5.0),

             

             Padding(
              padding:EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0) ,
              child: Container(
  height: 40.0,
  child: RaisedButton(
       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
   child: Text(
            'REPORT FOUND ITEM',
            style:TextStyle(
              color:Colors.white,
              fontWeight:FontWeight.bold,
            )
          ),
      color:Colors.blue,
      elevation:2.0,
      onPressed: (){

      },
  ),
),
              ),

             

            Padding(
              padding: EdgeInsets.fromLTRB(15, 25.0, 15.0, 5.0),
              child:  Container(
  height: 40.0,
  color: Colors.transparent,
  child: OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      borderSide:BorderSide(
        color: Colors.grey,
      ),
      highlightedBorderColor: Colors.blueAccent,
   child: Text(
            'SEE ALL POST ',
            style:TextStyle(
              color:Colors.grey,
              fontWeight:FontWeight.bold,
            )
          ),
      color:Colors.white,
      
      onPressed: (){

      },
  ),
),
              
              ),



              Container(
                height:MediaQuery.of(context).size.height/3.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/waves.png"),
                    fit: BoxFit.cover,
                  )

                ),
              )
          ],
        )
        
      ),
    );




    
  }
}