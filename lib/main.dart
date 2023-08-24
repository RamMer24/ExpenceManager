import 'package:flutter/material.dart';

import 'screen/Balancepage.dart';
import 'screen/CreatePagePin.dart';

import 'screen/Enterpin.dart';
import 'screen/HomePage.dart';
import 'screen/Spleshscreen.dart';
import 'screen/Transaction.dart';
import 'package:intl/intl.dart';

import 'screen/UpdateTransaction.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Spleshscreen(),
    );
  }
}

