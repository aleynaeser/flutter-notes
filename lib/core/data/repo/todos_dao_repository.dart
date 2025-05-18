import '../database/database_helper.dart';
import '../entity/todos.dart';

class TodosDaoRepository {
  Future<void> saveTask(String name, String image) async {}

  Future<void> updateTask(String id, String name) async {
    print("updateTask: " + id + ' ' + name);
  }

  Future<List<ToDos>> loadToDos() async {
    var db = await DatabaseHelper.databaseHelper();
    List<Map<String, dynamic>> list = await db.rawQuery('SELECT * FROM toDos');

    return List.generate(list.length, (index) {
      var row = list[index];
      var id = row['id'];
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
      var id = row['id'];
      var name = row['name'];
      var image = row['image'];

      return ToDos(id: id, name: name, image: image);
    });
  }

  Future<void> deleteTask(String id) async {
    print("deleteTask: " + id);
  }
}
