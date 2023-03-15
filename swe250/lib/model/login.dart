import 'package:mysql_client/mysql_client.dart';
import 'package:swe250/controller/signup.dart';
import 'package:swe250/db/mysql.dart';

class loginModel {
  Map<String, String> formUserData = {};
  var result;

  Future<void> loginuser() async{
    await Mysql.getConnection() ;
    await Mysql.conn.connect();
    try {
      var query = 'select * from users where email = "${formUserData['email']}" and password = "${formUserData['password']}"';
      result = await Mysql.conn.execute(query);
    }catch(e){
      result = null;
    }
    await Mysql.conn.close();
  }
}