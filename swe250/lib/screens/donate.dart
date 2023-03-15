import 'package:flutter/material.dart';
import 'package:swe250/controller/donation.dart';
import 'package:swe250/controller/signup.dart';
import 'package:swe250/screens/home.dart';
import 'package:swe250/screens/login.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/category.dart';
import '../db/mysql.dart';

String ccat = "FOOD";
class donate extends StatefulWidget {
  @override
  _donateScreenState createState() => _donateScreenState();
}


class _donateScreenState extends State<donate> {
  donationController donationcontroller = donationController();
  String name="",address="",condition="";
  var signupmessage = "";
  var mc = Colors.green;
  List<acat> bal = [];
  var cc = categoryController();

  _getData() async {
    await cc.listCategory();
    for (final row in cc.list.rows) {
      bal.add(acat(row.colAt(1)));
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Container(
                    width: 350,
                    height: 350,
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
                      labelText: 'Product Name',
                      hintText: 'Enter Product Name'),
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
                    condition = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Condition',
                      hintText: 'Enter Product Condition'),
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
                      hintText: 'Enter PickUp Address'),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:RadioListTile(
                title: Text("FOOD"),
                value: "FOOD",
                groupValue: ccat,
                onChanged: (value){
                  setState(() {
                    ccat = value.toString();
                  });
                },
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:RadioListTile(
                title: Text("ELECTRONICS"),
                value: "ELECTRONICS",
                groupValue: ccat,
                onChanged: (value){
                  setState(() {
                    ccat = value.toString();
                  });
                },
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:RadioListTile(
                title: Text("FURNITURE"),
                value: "FURNITURE",
                groupValue: ccat,
                onChanged: (value){
                  setState(() {
                    ccat = value.toString();
                  });
                },
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:RadioListTile(
                title: Text("TOOLS"),
                value: "TOOLS",
                groupValue: ccat,
                onChanged: (value){
                  setState(() {
                    ccat = value.toString();
                  });
                },
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:RadioListTile(
                title: Text("CLOTH"),
                value: "CLOTH",
                groupValue: ccat,
                onChanged: (value){
                  setState(() {
                    ccat = value.toString();
                  });
                },
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:RadioListTile(
                title: Text("BOOKS"),
                value: "BOOKS",
                groupValue: ccat,
                onChanged: (value){
                  setState(() {
                    ccat = value.toString();
                  });
                },
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:RadioListTile(
                title: Text("COSMETICS"),
                value: "COSMETICS",
                groupValue: ccat,
                onChanged: (value){
                  setState(() {
                    ccat = value.toString();
                  });
                },
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -80.0, 0.0),
              child:RadioListTile(
                title: Text("MEDICINE"),
                value: "MEDICINE",
                groupValue: ccat,
                onChanged: (value){
                  setState(() {
                    ccat = value.toString();
                  });
                },
              ),
            ),
            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: bal.length,
            //     itemBuilder: (_, index) => bal[index]
            // ),

            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: ElevatedButton(
                onPressed: () async {

                    // String query = Uri.encodeComponent("Zero point khulna");
                    // String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
                    // if (await canLaunch(googleUrl)) {
                    //   await launch(googleUrl);
                    // }
                   var res = await donationcontroller.addDonation({"name":name,"condition":condition,"address":address,"ccat":ccat,"userid":login.userid});
                  if(res == true){
                    setState(() {
                      signupmessage = "DONATION SUCCESS!";
                      mc = Colors.green;
                    });
                  }
                  else{
                    setState(() {
                      signupmessage = "DONATION FAILED!";
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
                  'DONATE!',
                  style: TextStyle(color: Colors.white, fontSize: 25),
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


class acat extends StatefulWidget {
  String val;
  acat(this.val);
  @override
  _acatScreenState createState() => _acatScreenState();
}


class _acatScreenState extends State<acat> {

  @override
  Widget build(BuildContext context){
    return Container(
      transform: Matrix4.translationValues(0.0, -80.0, 0.0),
      child:RadioListTile(
        title: Text(widget.val),
        value: widget.val,
        groupValue: "MEDICINE",
        onChanged: (value){
          print("aaa");
          setState(() {
            ccat = value.toString();
          });
        },
      ),
    );
  }
}
