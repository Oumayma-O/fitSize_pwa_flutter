import 'dart:io';
import 'package:camera/camera.dart';
import 'package:fitsize/pages/LoadingPage2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScanEtape1Page extends StatefulWidget {
  final String selectedChoix;

  ScanEtape1Page({required this.selectedChoix});

  @override
  _ScanEtape1PageState createState() => _ScanEtape1PageState();
}

class _ScanEtape1PageState extends State<ScanEtape1Page> {
  bool isLoading = true;
  bool isCaptured = false;
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  String capturedImagePath = '';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();

      CameraDescription? selectedCamera = _getSelectedCamera();

      if (selectedCamera != null) {
        _cameraController = CameraController(selectedCamera, ResolutionPreset.medium,enableAudio: false);
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
    if (widget.selectedChoix == "Seul(e)") {
      return _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras[0],
      );
    } else if (widget.selectedChoix == "Par un ami") {
      return _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => _cameras[0],
      );
    }
    return null;
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<String> texts = [];

    if (widget.selectedChoix == "Seul(e)") {
      texts = ['Tout seul', 'Par un ami'];
    } else if (widget.selectedChoix == "Par un ami") {
      texts = ['Par un ami', 'Tout seul'];
    }

    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                isCaptured
                    ? kIsWeb
                        ? Image.network(capturedImagePath, fit: BoxFit.cover, height: double.infinity, width: double.infinity)
                        : Image.file(File(capturedImagePath), fit: BoxFit.cover, height: double.infinity, width: double.infinity)
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: CameraPreview(_cameraController),
                      ),
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
                            texts[0], // You need to define the 'texts' list
                            style: TextStyle(
                              fontFamily: 'Fors',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            texts[1], // You need to define the 'texts' list
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
                  GestureDetector(
                    onTap: () async {
                      if (!_cameraController.value.isInitialized) {
                        return;
                      }
                      if (_cameraController.value.isTakingPicture) {
                        return;
                      }

                      try {
                        XFile file = await _cameraController.takePicture();
                        setState(() {
                          isCaptured = true;
                          capturedImagePath = file.path;
                        });

                        // Add a 2-second delay before navigating to LoadingPage2
                        await Future.delayed(Duration(seconds: 2));

                        // Navigate to LoadingPage2
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoadingPage2(), // Replace LoadingPage2 with your actual page
                          ),
                        );
                      } catch (e) {
                        debugPrint("Error occurred while taking a picture: $e");
                      }
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

                    SizedBox(height: 30,),
                  ],
                ),
              ],
            ),
    );
  }
}
