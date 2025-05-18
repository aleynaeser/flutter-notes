import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String databaseName = "todos.db";

  static Future<Database> databaseHelper() async {
    String databasePath = join(await getDatabasesPath(), databaseName);

    // Open the database
    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        print("Creating database tables...");
        await db.execute('''
          CREATE TABLE toDos (
            id TEXT PRIMARY KEY,
            name TEXT,
            image TEXT
          )
        ''');
        print("Database tables created successfully");
      },
      onOpen: (Database db) async {
        print("Database opened successfully");
      },
    );
  }
}
