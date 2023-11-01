import 'dart:io';
import 'package:camera/camera.dart';
import 'package:fitsize/pages/ScanEtape2Page.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class ScanEtape1Page extends StatefulWidget {
  final String choixScan;

  ScanEtape1Page({required this.choixScan});

  @override
  _ScanEtape1PageState createState() => _ScanEtape1PageState();
}

class _ScanEtape1PageState extends State<ScanEtape1Page> {
  bool isLoading = true;
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool isCaptured = false;
  File? capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();

      CameraDescription? selectedCamera = _getSelectedCamera();

      if (selectedCamera != null) {
        _cameraController = CameraController(selectedCamera, ResolutionPreset.medium);
        await _cameraController.initialize();

        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        print('No suitable camera found.');
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  CameraDescription? _getSelectedCamera() {
    if (widget.choixScan == "Seul(e)") {
      return _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras[0],
      );
    } else if (widget.choixScan == "Par un ami") {
      return _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => _cameras[0],
      );
    }
    return null;
  }

  Future<void> _takePicture() async {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      print('Camera is not initialized.');
      return;
    }

    try {
      final XFile imageFile = await _cameraController.takePicture();

      final directory = await getApplicationDocumentsDirectory();
      final String fileName = 'image_${DateTime.now()}.png';
      final String filePath = join(directory.path, fileName);

      await File(imageFile.path).copy(filePath);

      setState(() {
        capturedImage = File(filePath);
        isCaptured = true;
      });

      print('Picture saved at: $filePath');
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  void _retakePicture() {
    setState(() {
      capturedImage = null;
      isCaptured = false;
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> texts = [];
    if (widget.choixScan == "Seul(e)") {
      texts = ['Tout seul', 'Par un ami'];
    } else if (widget.choixScan == "Par un ami") {
      texts = ['Par un ami', 'Tout seul'];
    }

    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                // Camera Preview
                if (!isCaptured)
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(_cameraController),
                  ),
                if (!isCaptured)
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 32, 32, 32), size: 30),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                if (!isCaptured)
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Positioned(
                          right: MediaQuery.of(context).size.width * 0.08,
                          top: MediaQuery.of(context).size.height * 0.4,
                          child: Image.asset(
                            'assets/images/Polygon 1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: MediaQuery.of(context).size.width * 0.04,
                          top: MediaQuery.of(context).size.height * 0.06,
                          child: Image.asset(
                            'assets/images/Group 205.png',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (!isCaptured)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 70.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              texts[0],
                              style: TextStyle(
                                fontFamily: 'Fors',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              texts[1],
                              style: TextStyle(
                                fontFamily: 'ForsLight',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFAFAFC),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                  InkWell(
                  onTap: () {
                    _takePicture();
                    // Use Navigator to push a new route when the circle button is pressed.
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return ScanEtape2Page(choixScan: widget.choixScan);
                    //     },
                    //   ),
                    // );
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4.0),
                      color: Color(0xFF4B56DB),
                    ),
                  ),
                ),

                      SizedBox(height: 30),
                    ],
                  ),
              
                if (isCaptured && capturedImage != null)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.file(capturedImage!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: _retakePicture,
                              child: Text('Retake'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                         
                              },
                              child: Text('Confirm'),
                            ),
                          ],
                        ),
                 
                        ElevatedButton(
                          onPressed: _retakePicture,
                          child: Text('Capture Another Image'),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}
