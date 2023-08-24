

import 'package:expencemanager/screen/CreatePagePin.dart';
import 'package:expencemanager/screen/Enterpin.dart';
import 'package:expencemanager/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Spleshscreen extends StatefulWidget {


  @override
  State<Spleshscreen> createState() => _SpleshscreenState();
}

class _SpleshscreenState extends State<Spleshscreen> {


  checklogin() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Enterpin()));
    }
    else
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CreatePagePin()));
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      checklogin();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Spleshscreen",style: TextStyle(fontSize: 25,color: Colors.white),)),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            Center(
              child: Container(
                height: 200,
                width: 300,
                child: Image.asset("img/demo.jpg"),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
