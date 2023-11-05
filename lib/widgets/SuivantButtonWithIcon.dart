import 'package:flutter/material.dart';

class SuivantButtonWithIcon extends StatefulWidget {
  final String buttonText;
  final IconData? iconData; // Icon to be displayed
  final VoidCallback? onPressed;

  SuivantButtonWithIcon({
    required this.buttonText,
    this.iconData,
    this.onPressed,
  });

  @override
  _SuivantButtonWithIconState createState() => _SuivantButtonWithIconState();
}

class _SuivantButtonWithIconState extends State<SuivantButtonWithIcon> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor =  Color(0xFF4B56DB) ;
    Color textColor =  Colors.white ;
    Color borderColor =   Color(0xFF4B56DB) ;
    Color iconColor =  Colors.white ;

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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.iconData != null) ...[
            Icon(
              widget.iconData,
              color: iconColor,
            ), // Display the icon if provided
            SizedBox(width: 8), // Add some space between icon and text
          ],
          Text(
            widget.buttonText,
            style: TextStyle(
            color: textColor,
            fontFamily: 'ForsLight',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
