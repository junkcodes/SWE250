import 'package:flutter/material.dart';
import 'package:swe250/controller/signup.dart';
import 'package:swe250/screens/home.dart';
import 'package:swe250/screens/login.dart';

import '../db/mysql.dart';

class signup extends StatefulWidget {
  @override
  _signupScreenState createState() => _signupScreenState();
}


class _signupScreenState extends State<signup> {
  signupController signupcontroller = signupController();
  String name="",mobile="",email="",address="",password="";
  var signupmessage = "";
  var mc = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Container(
                    width: 450,
                    height: 450,
                    child: Image.asset('images/logo.png')),

              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child: Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 25,vertical:  7),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter Full Name'),
                  onChanged: (value){
                     name = value;
                  },
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:  Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 25,vertical:  7),
                child: TextField(
                  onChanged: (value){
                    mobile = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile',
                      hintText: 'Enter Your Mobile Number +8801***'),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:  Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 25,vertical:  7),
                child: TextField(
                  onChanged: (value){
                    address=value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                      hintText: 'Enter Permanent Address'),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:  Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 25,vertical:  7),
                child: TextField(
                  onChanged: (value){
                    email=value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical:  7),
                child: TextField(
                  onChanged: (value){
                    password=value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical:  7),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm password'),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: ElevatedButton(
                onPressed: () async {
                  var res = await signupcontroller.doSignup({"name":name,"mobile":mobile,"address":address,"email":email,"password":password});
                 if(res == true){
                   setState(() {
                     signupmessage = "SIGNUP SUCCESS!";
                     mc = Colors.green;
                   });
                 }
                 else{
                   setState(() {
                     signupmessage = "SIGNUP FAILED!";
                     mc = Colors.red;
                   });
                 }


                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Text(
                  'SIGNUP',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  login(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Already have an Account? ", style: TextStyle(color: Colors.black87, fontSize: 18)),
                    Text("Login!", style: TextStyle(color: Colors.black87, fontSize: 19, fontWeight: FontWeight.bold))
                  ]
                ),
              ),
            ),
            Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child : Text(signupmessage, style: TextStyle(color: mc, fontSize: 19, fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ),
    );
  }
}