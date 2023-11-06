import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatefulWidget {
  final String activeText;
  final String inactiveText;
  final bool initialValue;
  final Function(bool) onSwitch; // Callback for switch state changes

  const CustomSwitch({
    super.key,
    required this.activeText,
    required this.inactiveText,
    required this.initialValue, // Initialize the switch state
    required this.onSwitch, // Callback for switch state changes
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool status;

  @override
  void initState() {
    super.initState();
    status = widget.initialValue; // Initialize the switch state
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: FlutterSwitch(
        width: screenSize.width * 0.179,
        height: screenSize.height * 0.036,
        valueFontSize: 14.0,
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
          widget.onSwitch(val); // Call the callback when the switch changes
        },
      ),
    );
  }
}
