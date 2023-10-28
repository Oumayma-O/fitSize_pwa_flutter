import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final Function()? onTap;

  const DetailsButton({Key? key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(
            width: 1,
            color: Color(0xFF4B56DB),
          ),
          backgroundColor: Color(0xFFF9F9FB),
          fixedSize: Size(screenSize.width*0.2435, screenSize.height*0.04739),

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
