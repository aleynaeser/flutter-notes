import '../entity/todos.dart';

class TodosDaoRepository {
  Future<void> saveTask(String name, String image) async {}

  Future<void> updateTask(String id, String name) async {
    print("updateTask: " + id + ' ' + name);
  }

  Future<List<ToDos>> loadToDos() async {
    return [
      ToDos(id: '1', name: 'ToDo 1', image: 'simsek.png'),
      ToDos(id: '2', name: 'ToDo 2', image: 'agac.png'),
      ToDos(id: '3', name: 'ToDo 3', image: 'araba.png'),
      ToDos(id: '4', name: 'ToDo 4', image: 'gunes.png'),
    ];
  }

  Future<List<ToDos>> searchToDos(String searchText) async {
    return [
      ToDos(id: '1', name: 'ToDo 1', image: 'simsek.png'),
      ToDos(id: '2', name: 'ToDo 2', image: 'agac.png'),
      ToDos(id: '3', name: 'ToDo 3', image: 'araba.png'),
    ];
  }

  Future<void> deleteTask(String id) async {
    print("deleteTask: " + id);
  }
}
