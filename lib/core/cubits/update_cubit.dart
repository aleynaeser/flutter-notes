import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/cubits/main_cubit.dart';
import '../data/repo/todos_dao_repository.dart';

class UpdateCubit extends Cubit<void> {
  // no emit no sen data
  UpdateCubit() : super(0);
  var toDosDoaRepository = TodosDaoRepository();

  Future<void> updateTask(int id, String name, MainCubit mainCubit) async {
    await toDosDoaRepository.updateTask(id, name);
    await mainCubit.loadToDos();
  }
}
