import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatefulWidget {
  final String activeText;
  final String inactiveText;

  const CustomSwitch( {
    super.key,
    required this.activeText ,
    required this.inactiveText,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: FlutterSwitch(
        width: screenSize.width*0.179,//70.0,
        height: screenSize.height*0.036,//31.0,
        valueFontSize: 14.0,
        //toggleSize: 45.0,
        value: status,
        borderRadius: 74.0,
        padding: 4.0,
        showOnOff: true,
        activeColor: const Color(0xFF4B56DB),
        activeText: widget.activeText,
        activeTextColor: Colors.white,
        activeTextFontWeight: FontWeight.w400,
        inactiveColor: const Color(0xFF4B56DB),
        inactiveTextColor: Colors.white,
        inactiveTextFontWeight: FontWeight.w400,
        inactiveText: widget.inactiveText,
        onToggle: (val) {
          setState(() {
            status = val;
          });
        },
      ),
    );
  }
}
