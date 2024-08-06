import 'package:flutter/material.dart';
import 'package:camera_app/themes/app_themes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppThemes.lightTheme.scaffoldBackgroundColor,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo),
          label: 'Gallery',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'Camera',
        ),
      ],
      onTap: onTap,
    );
  }
}
