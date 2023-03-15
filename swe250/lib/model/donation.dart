import 'package:mysql_client/mysql_client.dart';
import 'package:swe250/controller/signup.dart';
import 'package:swe250/db/mysql.dart';

class donationModel {
  Map<String, dynamic> formUserData = {};
  var result;

  Future<void> adddonation() async{
    await Mysql.getConnection() ;
    await Mysql.conn.connect();
    try {
      var query = 'insert into product (pname, paddress,pcon,pc,userid) values ("${formUserData['name']}","${formUserData['address']}","${formUserData['condition']}","${formUserData['ccat']}","${formUserData['userid']}")';
      result = await Mysql.conn.execute(query);
    }catch(e){
      result = null;
    }
    await Mysql.conn.close();
  }
  Future<void> listdonation(String cat) async{
    await Mysql.getConnection() ;
    await Mysql.conn.connect();
    try {
      var query = 'select * from product where pc = "$cat"';
      result = await Mysql.conn.execute(query);
    }catch(e){
      result = null;
    }
    await Mysql.conn.close();
  }
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
  Future<void> searchdonation(String search) async{
    await Mysql.getConnection() ;
    await Mysql.conn.connect();
    try {
      var query = 'select * from product where pname like "%$search%"';
      result = await Mysql.conn.execute(query);
    }catch(e){
      result = null;
    }
    await Mysql.conn.close();
  }
}