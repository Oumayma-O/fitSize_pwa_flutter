import 'package:flutter/material.dart';

class TextBlueBox extends StatelessWidget {
  final String firstText;
  final String secondText;

  TextBlueBox({required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final textScaleFactor = MediaQuery
        .of(context)
        .textScaleFactor;

    return Container(
      width: screenSize.width*0.8564,
      height: screenSize.height*0.1682,
      decoration: ShapeDecoration(
        color: Color(0xFF08293F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.0769, vertical: screenSize.height*0.02132),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16 * textScaleFactor,
                    fontFamily: 'TT Fors Trial',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height* 16/844),
            Container(
              width: screenSize.width * 40 / 390,
              height: screenSize.height * 1/844,
              color: Color(0x4CF9F9FB),
            ),
            SizedBox(height: screenSize.height* 16/844),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  //width: screenSize.width *273/390,
                  child: Text(
                    secondText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF9F9FB),
                      fontSize: 18 * textScaleFactor,
                      fontFamily: 'TT Fors Trial',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
