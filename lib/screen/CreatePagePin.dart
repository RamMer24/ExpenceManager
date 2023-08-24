

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Creat Pin",style: TextStyle(fontSize: 27),)),
        backgroundColor: Colors.blue.shade100, // Background color
        elevation: 4.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30), // Rounded corners at the bottom
            )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Colors.teal, Colors.teal.shade100],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(),
          Container(
            padding: EdgeInsets.only(left: 35, top: 100),
            child: Text(
              'CREATE\nPIN',
              style: TextStyle(color: Colors.black, fontSize: 33),
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
                          style: TextStyle(color: Colors.black),
                          decoration:InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.black)),
                            // filled: true,
                            hintStyle: TextStyle(
                              // color: Colors.grey[800]
                            ),
                            hintText: "Enter The Pin",
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: _CONFROMPIN,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.black)),
                            // filled: true,
                            hintStyle: TextStyle(
                              // color: Colors.grey[800]
                            ),
                            hintText: "Enter The confirmpin",
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20,),
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
