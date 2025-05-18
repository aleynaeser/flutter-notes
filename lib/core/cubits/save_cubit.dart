import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/todos_dao_repository.dart';
import 'main_cubit.dart';

class SaveCubit extends Cubit<void> {
  SaveCubit() : super(0);
  var toDosDoaRepository = TodosDaoRepository();

  Future<void> saveTask(String name, String image, MainCubit mainCubit) async {
    await toDosDoaRepository.saveTask(name, image);

    await mainCubit.loadToDos();
  }
}
