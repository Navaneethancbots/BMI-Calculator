import 'package:bmi_calculator/Sql/Database.dart';
import 'package:sqflite/sqflite.dart';

class Repository{
  late DatabaseConnection _databaseConnection;
  Repository(){
    _databaseConnection = DatabaseConnection();
  }
  static Database?_database;
  Future<Database?>get database async {
    if (_database  != null) {
      return _database;
    }
    else{
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }
  insertData(table,data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }
  readData(table) async{
    var connection = await database;
    return await connection?.query(table);
  }
  readDataById(table,itemId) async {
    var connection = await database;
    return await connection?.query(table,where: 'id=?',whereArgs: [itemId]);
  }
  deleteDataById(table,itemId) async {
    var connection = await database;
    return await connection?.rawDelete('delete from $table where id=$itemId');
  }

  truncateTable(table) async {
    var connection = await database;
    return connection?.rawDelete('delete from $table');
  }


}