import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class maltoform extends StatefulWidget {
  const maltoform({super.key});

  @override
  State<maltoform> createState() => _maltoformState();
}

class _maltoformState extends State<maltoform> {

  int currentStep = 0; // Current step index

  // Define your form steps
  List<Step> steps = [
    Step(
        title: Text('Step 1'),
        content: Column(
          children: [
            TextFormField(
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
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
                hintText: "Confirm Password",
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        )),
    Step(
      title: Text('Step 2'),
      content: Card(
        elevation: 4.0, // Card elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Card border radius
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_circle,size: 30.sp,), // Icon or Image
              title: Text('Ram Amar',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.normal),),
              subtitle: Text('ram@gmail.com',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold)),
            ),
            Divider(), // Divider line
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This is the content of the card. You can put any widgets here.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      )
    ),

    Step(
        title: Text('Step 3'),
        content: Column(
          children:[
            Image.asset("img/demo.jpg",height: 150,width: 150,),
            Center(
              child: Row(
                children: [
                  Image.asset("img/demo.jpg",height: 150,width: 150,),
                  Image.asset("img/demo.jpg",height: 150,width: 150,),
                ],
              ),
            ),
            Image.asset("img/demo.jpg",height: 150,width: 150,),
          ],
        )
    ),
    Step(
        title: Text('Step 4'),
        content: SingleChildScrollView(
          child: Column(
            children:[
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
             Text("Welcome To the Our School",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
            ],
          ),
        )
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Step Form'),
      ),
      body: Stepper(
        steps: steps,
        currentStep: currentStep,
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
        onStepContinue: () {
          if (currentStep < steps.length - 1) {
            setState(() {
              currentStep += 1;
            });
          } else {}
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep -= 1;
            }
            );
          }
        },
      ),
    );
  }
}
