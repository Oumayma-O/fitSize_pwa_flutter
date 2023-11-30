import 'package:flutter/material.dart';

class MessageBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Move to the bottom-left corner
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // Create a triangle at the bottom center
    path.lineTo(size.width / 2 , size.height);
    path.lineTo(0, 0);


    // Move back to the bottom-right corner

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;

  ChatBubble({
    required this.text,
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children:[

        Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF08293F),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
          ClipPath(
        clipper: MessageBubbleClipper(),
            child: Container(
              width: 15,
              height: 9,
    decoration:  BoxDecoration(
     color: color,
    ),
      ),
          ),


    ]
    );
  }
}
