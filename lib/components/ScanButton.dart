import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  final Function()? onTap;

  const ScanButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenSize.width*0.2,
        height: screenSize.height*0.094,

        decoration: const ShapeDecoration(
          color: Color(0xFF4B56DB),
          shape: OvalBorder(),
          shadows: [
            BoxShadow(
              color: Colors.white, // White color for the glow
              spreadRadius: 5, // Adjust the spread radius as needed
              blurRadius: 10, // Adjust the blur radius as needed
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            "assets/images/scan_icon.png",
            width: screenSize.width*0.082,
            height: screenSize.height*0.049,
          ),
          ),
        ),
    );
  }
}