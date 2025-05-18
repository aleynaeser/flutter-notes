import 'package:flutter/material.dart';
import '../../core/cubits/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/data/entity/todos.dart';
import 'package:todo_app/ui/screens/update_screen.dart';
import 'package:todo_app/common/models/theme_model.dart';
import 'package:todo_app/common/constants/size_constants.dart';


class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, List<ToDos>>(
      builder: (context, toDosList) {
        if (toDosList.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              itemCount: toDosList.length,
              itemBuilder: (context, index) {
                var toDo = toDosList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateScreen(todos: toDo),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    color: context.themeColors.themeColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.padding),
                      child: Row(
                        children: [
                          Image.asset('images/${toDo.image}'),
                          const SizedBox(width: Sizes.sizedBox),
                          Expanded(child: Text(toDo.name)),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${toDo.name} task will be deleted.',
                                  ),
                                  duration: const Duration(seconds: 4),
                                  backgroundColor:
                                      context.themeColors.themeColor4,
                                  action: SnackBarAction(
                                    label: 'Yes',
                                    onPressed: () {
                                      context.read<MainCubit>().deleteTask(
                                        toDo.id,
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (toDosList.isEmpty) {
          return const Center(child: Text('These is no task yet.'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
