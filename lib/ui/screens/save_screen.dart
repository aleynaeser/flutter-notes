import 'package:flutter/material.dart';
import 'package:todo_app/ui/components/app_bar.dart';
import 'package:todo_app/common/constants/size_constants.dart';
import 'dart:math';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  late String currentImage;
  final List<String> images = [
    'agac.png',
    'araba.png',
    'cicek.png',
    'damla.png',
    'gezegen.png',
    'gunes.png',
    'roket.png',
    'semsiye.png',
    'simsek.png',
    'yildiz.png',
  ];

  @override
  void initState() {
    super.initState();
    currentImage = getRandomImage();
  }

  String getRandomImage() {
    final random = Random();
    return images[random.nextInt(images.length)];
  }

  void changeImage() {
    setState(() {
      currentImage = getRandomImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.height;
    final TextEditingController textController = TextEditingController();

    void saveTask(String task) {
      print(task + ' ' + currentImage);
    }

    return Scaffold(
      appBar: CustomAppBar(title: 'Save Screen'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: changeImage,
                child: Image.asset('images/$currentImage'),
              ),
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
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
