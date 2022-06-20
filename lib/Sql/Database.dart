import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection{
  Future<Database> setDatabase() async
  {
    var directory = await getApplicationDocumentsDirectory();
    print("application ${directory}");
    var path = join(directory.path,'db_crud');
    var database = await openDatabase(path,version: 4,onCreate: _createDatabase);
    return database;
  }
  Future<void>_createDatabase(Database database,int version)async{
    print("Database creation");
    String sql = "CREATE TABLE users(id INTEGER PRIMARY KEY,Name TEXT,Gender TEXT,Height TEXT,Weight TEXT,Age TEXT,Result TEXT,Value TEXT,Interpretation TEXT, Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP)";
    await database.execute(sql);
  }
}