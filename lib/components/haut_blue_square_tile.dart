// bas_blue_square_tile.dart
import 'package:flutter/material.dart';

class HautBlueSquareTile extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize2;
  final bool isEUStandard;

  const HautBlueSquareTile({
    super.key,
    required this.text1,
    required this.text2,
    required this.fontSize2,
    required this.isEUStandard,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    String convertedText2 = !isEUStandard ? convertToUS(text2) : text2;

    return Container(
      width: screenSize.width * 0.3897,
      height: screenSize.height * 0.1078,
      decoration: ShapeDecoration(
        color: Color(0xFF08293F),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFF9F9FB),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'TT Fors Trial  ',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(height: screenSize.height * 0.0094),
          Text(
            convertedText2, // Use the converted value
            style: TextStyle(
              color: Color(0xFFD8FD00),
              fontSize: fontSize2,
              fontFamily: 'TT Fors ',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }

  String convertToUS(String value) {

    if (value == "L") {
      return "XL";
    }
    return value;
  }
}
