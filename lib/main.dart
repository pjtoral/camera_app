import 'package:camera_app/calendar/calendar.dart';
import 'package:camera_app/camera/camera.dart';
import 'package:camera_app/components/bottom_navigation_bar.dart';
import 'package:camera_app/gallery/gallery.dart';
import 'package:camera_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: const GalleryPage(),
            direction: AxisDirection.right,
          ),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: const CalendarPage(),
            direction: AxisDirection.right,
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
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Text('Welcome to the Home Page',
            style: Theme.of(context).textTheme.titleSmall),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
