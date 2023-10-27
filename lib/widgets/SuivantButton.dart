import 'package:flutter/material.dart';



class SuivantButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  SuivantButton({required this.buttonText, this.onPressed});

  @override
  _SuivantButtonState createState() => _SuivantButtonState();
}

class _SuivantButtonState extends State<SuivantButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor =  Color(0xFF4B56DB) ;
    Color textColor =  Colors.white ;
    Color borderColor =  Color(0xFF4B56DB) ;

    return ElevatedButton(
      onPressed: () {
     
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        minimumSize: Size(0.8 * MediaQuery.of(context).size.width, 50),
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


