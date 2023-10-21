import 'package:flutter/material.dart';

class MyPswdField extends StatefulWidget {
  final String hintText;

  MyPswdField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyPswdField> {
  bool obscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0x33353537)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0x66353537),
          fontFamily: 'TT Fors Trial',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
        suffixIcon: IconButton(
          onPressed: togglePasswordVisibility,
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
