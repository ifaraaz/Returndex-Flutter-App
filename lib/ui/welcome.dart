import 'package:ReturnDex/reuseable/networkUtility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'tags.dart';
import 'package:ReturnDex/reuseable/slideanimation.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWelcomePage extends StatefulWidget {
  @override
  _MyWelcomePageState createState() => _MyWelcomePageState();
}

class _MyWelcomePageState extends State<MyWelcomePage> {
   var _scafoldkey_welcome =GlobalKey<ScaffoldState>();

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
       ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
       return WillPopScope(
        onWillPop: _onBackPressed,
            child: Scaffold(
              key: _scafoldkey_welcome,
              floatingActionButton: SpeedDial(
            // both default to 16
            marginRight: 18,
            marginBottom: 20,
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            // this is ignored if animatedIcon is non null
            // child: Icon(Icons.add),
            visible: true,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Support',
            heroTag: 'returndex-support',
            
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                child: Icon(Icons.settings_power),
                backgroundColor: Colors.blueGrey,
                label: 'Logout',
               
                onTap: () => logoutUser_fromapp()
                              ),
                              SpeedDialChild(
                                child: Icon(Icons.call),
                                backgroundColor: Colors.blueAccent,
                                label: 'Call us',
                               
                                onTap: () => _openURL("tel:+919604960432")
                              ),
                              SpeedDialChild(
                                child: Icon(Icons.mail_outline),
                                backgroundColor: Colors.blueAccent,
                                label: 'Email us',
                               
                                onTap: () => _openURL("mailto:support@returndex.com?subject=Support mail from App&body=RETURNDEX")
                              ),
                              SpeedDialChild(
                                child: Icon(Icons.open_in_browser),
                                backgroundColor: Colors.blueAccent,
                                label: 'Open website',
                               
                                onTap: () => _openURL("http://returndex.com")
                              ),
                            ],
                          ),
                          
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
                                        fontSize: ScreenUtil(allowFontScaling: true).setSp(50),
                                        color:Colors.grey.shade700,
                                        fontFamily: "Bauhaus",
                                        fontWeight: FontWeight.bold,
                                      )
                                    ),
                                    SizedBox(width:ScreenUtil.getInstance().setWidth(200)),
                                    IconButton(
                  icon: Icon(Icons.notifications),
                  color: Colors.grey.shade500,
                  iconSize: 30.0,
                  onPressed: (){}, // icon pressed function
                                    ),
                                     SizedBox(width:ScreenUtil.getInstance().setWidth(16)),
                                    InkWell(
                                      onTap: (){
                                        
                                      },
                                      child: Container(
                                        height: ScreenUtil.getInstance().setHeight(100),
                                        width: ScreenUtil.getInstance().setWidth(100),
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
                                  height: ScreenUtil.getInstance().setHeight(200),
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
                                          //print("fsf");
                                        }, // press event
                                      ),
                  
                                      SizedBox(width: ScreenUtil.getInstance().setWidth(30),),
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
                  
                                        SizedBox(width: ScreenUtil.getInstance().setWidth(20),),
                                        
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
                    height: ScreenUtil.getInstance().setHeight(80),
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
                                SizedBox(height:ScreenUtil.getInstance().setHeight(10)),
                  
                               
                  
                               Padding(
                                padding:EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0) ,
                                child: Container(
                    height: ScreenUtil.getInstance().setHeight(80),
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
                    height: ScreenUtil.getInstance().setHeight(80),
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
                                  height:MediaQuery.of(context).size.height/3,
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
                    _openURL(String url) async{
                       print("open url clicked");
                       if(await canLaunch(url)){
                         launch(url);
                       }
                       else{
                            showSnackBar(_scafoldkey_welcome, "Some Error Occured !");
                  
                       }
                    }
                  
                    static _dosomething() {}
                
                  logoutUser_fromapp() {
                    logoutUser();
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/login');
                  }
}