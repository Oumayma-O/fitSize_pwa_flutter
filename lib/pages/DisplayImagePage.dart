import 'package:flutter/material.dart';

class DisplayImagePage extends StatelessWidget {
  final String imagePath;

  const DisplayImagePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Image Page'),
      ),
      body: Center(
        child: Image.network(imagePath),
      ),
    );
  }
}
