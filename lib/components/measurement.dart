import 'package:flutter/material.dart';

class Measurement extends StatelessWidget {
  final String text;
  final String value;
  final String imagePath;

  const Measurement({
    super.key,
    required this.text,
    required this.value,
    this.imagePath = 'assets/images/echec.png',
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                width: screenSize.width*0.105,
                height: screenSize.height*0.085,
              ),
              SizedBox(width:screenSize.width*0.0769 ),
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF08293F),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$value cm',
                style: const TextStyle(
                  color: Color(0xFF4B56DB),
                  fontSize: 16,
                  fontFamily: 'TT Fors Trial',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
