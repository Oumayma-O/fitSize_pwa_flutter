import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../components/LoadingMessageContainer.dart';
import '../components/text_blue_box.dart';
import 'TutorielEtape2Page.dart';

enum PhonePosition { WellPositioned, TiltedTop, TiltedBottom }

class ScanEtape9Page extends StatefulWidget {
  final String selectedChoix;
  final String selectedSexe;

  ScanEtape9Page({required this.selectedChoix, required this.selectedSexe});

  @override
  _ScanEtape9PageState createState() => _ScanEtape9PageState();
}

class _ScanEtape9PageState extends State<ScanEtape9Page> {
  bool isLoading = true;
  bool isCaptured = false;
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  String capturedImagePath = '';
  PhonePosition phonePosition = PhonePosition.WellPositioned;
  bool isMuted = false;
  String dynamicMessage = '';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _updateDynamicMessage();
    _startPhotoTaking();
  }


  Future<void> _initializeCamera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();

      CameraDescription? selectedCamera = _getSelectedCamera();

      if (selectedCamera != null) {
        _cameraController = CameraController(
            selectedCamera, ResolutionPreset.medium, enableAudio: false);
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
    final screenSize = MediaQuery
        .of(context)
        .size;
    final textScaleFactor = MediaQuery
        .of(context)
        .textScaleFactor;

    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
        children: <Widget>[
          isCaptured
              ? kIsWeb
              ? Image.network(
              capturedImagePath,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity)
              : Image.file(
              File(capturedImagePath),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity)
              : Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CameraPreview(_cameraController),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:screenSize.width * 0.0512,vertical:screenSize.height * 0.02369 ),
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 32, 32, 32), size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            top:screenSize.height *32.0/844,
            right:screenSize.width *  28.0/390,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isMuted = !isMuted;
                });
              },
              child: Image.asset(
                isMuted
                    ? 'images/no-sound.png'
                    : 'images/volume.png',
                width: screenSize.width *  28.0/390,
                height: screenSize.height *28/844,
              ),
            ),
          ),
          Positioned(
            top: screenSize.height *96/844,
            right: screenSize.width *  28.0/390,
            child: Container(
              width: screenSize.width *  38.0/390,
              height: screenSize.height * 136/844,
              decoration: ShapeDecoration(
                color: Color(0xFFEAEAEA),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 2, color: Color(0xFF08293F)),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenSize.width * 24/390,
                    height: screenSize.height* 24/844,
                    decoration: ShapeDecoration(
                      color: _getCercleColor(0),
                      shape: CircleBorder(
                        side: BorderSide(
                            width: 2,
                            color: _getCercleBorderColor(0)),
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width * 24/390,
                    height: screenSize.height* 24/844,
                    decoration: ShapeDecoration(
                      color: _getCercleColor(1),
                      shape: CircleBorder(
                        side: BorderSide(
                            width: 2,
                            color: _getCercleBorderColor(1)),
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width * 24/390,
                    height: screenSize.height* 24/844,
                    decoration: ShapeDecoration(
                      color: _getCercleColor(2),
                      shape: CircleBorder(
                        side: BorderSide(
                            width: 2,
                            color: _getCercleBorderColor(2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenSize.height* 28/844,
            left:screenSize.width * 28/390,
            right: screenSize.width * 28/390,
            child: TextBlueBox(
                firstText: 'Position de face', secondText: dynamicMessage),
          ),
          if (phonePosition == PhonePosition.WellPositioned)
            Positioned(
              bottom: screenSize.height* 355/844,
              left: screenSize.width * 80/390,
              right: screenSize.width * 80/390,
              child: LoadingMessageContainer(),
            ),
        ],
      ),
    );
  }

  Color _getCercleColor(int index) {
    switch (phonePosition) {
      case PhonePosition.WellPositioned:
        return index == 1 ? Color(0xFF1CE496) : Color(0xFFE1E1E1);
      case PhonePosition.TiltedTop:
        return index == 0 ? Colors.orange : Color(0xFFE1E1E1);
      case PhonePosition.TiltedBottom:
        return index == 2 ? Colors.orange : Color(0xFFE1E1E1);
    }
  }

  Color _getCercleBorderColor(int index) {
    switch (phonePosition) {
      case PhonePosition.WellPositioned:
        return index == 1 ? Color(0x9908293F) : Color(0xFFB6BCC1);
      case PhonePosition.TiltedTop:
        return index == 0 ? Color(0xFFCC5500) : Color(0xFFB6BCC1);
      case PhonePosition.TiltedBottom:
        return index == 2 ? Color(0xFFCC5500) : Color(0xFFB6BCC1);
    }
  }

  void _updateDynamicMessage() {
    switch (phonePosition) {
      case PhonePosition.WellPositioned:
        dynamicMessage = 'Regardez directement l’appareil photo';
        break;
      case PhonePosition.TiltedTop:
        dynamicMessage = "Votre téléphone est incliné vers l'avant.";
        break;
      case PhonePosition.TiltedBottom:
        dynamicMessage = "Votre téléphone est incliné vers le bas.";
        break;
    }
  }

  void _startPhotoTaking() {

      if (phonePosition == PhonePosition.WellPositioned) {
        // Wait for 3 seconds
        Timer(Duration(seconds: 3), () {
          // Take a photo
          _takePhotoAndNavigate();
        });
      }
  }

  void _takePhotoAndNavigate() async {
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

      // Navigate to TutorielEtape2Page after taking a picture
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TutorielEtape2Page(selectedChoix: widget.selectedChoix,
              selectedSexe: widget.selectedSexe,), // Replace with your actual page
        ),
      );
    } catch (e) {
      debugPrint("Error occurred while taking a picture: $e");
    }
  }
}
