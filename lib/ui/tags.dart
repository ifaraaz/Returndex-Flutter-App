import 'dart:io';

import 'package:ReturnDex/bottombar/home_ui_bar.dart' as prefix0;
import 'package:ReturnDex/reuseable/slideanimation.dart';
import 'package:ReturnDex/ui/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ReturnDex/reuseable/networkUtility.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class MyTagsPage extends StatefulWidget {
  @override
  _MyTagsPageState createState() => _MyTagsPageState();
}

class _MyTagsPageState extends State<MyTagsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkpermission();
  }

  var _formKey_tag = GlobalKey<FormState>();
  var _scafoldkey_tag = GlobalKey<ScaffoldState>();
  TextEditingController tagController = TextEditingController();

  String result = "Hey there !";
  // final List<tagslist> _alltagslist = getActivatedTagList();

  ///for QR code scanning
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        //showSnackBar(_scafoldkey_tag, qrResult);
        checkAndAcivateTag(result.toString());
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
          showSnackBar(_scafoldkey_tag, result);
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
          showSnackBar(_scafoldkey_tag, result);
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
        showSnackBar(_scafoldkey_tag, result);
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
        showSnackBar(_scafoldkey_tag, result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
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
                    onPressed: () {
                      Navigator.pop(context);
                    }, // icon pressed function
                  ),
                  SizedBox(width: ScreenUtil.getInstance().setWidth(16)),
                  Text("ReturnDex",
                      style: TextStyle(
                        fontSize: ScreenUtil(allowFontScaling: true).setSp(50),
                        color: Colors.grey.shade700,
                        fontFamily: "Bauhaus",
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(width: ScreenUtil.getInstance().setWidth(120)),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    color: Colors.grey.shade500,
                    iconSize: 30.0,
                    onPressed: () {}, // icon pressed function
                  ),
                  SizedBox(width: ScreenUtil.getInstance().setWidth(16)),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, SlideLeftRoute(widget: ProfilePage())); 
                    },
                    child: Container(
                      height: ScreenUtil.getInstance().setHeight(100),
                      width: ScreenUtil.getInstance().setWidth(100),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage("images/usericon.png"),
                          )),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                height: ScreenUtil.getInstance().setWidth(370),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade200,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(1.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(16),
                    ),
                    Text(
                      "ENTER YOUR TAG ID ",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(6),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(460),
                      child: TextFormField(
                        controller: tagController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter Unique Tag-ID here";
                          } else if (value.isNotEmpty) {
                            var result =
                                value.length < 8 ? "Invalid Tag" : null;
                            return result;
                          }
                        },
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        maxLength: 10,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            fontFamily: 'Bauhaus'),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                          Icons.receipt,
                          color: Colors.blue,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(10),
                    ),
                    Container(
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.redAccent,
                            child: Text('ACTIVATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            elevation: 7.0,
                            onPressed: () {
                              if (_formKey_tag.currentState.validate()) {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                checkAndAcivateTag(tagController.text);
                              }
                            },
                          ),
                          SizedBox(
                            width: ScreenUtil.getInstance().setWidth(10),
                          ),
                          RaisedButton(
                            color: Colors.blueAccent,
                            elevation: 7.0,
                            child: Text('Scan QR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),

                            onPressed:
                                //() async {
                                // Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.camera]);
                                // print(permissions.toString());
                                _scanQR,
                            // }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.priority_high,
                    color: Colors.blue,
                  ),
                  Text("Recent Tags"),
                  SizedBox(
                    width: ScreenUtil.getInstance().setWidth(270),
                  ),
                  InkWell(
                    child: Text(
                      "View all",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.blue),
                    iconSize: 15.0,
                    onPressed: () {}, // icon pressed function
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 2.0),
              child: Container(
                height: ScreenUtil.getInstance().setHeight(450),
                child: Container(
                  child: FutureBuilder(
                    future: getActivatedTagList(context),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                              // child: Text("Loading"),
                              child: CircularProgressIndicator()),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Icon(
                                Icons.receipt,
                                color: Colors.blue,
                                size: 30.0,
                              ),
                              title: Text(snapshot.data[index].tagid,
                                  style: TextStyle(
                                    fontFamily: 'Bauhaus',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  )),
                              subtitle: Text(snapshot.data[index].isActive,
                                  style: TextStyle(
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

  void checkAndAcivateTag(String tagid) async {
    var responsebody = await activateUniqueTag(tagid);
    print(responsebody);
    if (responsebody == null) {
      showSnackBar(_scafoldkey_tag, "Try gain after Re-login");
      sleep(const Duration(seconds: 3));
      logoutUser();
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/login');
    }
    bool invalid = responsebody.isValid;
    bool isActive = responsebody.isActive;
    String tagno = responsebody.uniqueid;
    String textvalue = tagid;
    tagController.clear();

    if (invalid == true) {
      //tag is invalid not returndex tag
      showSnackBar(_scafoldkey_tag, "Invalid Tag Number ! - " + textvalue);
    } else if (isActive == true && invalid == false) {
      // already register
      showSnackBar(
          _scafoldkey_tag, "This Tag is already activated. -" + textvalue);
    } else if (isActive == false &&
        invalid == false &&
        tagno == tagController.text) {
      // tag regsitered successfully
      showSnackBar(
          _scafoldkey_tag, "Your Tag Activated Successfully -" + textvalue);
    } else {
      showSnackBar(_scafoldkey_tag, "Something Went Wrong ! Try Again");
    }
    print(responsebody);
  }

  Future checkpermission() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.camera]);
  }
}
