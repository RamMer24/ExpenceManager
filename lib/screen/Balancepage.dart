

import 'package:flutter/material.dart';

import '../Helpers/Databasehandler.dart';

class Balancepage extends StatefulWidget {


  @override
  State<Balancepage> createState() => _BalancepageState();
}

class _BalancepageState extends State<Balancepage> {


  var income=0.0;
  var expense = 0.0;
  var balance=0.0;


 getdata() async {
    Databasehandler obj = new Databasehandler();
    var alldata = await obj.viewtarnsaction("all");
    alldata.forEach((row) {
      if(row["type"]=="income")
        {
          setState(() {
            income=income + double.parse(row["Amount"].toString());
          });
        }
      else
        {
          setState(() {
            expense=expense + double.parse(row["Amount"].toString());
          });
        }
    });
    setState(() {
      balance=income - expense;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Balance page",style: TextStyle(fontSize: 30),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Text("Rs "+balance.toString(),style: TextStyle(fontSize: 30),),
                      Text("Balance")
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Rs. "+income.toString(),style: TextStyle(fontSize: 20),),
                        Text("Income")
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Rs. "+expense.toString(),style: TextStyle(fontSize: 20),),
                        Text("Expence")
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
