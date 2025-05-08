import 'dart:ui';

import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              title: Text('Main Screen'),
              elevation: 0,
              centerTitle: false,
              backgroundColor: const Color.fromARGB(255, 30, 30, 30),
            ),
          ),
        ),
      ),
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
    );
  }
}
