import 'package:mysql_client/mysql_client.dart';
import 'package:swe250/controller/signup.dart';
import 'package:swe250/db/mysql.dart';

class profileModel {
  Map<String, dynamic> formUserData = {};
  var result;

  Future<void> getuser(int userid) async{
    await Mysql.getConnection() ;
    await Mysql.conn.connect();
    try {
      var query = 'select * from users where userid = "$userid"';
      result = await Mysql.conn.execute(query);
    }catch(e){
      result = null;
    }
    await Mysql.conn.close();
  }
  Future<void> updateuser() async{
    await Mysql.getConnection() ;
    await Mysql.conn.connect();
    try {
      var query = 'update users set name = "${formUserData['name']}", email="${formUserData['email']}", mobile = "${formUserData['mobile']}", address ="${formUserData['address']}", password="${formUserData['password']}" where userid = ${formUserData['userid']} ';
      result = await Mysql.conn.execute(query);
    }catch(e){
      result = null;
    }
    await Mysql.conn.close();
  }
}