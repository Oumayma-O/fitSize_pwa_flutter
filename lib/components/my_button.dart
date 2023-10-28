import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({Key? key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF4B56DB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fixedSize: Size(screenSize.width * 0.8564, screenSize.height * 0.0592),
      ),
      child: const Text(
        'Continuer',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'TT Fors Trial',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
    );
  }
}
