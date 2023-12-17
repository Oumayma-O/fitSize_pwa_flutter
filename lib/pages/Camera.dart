import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'DisplayImagePage.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture; // Corrected variable name
  late String _imagePath;

  @override
  void initState() {
    super.initState();

    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    _controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize(); // Corrected variable name
  }

  Future<String> _takePicture() async {
    try {
      await _initializeControllerFuture;

      final Directory appDir = await getApplicationDocumentsDirectory();
      final String imagePath = '${appDir.path}/image_${DateTime.now()}.png';

      await _controller.takePicture();

      return imagePath;
    } catch (e) {
      print('Error taking picture: $e');
      return '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: CameraPreview(_controller),
                ),
                ElevatedButton(
                  onPressed: () async {
                    _imagePath = await _takePicture();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayImagePage(imagePath: _imagePath),
                      ),
                    );
                  },
                  child: Text('Take Picture'),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
