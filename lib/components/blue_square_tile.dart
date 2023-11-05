import 'package:flutter/material.dart';

class BlueSquareTile extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize2;

  const BlueSquareTile({
    super.key,
    required this.text1,
    required this.text2,
    required this.fontSize2,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.3897,
      height: screenSize.height * 0.1078,
      decoration: ShapeDecoration(
        color: Color(0xFF08293F),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2, // Responsive border width
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFF9F9FB),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //SizedBox(height: screenSize.height * 0.01895),
          Text(
            text1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16, // Responsive font size
              fontFamily: 'TT Fors Trial  ',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(height: screenSize.height * 0.0094),
          Text(
            text2,
            style: TextStyle(
              color: Color(0xFFD8FD00),
              fontSize: fontSize2, // Responsive font size
              fontFamily: 'TT Fors ',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          //SizedBox(height: screenSize.height * 0.0189),

        ],
      ),
    );
  }
}
