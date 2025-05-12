import 'package:flutter/material.dart';
import 'package:todo_app/core/data/entity/todos.dart';
import 'package:todo_app/ui/components/app_bar.dart';
import 'package:todo_app/common/constants/size_constants.dart';

class UpdateScreen extends StatefulWidget {
  final ToDos todos;
  const UpdateScreen({super.key, required this.todos});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.height;
    var currentImage = widget.todos.image;

    final TextEditingController textController = TextEditingController(text: widget.todos.name);

    void saveTask(String task) {
      print(task + ' ' + currentImage);
    }

    return Scaffold(
      appBar: CustomAppBar(title: 'Update Screen'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/$currentImage'),
              const SizedBox(height: Sizes.sizedBox),
              Padding(
                padding: const EdgeInsets.all(Sizes.padding),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Enter your task',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: Sizes.sizedBox),
              SizedBox(
                width: screenWidth * 0.3,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  onPressed: () => saveTask(textController.text),
                  child: Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
