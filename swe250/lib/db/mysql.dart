import 'package:mysql_client/mysql_client.dart';

class Mysql {
  static var conn;

  static Future<void> getConnection() async {
      conn = await MySQLConnection.createConnection(
      host: "10.0.2.2",
      port: 3306,
      userName: "root",
      password: "1234",
      databaseName: "swe250", // optional
    );
  }
}