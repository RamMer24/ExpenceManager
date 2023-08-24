

import 'package:expencemanager/Helpers/Databasehandler.dart';
import 'package:expencemanager/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class transaction extends StatefulWidget {


  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {



  TextEditingController _title = TextEditingController();
  TextEditingController _remark = TextEditingController();
  TextEditingController _Amount = TextEditingController();
  TextEditingController _dateinput=TextEditingController();
  var grp="";
  var selected="food";

  _handalRadio(val)
  {
    setState(() {
      grp = val!;
    });
  }

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(child: Text('Add Traslation',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),

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
    ),),
      body: SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Padding(
        padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    fillColor: MaterialStateColor.resolveWith((states) => Colors. teal.shade500),
                    focusColor: MaterialStateColor.resolveWith((states) => Colors.teal.shade500),
                    value: "Income",
                    groupValue: grp,
                    onChanged: _handalRadio,
                  ),

                  Text("Income"),
                  Radio(
                    fillColor: MaterialStateColor.resolveWith((states) => Colors. teal.shade500),
                    focusColor: MaterialStateColor.resolveWith((states) => Colors.teal.shade500),
                    value: "Expense",
                    groupValue: grp,
                    onChanged: _handalRadio,

                  ),
                  Text("Expense"),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Container(
                  height: 60,
                  width: 370,
                  child: DropdownButtonFormField(
                    borderRadius: BorderRadius.circular(30),
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
                      hintText: "Select your Gender",
                    ),
                    value: selected,
                    onChanged: (val) {
                      setState(() {
                        selected = val!;
                      });
                    },
                      items: [
                        DropdownMenuItem(
                          child: Text("food"),
                          value: "food",
                        ),
                        DropdownMenuItem(
                          child: Text("office"),
                          value: "office",
                        ),
                        DropdownMenuItem(
                          child: Text("house"),
                          value: "house",
                        ),
                        DropdownMenuItem(
                            child: Text("investment"),
                            value: "investment"
                        ),
                        DropdownMenuItem(
                            child: Text("other"),
                            value: "other"
                        ),
                      ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10,top: 20),
                child: TextFormField(
                  controller: _title,
                  validator: (val)
                  {
                    if (val!.length<=0)
                    {
                      return "Please Enter Title";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
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
                    hintText: "Title",
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10,top: 20),
                child: TextFormField(
                  controller: _remark,
                  validator: (val)
                  {
                    if (val!.length<=0)
                    {
                      return "Please Enter Remark";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
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
                    hintText: "Remark",
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10,top: 20),
                child: TextFormField(
                  controller: _Amount,
                  validator: (val)
                  {
                    if (val!.length<=0)
                    {
                      return "Please Enter Amount";
                    }
                    return null;
                  },
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
                    hintText: "Amount",
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10,top: 20),
                child: TextFormField(
                  controller: _dateinput,
                  validator: (val)
                  {
                    if (val!.length<=0)
                    {
                      return "Please Enter Date";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
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
                    hintText: "date",
                  ),
                  onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {

                      _dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30,),
                      ),
                    ),
                    onPressed: () async{

                      if(formkey.currentState!.validate()){
                        var title =_title.text.toString();
                        var remark =_remark.text.toString();
                        var date =_dateinput.text.toString();
                        var Amount = _Amount.text.toString();
                        var type= grp;
                        var ctaegory = selected;

                        Databasehandler obj = new Databasehandler();
                        var status = await obj.inserttarnsaction(title,remark,date,Amount,type,ctaegory);
                        print("Record Inserted at : "+ status.toString());
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                      }
                    },

                    child: Text("Add",style: TextStyle(fontSize: 30.0,),),),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
