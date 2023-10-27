import 'package:fitsize/pages/ScanEtape1Page.dart';
import 'package:fitsize/widgets/SuivantButton.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTutoPage extends StatefulWidget {

  final String choixScan; // Add a parameter to accept the button text

  VideoTutoPage({required this.choixScan}); // Constructor to initialize the parameter



  @override
  _VideoTutoPageState createState() => _VideoTutoPageState();
}

class _VideoTutoPageState extends State<VideoTutoPage> {
  late VideoPlayerController _controller;
  bool _isMuted = true; // Initialize as muted by default

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/tuto.mp4')
      ..initialize().then((_) {
        print("Video initialization successful");
        _controller.setVolume(0); // Mute by default
        _controller.play(); // Auto-play when initialization is complete
        setState(() {});
      }).onError((error, stackTrace) {
        print("Error initializing video: $error");
      });
    _controller.setLooping(true); // Loops the video
  }

  void toggleMute() {
    setState(() {
      if (_isMuted) {
        _controller.setVolume(1); // Unmute
      } else {
        _controller.setVolume(0); // Mute
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
          // Video player
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
          // Top-right sound icon
      // Top-left back icon
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255), size: 30),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        // Top-right sound icon
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: toggleMute, // Toggle mute/unmute on tap
            child: Icon(
              _isMuted ? Icons.volume_off : Icons.volume_up,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
          // Your page content on top of the video
           Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: 
                  
                   SuivantButton(
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
