
import 'package:flutter/material.dart';


class PrecedentButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  PrecedentButton({required this.buttonText, this.onPressed});

  @override
  _PrecedentButtonState createState() => _PrecedentButtonState();
}

class _PrecedentButtonState extends State<PrecedentButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor =  Color(0xFFF7F7F8);
    Color textColor = Color(0xFF4B56DB);
    Color borderColor =  Color(0xFF4B56DB); 

    return ElevatedButton(
      onPressed: () {
     
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        minimumSize: Size(334, 50),
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: borderColor, // Border color
            width: 1.0,
          ),
        ),
      ),
      child: Text(
        widget.buttonText,
        style: TextStyle(
          color: textColor,
          fontFamily: 'ForsLight',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
