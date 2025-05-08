import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/screens/main_screen.dart';
import 'package:todo_app/common/constants/base_constants.dart';
import 'package:todo_app/common/providers/theme_provider.dart';
import 'package:todo_app/common/configs/theme_config.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: AppInfo.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.getTheme(themeProvider.isDarkMode),
          home: const MainScreen(),
        );
      },
    );
  }
}
