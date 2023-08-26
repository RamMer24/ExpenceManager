import 'package:flutter/material.dart';


class MyScrollableStackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              'https://cdn.pixabay.com/photo/2023/07/19/19/14/monarch-butterfly-8137642_640.png',
              fit: BoxFit.cover,
              height: 1000.0,
              width: 500,// Adjust the height as needed
            ),
            Center(
              child: Container(
                height: 300,
                padding: EdgeInsets.all(40.0),
                margin: EdgeInsets.only(top: 200.0), // Adjust the top margin as needed
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      SizedBox(height: 20.0),
                      // Add more widgets as needed
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Center (
                    child: Text("Stack",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
