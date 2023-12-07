import 'package:flutter/material.dart';

class TextBlueBox extends StatelessWidget {
  final String firstText;
  final String secondText;

  TextBlueBox({required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 142,
      decoration: ShapeDecoration(
        color: Color(0xFF08293F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
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
                    fontSize: 16,
                    fontFamily: 'TT Fors Trial',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: 40,
              height: 1,
              color: Color(0x4CF9F9FB),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 273,
                  child: Text(
                    secondText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF9F9FB),
                      fontSize: 18,
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
