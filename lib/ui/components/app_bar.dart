import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/models/theme_model.dart';
import 'package:todo_app/common/providers/theme_provider.dart';
import 'package:todo_app/common/constants/size_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool withModeButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.withModeButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          title: Text(title, style: TextStyle(fontSize: 16)),
          elevation: 0,
          centerTitle: false,
          backgroundColor: context.themeColors.themeColor2,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: Sizes.padding),
              child:
                  withModeButton
                      ? IconButton(
                        icon: Icon(
                          Provider.of<ThemeProvider>(context).isDarkMode
                              ? Icons.light_mode
                              : Icons.dark_mode,
                        ),
                        onPressed: () {
                          Provider.of<ThemeProvider>(
                            context,
                            listen: false,
                          ).toggleTheme();
                        },
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
