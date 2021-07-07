import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host =
          'elearninginstance.cbnpixf92vdg.us-east-1.rds.amazonaws.com',
      user = 'root',
      password = 'parth4380',
      db = 'NPTEL';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
