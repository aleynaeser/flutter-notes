import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/data/entity/todos.dart';
import 'package:todo_app/ui/components/app_bar.dart';
import 'package:todo_app/ui/screens/save_screen.dart';
import 'package:todo_app/ui/screens/update_screen.dart';
import 'package:todo_app/common/models/theme_model.dart';
import 'package:todo_app/common/constants/size_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<List<ToDos>> loadToDos() async {
    var toDosList = <ToDos>[];
    var toDo1 = ToDos(id: 1, name: 'ToDo 1', image: 'simsek.png');
    var toDo2 = ToDos(id: 2, name: 'ToDo 2', image: 'simsek.png');
    var toDo3 = ToDos(id: 3, name: 'ToDo 3', image: 'simsek.png');
    toDosList.add(toDo1);
    toDosList.add(toDo2);
    toDosList.add(toDo3);
    return toDosList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'ToDo', withModeButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'See ',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    TextSpan(
                      text: 'Your Tasks',
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                style: const TextStyle(fontSize: 14),
              ),
              Padding(
                padding: const EdgeInsets.only(top: Sizes.padding),
                child: Text(
                  'Search your tasks or add new ones using the + button.',
                  style: TextStyle(
                    fontSize: 13,
                    color: context.themeColors.themeColor5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Sizes.padding),
                child: CupertinoSearchTextField(
                  placeholder: 'Search',
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              FutureBuilder<List<ToDos>>(
                future: loadToDos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var toDosList = snapshot.data;

                    return Expanded(
                      child: ListView.builder(
                        itemCount: toDosList!.length,
                        itemBuilder: (context, index) {
                          var toDo = toDosList[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => UpdateScreen(todos: toDo),
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
                                    Expanded(child: Text(toDo.name ?? '')),
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${toDo.name} silindi',
                                            ),
                                            duration: const Duration(
                                              seconds: 4,
                                            ),
                                            backgroundColor:
                                                context.themeColors.themeColor4,
                                            action: SnackBarAction(
                                              label: 'Geri Al',
                                              onPressed: () {
                                                // TODO: Implement undo functionality
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
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SaveScreen()),
          );
        },
      ),
    );
  }
}
