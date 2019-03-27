import 'package:flutter/material.dart';
import 'package:ReturnDex/model/taglist.dart';
import 'package:ReturnDex/reuseable/networkUtility.dart';

class MyTagsPage extends StatefulWidget {

 



  @override
  _MyTagsPageState createState() => _MyTagsPageState();
}

class _MyTagsPageState extends State<MyTagsPage> {
   var _formKey_tag =GlobalKey<FormState>();
   var _scafoldkey_tag =GlobalKey<ScaffoldState>();
   TextEditingController tagController =TextEditingController();


// final List<tagslist> _alltagslist = getActivatedTagList();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scafoldkey_tag,
      body: Form(
        key: _formKey_tag,
              child: ListView(
          
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
                  SizedBox(width:65.0),
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
                     child: TextFormField(
                       controller: tagController,
                       validator: (String value){
                              if (value.isEmpty) {
                                return "Please enter Unique Tag-ID here";
                              }
                              else if(value.isNotEmpty){
                                 var result = value.length < 8 ? "Invalid Tag" : null;
                                 return result;

                              }
                         },
                    
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
   onPressed: (){
     if (_formKey_tag.currentState.validate()) {
        FocusScope.of(context).requestFocus(new FocusNode());
       checkAndAcivateTag();
            }
          },
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
               SizedBox(width: 150.0,),
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
       child: Container(
          child: FutureBuilder(
            future: getActivatedTagList(),
            builder: (context,snapshot){


              if (snapshot.data ==null) {
                return Container(
                  child: Center(
                   // child: Text("Loading"),
                   child: CircularProgressIndicator()
                  ),
                );
              }
              else{
                 return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context , int index){
                  return ListTile(
                   leading: Icon(Icons.receipt,color:Colors.blue,size: 30.0,),
                   title: Text(snapshot.data[index].tagid,
                   style:TextStyle(
                     fontFamily: 'Bauhaus',
                     fontWeight: FontWeight.bold,
                     fontSize: 18.0,
                   )),
                   subtitle: Text(snapshot.data[index].isActive,
                   style:TextStyle(
                     color: Colors.green,
                   )),
                 );
                },

              );
              }
             
            },
          ),
        ), //Listview Widget calling 
               ),
         
          
       ),
       
       
       
       
                 ],
               ),
             ),
           );
         }
       
       



     
       
         void checkAndAcivateTag() async{
           var responsebody = await activateUniqueTag(tagController.text);
           bool invalid =responsebody.isValid;
           bool isActive =responsebody.isActive;
           String tagno =responsebody.uniqueid;
           String textvalue =tagController.text;
           tagController.clear();

           if (invalid ==true) 
           {
             //tag is invalid not returndex tag
             	showSnackBar(_scafoldkey_tag, "Invalid Tag Number ! - "+textvalue);
             
           }
           else if (isActive == true && invalid ==false) {
             // already register
             	showSnackBar(_scafoldkey_tag, "This Tag is already activated. -"+textvalue);
           }
           else if(isActive==false && invalid ==false && tagno ==tagController.text){
             // tag regsitered successfully 
             	showSnackBar(_scafoldkey_tag, "Your Tag Activated Successfully -"+textvalue);

           }
           else 
           {
             	showSnackBar(_scafoldkey_tag, "Something Went Wrong ! Try Again");
           }
           print(responsebody);
           
         }
}