import 'package:flutter/material.dart';
import 'package:swe250/controller/profile.dart';
import 'package:swe250/controller/signup.dart';
import 'package:swe250/screens/home.dart';
import 'package:swe250/screens/login.dart';

import '../db/mysql.dart';

var signupmessage = "";
var mc = Colors.green;
String name="",mobile="",email="",address="",password="";

class profile extends StatefulWidget {
  @override
  _profileScreenState createState() => _profileScreenState();
}


class _profileScreenState extends State<profile> {
  profileController pc = profileController();
  List<jala> j = [];



  _getData() async {
    await pc.getUser(login.userid);
    for (final row in pc.user.rows) {
      name = row.colAt(1);
      mobile = row.colAt(2);
      address = row.colAt(3);
      email = row.colAt(4);
      j.add(jala());
    }
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Center(
            child: Container(
                transform: Matrix4.translationValues(100.0, 5.0, 0.0),
                child: Image.asset('images/logob.png',scale: 5,)),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: j.length,
                itemBuilder: (_, index) => j[index]
            ),
            Container(
              transform: Matrix4.translationValues(0.0, 20.0, 0.0),
              child: ElevatedButton(
                onPressed: () async {
                  var res = await pc.updateUser({"name":name,"mobile":mobile,"address":address,"email":email,"password":password, "userid":login.userid});
                  print(res);
                  if(res == true){
                    setState(() {
                      signupmessage = "UPDATE SUCCESS!";
                      mc = Colors.green;
                    });
                  }
                  else{
                    setState(() {
                      signupmessage = "UPDATE FAILED!";
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
                  'UPDATE',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Container(
                transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                child : Text(signupmessage, style: TextStyle(color: mc, fontSize: 19, fontWeight: FontWeight.bold))
            ),
          ],
        )
      ),
    );
  }
}

class jala extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
        child : Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          transform: Matrix4.translationValues(0.0, 10.0, 0.0),
          child: Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical:  7),
            child: TextFormField(
              initialValue: name,
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
          transform: Matrix4.translationValues(0.0, 10.0, 0.0),
          child:  Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical:  7),
            child: TextFormField(
              initialValue: mobile,
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
          transform: Matrix4.translationValues(0.0, 10.0, 0.0),
          child:  Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical:  7),
            child: TextFormField(
              initialValue: address,
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
          transform: Matrix4.translationValues(0.0, 10.0, 0.0),
          child:  Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical:  7),
            child: TextFormField(
              initialValue: email,
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
          transform: Matrix4.translationValues(0.0, 10.0, 0.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical:  7),
            child: TextField(
              onChanged: (value){
                password=value;
              },
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password',
                  hintText: 'Enter new secure password'),
            ),
          ),
        ),
        Container(
          transform: Matrix4.translationValues(0.0, 10.0, 0.0),
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
      ],
    ),
    );
  }
}