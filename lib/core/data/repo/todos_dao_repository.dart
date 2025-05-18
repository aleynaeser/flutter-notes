import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_app/core/data/entity/todos_response.dart';

import '../entity/todos.dart';

class TodosDaoRepository {
  List<ToDos> parseToDos(String todos) {
    return TodosResponse.fromJson(json.decode(todos)).todos;
  }

  Future<void> saveTask(String name, String image) async {}

  Future<void> updateTask(String id, String name) async {
    print("updateTask: " + id + ' ' + name);
  }

  Future<List<ToDos>> loadToDos() async {
    var url = "http://kasimadalan.pe.hu/toDos/getAllToDos.php";
    var response = await Dio().get(url);

    print(response.data.toString());
    var todos = parseToDos(response.data.toString());
    return todos;
  }

  Future<List<ToDos>> searchToDos(String searchText) async {
    return [
      ToDos(id: 1, name: 'ToDo 1', image: 'simsek.png'),
      ToDos(id: 2, name: 'ToDo 2', image: 'agac.png'),
      ToDos(id: 3, name: 'ToDo 3', image: 'araba.png'),
    ];
  }

  Future<void> deleteTask(String id) async {
    print("deleteTask: " + id);
  }
}
