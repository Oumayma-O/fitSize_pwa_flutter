import 'package:flutter/material.dart';

class LoadingMessageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final textScaleFactor = MediaQuery
        .of(context)
        .textScaleFactor;

    return Container(
      width: screenSize.width * 230/390,
      //height: screenSize.height * 134/844,
      decoration: ShapeDecoration(
        color: Color(0xFF08293F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenSize.height * 20/844),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenSize.width *  32/390,
                  height:screenSize.height *32/844,
                  child: CircularProgressIndicator(
                    strokeWidth: 3, // Adjust the strokeWidth as needed
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                SizedBox(height: screenSize.height * 8/844),
                Text(
                  'Juste un moment...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16 * textScaleFactor,
                    fontFamily: 'TT Fors Trial',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenSize.height * 8/844),
                Text(
                  'Nous allons prendre la photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14 * textScaleFactor,
                    fontFamily: 'TT Fors Trial',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
