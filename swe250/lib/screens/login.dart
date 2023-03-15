import 'package:flutter/material.dart';
import 'package:swe250/controller/login.dart';
import 'package:swe250/screens/home.dart';
import 'package:swe250/screens/signup.dart';



class login extends StatefulWidget {
  static int userid = -1;
  void setu(int x) {
    userid = x;
  }
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<login> {
  String email="",password="",loginmessage="";
  var mc = Colors.red;
  var logincontroller = loginController();

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
                  onChanged: (value){
                    email=value;
                  },
                  decoration: const InputDecoration(
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
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: ElevatedButton(
                onPressed: () async {
                  var res = await logincontroller.doLogin({"email":email,"password":password});
                  if(res['res'] == true){
                    login.userid = int.parse(res['userid']);
                    print(login.userid);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  home(),
                      ),
                    );
                  }
                  else {
                    setState(() {
                      loginmessage = "LOGIN FAILED!";
                    });
                  }

                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Text(
                  'LOGIN',
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
                      builder: (context) =>  signup(),
                    ),
                  );
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Don't have an Account? ", style: TextStyle(color: Colors.black87, fontSize: 18)),
                      Text("Signup!", style: TextStyle(color: Colors.black87, fontSize: 19, fontWeight: FontWeight.bold))
                    ]
                ),
              ),
            ),
            Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child : Text(loginmessage, style: TextStyle(color: mc, fontSize: 19, fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ),
    );
  }
}