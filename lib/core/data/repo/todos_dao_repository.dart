import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_app/core/data/entity/todos_response.dart';

import '../entity/todos.dart';

class TodosDaoRepository {
  List<ToDos> parseToDos(String todos) {
    return TodosResponse.fromJson(json.decode(todos)).todos;
  }

  Future<void> saveTask(String name, String image) async {
    var url = "http://kasimadalan.pe.hu/toDos/insert.php";
    var data = {"name": name, "image": image};
    var response = await Dio().post(url, data: FormData.fromMap(data));
    print(response.data.toString());
  }

  Future<void> updateTask(int id, String name) async {
    var url = "http://kasimadalan.pe.hu/toDos/update.php";
    var data = {"id": id, "name": name};
    var response = await Dio().post(url, data: FormData.fromMap(data));
    print(response.data.toString());
  }

  Future<List<ToDos>> loadToDos() async {
    var url = "http://kasimadalan.pe.hu/toDos/getAllToDos.php";
    var response = await Dio().get(url);

    print(response.data.toString());
    var todos = parseToDos(response.data.toString());
    return todos;
  }

  Future<List<ToDos>> searchToDos(String searchText) async {
    var url = "http://kasimadalan.pe.hu/toDos/search.php";
    var data = {"name": searchText};
    var response = await Dio().post(url, data: FormData.fromMap(data));

    print(response.data.toString());
    var todos = parseToDos(response.data.toString());
    return todos;
  }

  Future<void> deleteTask(int id) async {
    var url = "http://kasimadalan.pe.hu/toDos/delete.php";
    var data = {"id": id};
    var response = await Dio().post(url, data: FormData.fromMap(data));
    print(response.data.toString());
  }
}
