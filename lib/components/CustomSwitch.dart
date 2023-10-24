import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final Function(bool value) onChanged;
  final bool initialValue;

  const CustomSwitch({
    required this.onChanged,
    this.initialValue = false,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged(_value);
        });
      },
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _value ? Color(0xFF4B56DB) : Color(0xB2D8FD00),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              top: 2,
              left: _value ? 20 : 2,
              right: _value ? 2 : 20,
              child: Container(
                width: 26,
                height: 26,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    _value ? 'EU' : 'US',
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'TT Fors Trial',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
