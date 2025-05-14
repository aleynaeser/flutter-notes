import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/data/repo/todos_dao_repository.dart';
import 'main_cubit.dart';

class SaveCubit extends Cubit<void> {
  SaveCubit() : super(0);
  var toDosDoaRepository = TodosDaoRepository();

  // Task kaydetme ve ana sayfaya dönüş için
  Future<void> saveTask(String name, String image, MainCubit mainCubit) async {
    await toDosDoaRepository.saveTask(name, image);

    // MainCubit'i güncelleyerek listenin yenilenmesini sağla
    await mainCubit.loadToDos();
  }
}
