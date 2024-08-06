import 'dart:io';

import 'package:camera_app/calendar/calendar.dart';
import 'package:camera_app/camera/camera_screen.dart';
import 'package:camera_app/components/bottom_navigation_bar.dart';
import 'package:camera_app/gallery/gallery.dart';
import 'package:camera_app/main.dart';
import 'package:camera_app/routes/routes.dart';

import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraState();
}

class _CameraState extends State<CameraPage> {
  int _selectedIndex = 3;
  String? imagePath;
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

      case 2:
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: const CalendarPage(),
            direction: AxisDirection.left,
          ),
        );
        break;
    }
  }

  void _openCamera() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraScreen()),
    );

    if (result != null) {
      setState(() {
        imagePath = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              imagePath != null
                  ? Image.file(File(imagePath!))
                  : Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.7),
                      child: const Text('No Image Captured'),
                    ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: _openCamera,
                  child: const Text(
                    'Open Camera',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
