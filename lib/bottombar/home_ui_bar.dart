import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBar extends StatefulWidget {
  @override
  _HomeBarState createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        
        children: <Widget>[
           
          
          //SizedBox(height: 10.0,),

          Container(
            decoration: BoxDecoration(),
            child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 5.0),
              height: 150.0,
             
             decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                   bottomLeft:  const  Radius.circular(20.0),
                    bottomRight: const  Radius.circular(20.0),
                  ),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(1.0, 4.0),
                  blurRadius: 10.0,
                )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {},
                        child: new Icon(
                          Icons.receipt,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.red[800],
                        
                        padding: const EdgeInsets.all(20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text("ACTIVATE TAG"),
                      )
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {},
                              child: new Icon(
                                Icons.label_outline,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 2.0,
                               fillColor: Colors.red[800],
                              padding: const EdgeInsets.all(20.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(
                              child: Text("REPORT LOST"),
                            )
                          ],
                        ),
                      ]),
                  Column(
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {},
                        child: new Icon(
                          Icons.leak_add,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                         fillColor: Colors.red[800],
                        padding: const EdgeInsets.all(20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text("REPORT FOUND"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 30.0,),




//list of images carosel 

Container(
  height: 120.0,
  child: CarouselSlider(
     viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
        (url){
          return Container(
            margin: EdgeInsets.all(5.0),
            child: Stack(
                          children: <Widget>[
                            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),

              Center(child: Text("250 +",style:TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,

               ) )),
                          ],
            ),
            

          );
        }
      ).toList(),
  ),

),

SizedBox(height:20.0),



// listview horizontal 

          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Recently Found",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
               
                Container(
                  child: Text(
                    "View all",style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  

                ),

                
              ],

            ),


            
          ),
        Container(
                  height: 150.0,
                 // width: 300.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                        Container(
                width: 160.0,
                height: 150.0,
                child: Column(
                  children: <Widget>[
                     SizedBox(width: 5.0,),
                    Container(
                     
                      height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://www.howtogeek.com/wp-content/uploads/2016/01/steam-and-xbox-controllers.jpg'),
                                    fit: BoxFit.cover)),
                    ),
                    Text(
                            "Play Station",
                            style: new TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
              ),
              SizedBox(width: 5.0,),
              Container(
                width: 160.0,
                height: 150.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://www.howtogeek.com/wp-content/uploads/2016/01/steam-and-xbox-controllers.jpg'),
                                    fit: BoxFit.cover)),
                    ),
                    Text(
                            "Play Station",
                            style: new TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
              ),
             SizedBox(width: 5.0,),
              Container(
                width: 160.0,
                height: 150.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://www.howtogeek.com/wp-content/uploads/2016/01/steam-and-xbox-controllers.jpg'),
                                    fit: BoxFit.cover)),
                    ),
                    Text(
                            "Play Station",
                            style: new TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
              ),
              SizedBox(width: 5.0,),
              Container(
                width: 160.0,
                height: 150.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://www.howtogeek.com/wp-content/uploads/2016/01/steam-and-xbox-controllers.jpg'),
                                    fit: BoxFit.cover)),
                    ),
                    Text(
                            "Play Station",
                            style: new TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),

                    ],

                  ),
                ),


// after this all code related to carosel slider 











        ],
      ),
    );
  }
}




final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}