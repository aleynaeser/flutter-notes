import 'dart:math';
import '../entity/todos.dart';
import '../database/database_helper.dart';

class TodosDaoRepository {
  Future<void> saveTask(String name, String image) async {
    var db = await DatabaseHelper.databaseHelper();
    final id = Random().nextInt(10000);
    await db.insert('toDos', {'id': id, 'name': name, 'image': image});
  }

  Future<void> updateTask(int id, String name) async {
    var db = await DatabaseHelper.databaseHelper();
    await db.update('toDos', {'name': name}, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<ToDos>> loadToDos() async {
    var db = await DatabaseHelper.databaseHelper();
    List<Map<String, dynamic>> list = await db.rawQuery('SELECT * FROM toDos');

    return List.generate(list.length, (index) {
      var row = list[index];
      var id = int.parse(row['id'].toString());
      var name = row['name'];
      var image = row['image'];

      return ToDos(id: id, name: name, image: image);
    });
  }

  Future<List<ToDos>> searchToDos(String searchText) async {
    var db = await DatabaseHelper.databaseHelper();

    List<Map<String, dynamic>> list = await db.rawQuery(
      'SELECT * FROM toDos WHERE name LIKE ?',
      ['%$searchText%'],
    );

    return List.generate(list.length, (index) {
      var row = list[index];
      var id = int.parse(row['id'].toString());
      var name = row['name'];
      var image = row['image'];

      return ToDos(id: id, name: name, image: image);
    });
  }

  Future<void> deleteTask(int id) async {
    var db = await DatabaseHelper.databaseHelper();
    await db.delete('toDos', where: 'id = ?', whereArgs: [id]);
  }
}
