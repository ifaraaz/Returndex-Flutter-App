import 'package:flutter/material.dart';
import 'package:returndex/model/taglist.dart';

class MyTagsPage extends StatefulWidget {

 



  @override
  _MyTagsPageState createState() => _MyTagsPageState();
}

class _MyTagsPageState extends State<MyTagsPage> {
 final List<tagslist> _alltagslist = tagslist.allTags();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              
               IconButton(
icon: Icon(Icons.arrow_back),
color: Colors.grey.shade500,
iconSize: 30.0,
onPressed: (){

   Navigator.pop(context);
}, // icon pressed function
                ),
                  SizedBox(width:8.0),
                Text(
                  "ReturnDex",
                  style:TextStyle(
                    fontSize: 25.0,
                    color:Colors.grey.shade700,
                    fontFamily: "Bauhaus",
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(width:45.0),
                IconButton(
icon: Icon(Icons.notifications),
color: Colors.grey.shade500,
iconSize: 30.0,
onPressed: (){
 

}, // icon pressed function
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
  padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
  child: Container(
    padding: EdgeInsets.only(left:10.0),
              height: 170.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.shade200,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(1.0, 4.0),
                  blurRadius: 10.0,
                )
                ]
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 8.0,),
                Text("ENTER YOUR TAG ID ",style: TextStyle(
fontSize: 18.0,
color: Colors.grey.shade700,
fontWeight: FontWeight.bold,
                ),
                ),

                SizedBox(height: 3.0,),
                Container(
                  width: 230.0,
                   child: TextField(
                  
                  textCapitalization: TextCapitalization.characters,
                  textInputAction: TextInputAction.next,
                  maxLength: 10,
                  
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 28.0,fontFamily: 'Bauhaus'),
                decoration: InputDecoration(
               prefixIcon: Icon(Icons.receipt,color: Colors.blue,)
                ),
                ),
                ),

                

 SizedBox(height: 5.0,),

 RaisedButton(
   color:Colors.redAccent,
 child: Text(
          'ACTIVATE',
          style:TextStyle(
            color:Colors.white,
            fontWeight:FontWeight.bold,
          )
        ),
      elevation: 7.0,
   onPressed: (){},
 )

              ],
            ),
  ),
),

Padding(
  padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
  child: Row(
    children: <Widget>[
      Icon(Icons.priority_high,color: Colors.blue,),
      Text("Recent Tags"),
      SizedBox(width: 130.0,),
InkWell(
  child: Text("View all",style: TextStyle(color:Colors.blue),),
  onTap: (){},
  
),

IconButton(
  icon: Icon(Icons.arrow_forward_ios,color:Colors.blue),
  iconSize: 15.0,
  onPressed: (
    
  ){
 
  }, // icon pressed function

)
     
    ],
  ),
),


Padding(
  padding:EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 2.0) ,
  
 child: Container(
        height: 250.0,
child: getalltagslist(context),
      ),
  
   
),




        ],
      ),
    );
  }


// making this widget to get listview 
  getalltagslist(BuildContext context) {
    return ListView.builder(
    itemCount: _alltagslist.length,
    itemBuilder: _getItemUI,
    padding: EdgeInsets.all(0.0),
   
  );

  }

  Widget _getItemUI(BuildContext context, int index) {
    return new 
    Card(
      color: Colors.grey.shade50,
     
      child: new Column(
        
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.receipt,color:Colors.blue,size: 30.0,),
            title: Text(_alltagslist[index].tagID,
            style:TextStyle(
              fontFamily: 'Bauhaus',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            )),
            subtitle: Text(_alltagslist[index].tagStatus,
            style:TextStyle(
              color: Colors.green,
            )),
          )
        ],
      ),
              //title: Text(_alltagslist[index].tagID),
            );
    
  }
}