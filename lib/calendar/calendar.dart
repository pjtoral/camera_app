import 'package:camera_app/camera/camera.dart';
import 'package:camera_app/components/bottom_navigation_bar.dart';
import 'package:camera_app/gallery/gallery.dart';
import 'package:camera_app/main.dart';
import 'package:camera_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/components/bottom_navigation_bar.dart';
import 'package:camera_app/themes/app_themes.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: const MyHomePage(),
            direction: AxisDirection.left,
          ),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: const GalleryPage(),
            direction: AxisDirection.left,
          ),
        );
        break;

      case 3:
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: const CameraPage(),
            direction: AxisDirection.right,
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Center(
        child: Text(
          'Calendar will be displayed here',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
