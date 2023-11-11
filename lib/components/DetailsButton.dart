import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final Function()? onTap;

  const DetailsButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenSize.width*0.2435,
        height: screenSize.height*0.04739,
        decoration: ShapeDecoration(
          color: Color(0xFFF9F9FB),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF4B56DB)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Voir détails',
                style: TextStyle(
                  color: Color(0xFF4B56DB),
                  fontSize: 14,
                  fontFamily: 'TT Fors Trial',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
          ),
        ),
    );
  }
}