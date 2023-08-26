import 'package:expencemanager/screen/ImageDwonload.dart';
import 'package:expencemanager/screen/SCROLL.dart';
import 'package:expencemanager/screen/Stack.dart';
import 'package:expencemanager/screen/VideoSave.dart';
import 'package:expencemanager/screen/maltoform.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.black.withOpacity(0.4),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:maltoform(),

      );
    }
    );
  }
}


