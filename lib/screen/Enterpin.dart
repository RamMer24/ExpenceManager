

import 'package:expencemanager/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Enterpin extends StatefulWidget {


  @override
  State<Enterpin> createState() => _EnterpinState();
}

class _EnterpinState extends State<Enterpin> {

  TextEditingController _password = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Enter The Pin",style: TextStyle(fontSize: 22),)),
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
        /*  Container(
            padding: EdgeInsets.only(left: 35, top: 140),
            child: Text(
              'ENTER THE PIN',
              style: TextStyle(color: Colors.black, fontSize: 33),
            ),
          ),*/
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

                        SizedBox(
                          height: 50,
                        ),
                        TextField(
                          controller: _password,
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
                            hintText: "Pin",
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
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              var pin = prefs.getString("pin");
                              if (_password.text.toString()==pin) {


                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) =>HomePage ()));
                              }
                              else
                              {
                                Fluttertoast.showToast(msg: "Invalid pin!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.transparent,
                                    textColor: Colors.redAccent,
                                    fontSize: 30);
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
