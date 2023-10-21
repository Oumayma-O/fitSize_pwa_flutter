import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Container(
      padding: EdgeInsets.all(25),
      width: screenSize.width*0.4025,
      height: screenSize.height*0.1054,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0x33353537)),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Image.asset(
        imagePath,
        width: screenSize.width*0.0923,
        height: screenSize.height*0.1054,
      ),
    );
  }
}