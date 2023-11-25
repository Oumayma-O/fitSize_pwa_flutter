import 'package:flutter/material.dart';

class MessageBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Create a rectangle with rounded corners
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height - 20)),
        Radius.circular(12),
      ),
    );

    // Move to the bottom-left corner
    path.moveTo(0, size.height - 20);

    // Create a triangle at the bottom center
    path.lineTo(size.width / 2 - 10, size.height);
    path.lineTo(size.width / 2 + 10, size.height);

    // Move back to the bottom-right corner
    path.lineTo(size.width, size.height - 20);

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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipPath(
        clipper: MessageBubbleClipper(),
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
    );
  }
}
