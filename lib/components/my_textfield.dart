import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  //final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return TextField(
        //controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0), // Adjust the value as needed


          enabledBorder:  OutlineInputBorder(
              borderSide: const BorderSide(width: 1,color: Color(0x33353537)),
              borderRadius: BorderRadius.circular(8),


            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
            color: Color(0x66353537),
            fontFamily: 'TT Fors Trial',
            fontWeight: FontWeight.w400,
            height: 0,
            ),
        ),
      );
  }
}