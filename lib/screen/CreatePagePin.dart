

import 'package:expencemanager/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePagePin extends StatefulWidget {


  @override
  State<CreatePagePin> createState() => _CreatePagePinState();
}

class _CreatePagePinState extends State<CreatePagePin> {

  TextEditingController _pin = TextEditingController();
  TextEditingController _CONFROMPIN = TextEditingController();

  var pin="";
  var CONFROMPIN="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Center(child: Text("CreatePagePin",style: TextStyle(fontSize: 30),)),
      ),
      body: Stack(
        children: [
          Container(),
          Container(
            padding: EdgeInsets.only(left: 35, top: 100),
            child: Text(
              'CREATE\nPIN',
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        TextField(
                          controller: _pin,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "PIN",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: _CONFROMPIN,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "CONFROM PIN",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 40,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 50.0,
                              width: 150.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFE7551),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10,),
                                  ),
                                ),
                                onPressed: () async{

                                  if (_pin.text.toString()==_CONFROMPIN.text.toString() ) {

                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString("islogin", "yes");
                                    prefs.setString("pin", _pin.text.toString());


                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => HomePage()));
                                  }
                                  else
                                  {
                                    Fluttertoast.showToast(msg: "Both must be same",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.black87,
                                        fontSize: 15);
                                  }
                                },

                                child: Text("Login",style: TextStyle(fontSize: 30.0,),),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
