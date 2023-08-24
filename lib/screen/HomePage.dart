import 'package:expencemanager/Helpers/Databasehandler.dart';
import 'package:expencemanager/screen/Balancepage.dart';
import 'package:expencemanager/screen/Transaction.dart';
import 'package:expencemanager/screen/UpdateTransaction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List>? alltransaction;

  Future<List> getdata(trtype) async {
    Databasehandler obj = new Databasehandler();
    var alldata = await obj.viewtarnsaction(trtype);
    return alldata;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      alltransaction = getdata("all");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "HomePage",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.currency_rupee,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Balancepage()));
              // do something
            },
          )
        ],
        backgroundColor: Colors.blue.shade100,
        // Background color
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
      floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(
            Icons.add,
            size: 35,
          ),
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => transaction()));
          }),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        alltransaction = getdata("all");
                      });
                    },
                    child: Text("ALL")),
              ),
              Container(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        alltransaction = getdata("income");
                      });
                    },
                    child: Text("INCOME")),
              ),
              Container(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        alltransaction = getdata("expense");
                      });
                    },
                    child: Text("EXPENSE")),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: alltransaction,
                builder: (context, snapshots) {
                  if (snapshots.hasData) {
                    if (snapshots.data!.length == 0) {
                      return Container(
                        child: Center(
                          child: Text(
                            "No data found",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshots.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: (snapshots.data![index]["type"]
                                              .toString() ==
                                          "income")
                                      ? Colors.green.shade50
                                      : Colors.red.shade50),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshots.data![index]["title"]
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.black),
                                      ),
                                      Text(
                                        snapshots.data![index]["Amount"]
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshots.data![index]["ctaegory"]
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshots.data![index]["remark"]
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshots.data![index]["type"]
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        snapshots.data![index]["date"]
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          onPressed: () {
                                            AlertDialog alert = new AlertDialog(
                                              title: Text("Are you sure!"),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    var id = snapshots
                                                        .data![index]["tid"]
                                                        .toString();
                                                    Databasehandler obj =
                                                        new Databasehandler();
                                                    var status = await obj
                                                        .deletetarnsaction(id);
                                                    if (status == 1) {
                                                      setState(() {
                                                        alltransaction =
                                                            getdata("all");
                                                      });
                                                    } else {
                                                      print(
                                                          "Record not deleted ");
                                                    }
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("yes"),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("No"),
                                                ),
                                              ],
                                            );
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return alert;
                                                });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          onPressed: () {
                                            var id = snapshots.data![index]
                                                    ["tid"]
                                                .toString();

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateTransaction(
                                                          updateid: id,
                                                        )));
                                          },
                                          icon: Icon(
                                            Icons.update,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    return Column(
                      children: [CircularProgressIndicator()],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
