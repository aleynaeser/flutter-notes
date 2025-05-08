import 'package:flutter/material.dart';
import 'package:todo_app/ui/components/app_bar.dart';
import 'package:todo_app/ui/screens/save_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Main Screen'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hello ',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    TextSpan(
                      text: 'World 👩‍💻',
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 227, 227, 227),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SaveScreen()),
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
