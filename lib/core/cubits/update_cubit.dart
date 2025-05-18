import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/todos_dao_repository.dart';

class UpdateCubit extends Cubit<void> { // no emit no sen data
  UpdateCubit() : super(0);
  var toDosDoaRepository = TodosDaoRepository();

   Future<void> updateTask(String id, String name) async {
    await toDosDoaRepository.updateTask(id, name);
  }
}