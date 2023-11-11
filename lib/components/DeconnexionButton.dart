import 'package:flutter/material.dart';

class DeconnexionButton extends StatelessWidget {
  final Function()? onTap;

  DeconnexionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return GestureDetector(
      onTap: onTap,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(
            color: Color(0xFF4B56DB),
            width: 1,
          ),
          backgroundColor: Color(0xFFF9F9FB),
          fixedSize: Size(screenSize.width * 0.8564, screenSize.height * 0.0592),

        ),
        child: const Center(
          child: Text(
            'Déconnexion',
            style: TextStyle(
              color: Color(0xFF4B56DB),
              fontSize: 16,
              fontFamily: 'TT Fors Trial',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
