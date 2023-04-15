

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
    Future.delayed(const Duration(milliseconds: 2000), () {
      checklogin();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff12bfa2),
      appBar: AppBar(
        title: Center(child: Text("Spleshscreen",style: TextStyle(fontSize: 30,color: Colors.white),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
            ),
            Container(
              padding: EdgeInsets.only(left: 70, top: 100),
              child: Text(
                'WELCOM TO\nExpence Manager',
                style: TextStyle(color: Colors.black87, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
