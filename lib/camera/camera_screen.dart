import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  List? cameras;
  late int selectedCameraIndex;
  late String imgPath;

  // Camera initialization
  Future _initCameraController(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController!.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    if (cameraController!.value.hasError) {
      print('Camera error ${cameraController!.value.errorDescription}');
    }

    try {
      await cameraController!.initialize();
    } on CameraException catch (e) {
      //show exception
    }

    if (mounted) {
      setState(() {});
    }
  }

  // Display Camera Previus
  Widget _cameraPreviewWidget() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return Text(
        'Loading',
      );
    }
    ;
    return AspectRatio(
      aspectRatio: cameraController!.value.aspectRatio,
      child: CameraPreview(cameraController!),
    );
  }

  //Control bar with buttons to take pictures
  Widget _cameraControlWiget(context) {
    return Expanded(
      child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                child: Icon(Icons.camera),
                backgroundColor: Theme.of(context).primaryColorLight,
                onPressed: () {
                  _onCapturePressed(context);
                },
              )
            ],
          )),
    );
  }

  // Camera toggle
  Widget _cameraToggleWidget(context) {
    if (cameras == null || cameras!.isEmpty) {
      return const Spacer();
    }

    CameraDescription selectedCamera = cameras![selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
        child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: _onSwitchCamera,
                icon: Icon(
                  Icons.flip_camera_android,
                  color: Theme.of(context).primaryColorLight,
                ))));
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();

    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras!.length > 0) {
        setState(() {
          selectedCameraIndex = 0;
        });
        _initCameraController(cameras![selectedCameraIndex]).then((void v) {});
      } else {}
    });
  }

  Future<void> requestPermissions() async {
    await [
      Permission.camera,
      Permission.storage,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: _cameraPreviewWidget(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _cameraToggleWidget(context),
                    _cameraControlWiget(context),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCapturePressed(context) async {
    try {
      final path =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

      final image = await cameraController!.takePicture();

      await image.saveTo(path);

      // Save to gallery
      await GallerySaver.saveImage(path, albumName: 'Camera App');

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Picture saved to Gallery')));

      Navigator.pop(context, path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void _onSwitchCamera() {
    selectedCameraIndex =
        selectedCameraIndex < cameras!.length - 1 ? selectedCameraIndex + 1 : 0;

    CameraDescription selectedCamera = cameras![selectedCameraIndex];
    _initCameraController(selectedCamera);
  }
}
