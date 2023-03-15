import 'package:flutter/material.dart';
import 'package:swe250/controller/category.dart';
import 'package:swe250/screens/donate.dart';
import 'package:swe250/screens/profile.dart';
import 'package:swe250/screens/search.dart';
import 'package:swe250/screens/welcome.dart';

import 'donationdetails.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<cats> catlist = [];
  var cc = categoryController();
  var item = "";

  _getData() async {
    await cc.listCategory();
    for (final row in cc.list.rows) {
      catlist.add(new cats(row.colAt(1)));
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  home(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                           // fixedSize: const Size(250, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'DONATION',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  profile(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            // fixedSize: const Size(250, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'PROFILE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  welcome(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            // fixedSize: const Size(250, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'LOGOUT',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],

                  ),
                ),
                const Divider(
                  color: Colors.indigoAccent,
                  height: 25,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical:  7),
                    child: TextField(
                      onChanged: (value){
                        item = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search',
                          hintText: 'Enter Item Name'),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  search(item),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            // fixedSize: const Size(250, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'SEARCH',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  donate(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            // fixedSize: const Size(250, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'DONATE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],

                  ),
                ),
                const Divider(
                  color: Colors.indigoAccent,
                  height: 25,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
                const Text(
                  'CATEGORIES',
                  style: TextStyle(color: Colors.indigo, fontSize: 20),
                ),
                Container(height: 20,),
                Container(
                  width: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: catlist.length,
                      itemBuilder: (_, index) => catlist[index]
                  ),
                )
              ],
            ),
          ),
      );
  }
}

class cats extends StatelessWidget{
  var name;
  cats(this.name);
  @override
  Widget build(BuildContext context){
    return Container(
        margin: const EdgeInsets.only(top: 7.0, bottom: 8),
          child : ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  donationdetails(name),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigoAccent,
              fixedSize: const Size(250, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            this.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
    );
  }
}


