import 'package:flutter/material.dart';
import 'package:swe250/controller/donation.dart';
import 'package:swe250/controller/signup.dart';
import 'package:swe250/screens/home.dart';
import 'package:swe250/screens/login.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/category.dart';
import '../db/mysql.dart';

class search extends StatefulWidget {
  var ccn;
  search(var cname){
    ccn = cname;
  }
  @override
  _searchScreenState createState() => _searchScreenState();
}


class _searchScreenState extends State<search> {
  donationController dc = donationController();
  List<dd> DD = [];
  _getData() async {
    await dc.searchDonation(widget.ccn);
    for (final row in dc.searchr.rows) {
      await dc.getUser(int.parse(row.colAt(5)));
      for (final jow in dc.user.rows) {
        DD.add(dd(row.colAt(1), jow.colAt(1),jow.colAt(2),row.colAt(2),row.colAt(4),row.colAt(3)));
      }
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
            ListView.builder(
                shrinkWrap: true,
                itemCount: DD.length,
                itemBuilder: (_, index) => DD[index]
            ),

          ],
        ),
      ),
    );
  }
}

class dd extends StatelessWidget{
  var pname, uname, mobile, address, condition, cat;
  dd(this.pname,this.uname,this.mobile,this.address,this.condition,this.cat);
  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        transform: Matrix4.translationValues(0, 20, 0.0),
        height: 260,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.indigoAccent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              transform: Matrix4.translationValues(50, 15, 0.0),
              child: Text(pname, style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
            const Divider(
              color: Colors.white10,
              height: 50,
              thickness: 2,
              indent: 50,
              endIndent: 50,
            ),
            Container(
              transform: Matrix4.translationValues(20, 0, 0.0),
              child: Text("Posted By : $uname", style: TextStyle(color: Colors.white, fontSize: 17)),
            ),
            Container(
              transform: Matrix4.translationValues(20, 0, 0.0),
              child: Text("Category : $cat", style: TextStyle(color: Colors.white, fontSize: 17)),
            ),
            Container(
              transform: Matrix4.translationValues(20, 0, 0.0),
              child: Text("Condition : $condition", style: TextStyle(color: Colors.white, fontSize: 17)),
            ),

            Container(
              transform: Matrix4.translationValues(20, 0, 0.0),
              child: Text("Mobile : $mobile", style: TextStyle(color: Colors.white, fontSize: 17)),
            ),
            Container(
              transform: Matrix4.translationValues(20, 0, 0.0),
              child: Text("Address : $address", style: TextStyle(color: Colors.white, fontSize: 17)),
            ),
            const Divider(
              color: Colors.white10,
              height: 30,
              thickness: 2,
              indent: 50,
              endIndent: 50,
            ),
            Container(
              transform: Matrix4.translationValues(20, -10, 0.0),
              child: Row(
                  children:  [
                    Text("Direction: ", style: TextStyle(color: Colors.white, fontSize: 17)),
                    ElevatedButton(
                      onPressed: () async {
                        String query = Uri.encodeComponent(address);
                        String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
                        if (await canLaunch(googleUrl)) {
                          await launch(googleUrl);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          fixedSize: const Size(120, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text(
                        'GoogleMap',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}




