import 'package:mysql_client/mysql_client.dart';
import 'package:swe250/controller/signup.dart';
import 'package:swe250/db/mysql.dart';

class signupModel {
  Map<String, String> formUserData = {};
  var result;

  Future<void> signupuser() async{
    await Mysql.getConnection() ;
    await Mysql.conn.connect();
    try {
       result = await Mysql.conn.execute(
          'insert into users (name,email,mobile,address,password) values ("${formUserData['name']}","${formUserData['email']}", "${formUserData['mobile']}", "${formUserData['address']}", "${formUserData['password']}")');
    }catch(e){
      result = null;
     }
     await Mysql.conn.close();
  }
}