import 'package:camera_app/calendar/calendar.dart';
import 'package:camera_app/camera/camera.dart';
import 'package:camera_app/components/bottom_navigation_bar.dart';
import 'package:camera_app/main.dart';
import 'package:camera_app/routes/routes.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  int _selectedIndex = 1;

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
        title: const Text('Gallery Page'),
      ),
      body: Center(
        child: Text(
          'No Images to Display',
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
