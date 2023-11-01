import 'package:fitsize/pages/ScanEtape1Page.dart';
import 'package:fitsize/widgets/SuivantButton.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoTutoPage extends StatefulWidget {
  final String choixScan;

  VideoTutoPage({required this.choixScan});

  @override
  _VideoTutoPageState createState() => _VideoTutoPageState();
}

class _VideoTutoPageState extends State<VideoTutoPage> {
  late VideoPlayerController _controller;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/tuto2.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0);
        _controller.play();
        setState(() {});
      }).onError((error, stackTrace) {
        print("Error initializing video: $error");
      });

    _controller.setLooping(true);
  }

  void toggleMute() {
    setState(() {
      if (_isMuted) {
        _controller.setVolume(1);
      } else {
        _controller.setVolume(0);
      }
      _isMuted = !_isMuted;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("choixScan video tuto page: ${widget.choixScan}");

    return Scaffold(
      body: Stack(
        children: [
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255), size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(25),
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: toggleMute,
              child: Icon(
                _isMuted ? Icons.volume_off : Icons.volume_up,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SuivantButton(
                    buttonText: 'Passer le tutoriel',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScanEtape1Page(choixScan: widget.choixScan),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
