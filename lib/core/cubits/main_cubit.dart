import '../data/entity/todos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/todos_dao_repository.dart';

class MainCubit extends Cubit<List<ToDos>> {
  MainCubit() : super(<ToDos>[]);
  var toDosDoaRepository = TodosDaoRepository();

  Future<void> loadToDos() async {
    var toDosList = await toDosDoaRepository.loadToDos();
    emit(toDosList);
  }

  Future<void> searchToDos(String searchText) async {
    var toDosList = await toDosDoaRepository.searchToDos(searchText);
    emit(toDosList);
  }

  Future<void> deleteTask(int id) async {
    await toDosDoaRepository.deleteTask(id);
    await loadToDos();
  }
}
