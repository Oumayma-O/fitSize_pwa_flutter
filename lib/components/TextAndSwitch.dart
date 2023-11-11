import 'package:fitsize/components/CustomSwitch.dart';
import 'package:flutter/material.dart';

class TextAndSwitch extends StatelessWidget {
  final String text;
  final String activeText;
  final String inactiveText;
  final Function(bool) onSwitch;


  const TextAndSwitch({
    super.key,
    required this.text,
    required this.activeText,
    required this.inactiveText,
    required this.onSwitch,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF08293F),
                  fontSize: 14,
                  fontFamily: 'TT Fors Trial',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomSwitch(activeText: activeText, inactiveText: inactiveText,initialValue: true,onSwitch: onSwitch,),
            ],
          ),
        ],
      ),
    );
  }
}
