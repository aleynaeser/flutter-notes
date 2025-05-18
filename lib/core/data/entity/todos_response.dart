import 'package:todo_app/core/data/entity/todos.dart';

class TodosResponse {
  final List<ToDos> todos;
  final int success;

  TodosResponse({required this.todos, required this.success});

  factory TodosResponse.fromJson(Map<String, dynamic> json) {
    var list = json['toDos'] as List;
    var success = json['success'] as int;

    var todosList = list.map((e) => ToDos.fromJson(e)).toList();

    return TodosResponse(todos: todosList, success: success);
  }
}
