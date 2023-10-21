import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenSize.width*0.8564,
        height: screenSize.height*0.0592,
        /*padding: EdgeInsets.only(
          top: screenSize.height*0.0189,
          left: screenSize.width*0.06153,
          right: screenSize.width*0.041,
          bottom: screenSize.height*0.0189,
        ),*/
        decoration: ShapeDecoration(
          color: Color(0xFF4B56DB),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Center(
          child: Text(
            'Continuer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'TT Fors Trial',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          )
          ),
        ),
    );
  }
}