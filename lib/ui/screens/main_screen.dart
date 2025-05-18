import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../core/cubits/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/ui/widgets/app_bar.dart';
import 'package:todo_app/ui/widgets/todo_list.dart';
import 'package:todo_app/ui/screens/save_screen.dart';
import 'package:todo_app/common/models/theme_model.dart';
import 'package:todo_app/common/constants/size_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().loadToDos();
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
                    context.read<MainCubit>().searchToDos(value);
                  },
                ),
              ),
              ToDoList(),
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
