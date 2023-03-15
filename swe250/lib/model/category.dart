import 'package:mysql_client/mysql_client.dart';
import 'package:swe250/controller/signup.dart';
import 'package:swe250/db/mysql.dart';

class categoryModel {
  Map<String, String> formUserData = {};
  var result;

  Future<void> listcategory() async{
    await Mysql.getConnection() ;
    await Mysql.conn.connect();
    try {
      var query = 'select * from cat';
      result = await Mysql.conn.execute(query);
    }catch(e){
      result = null;
    }
    await Mysql.conn.close();
  }
}