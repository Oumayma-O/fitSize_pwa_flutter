import 'package:flutter/material.dart';

class Measurement extends StatelessWidget {
  final String text;
  final double value;
  final bool isMetricStandard;


  const Measurement({
    super.key,
    required this.text,
    this.value=0,
    required this.isMetricStandard,

  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    String convertedValue = isMetricStandard ? '$value Cm' : '${convertToInches(value)} In';


    return Container(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.025,vertical: screenSize.height*0.014),
        decoration: const BoxDecoration(
        border: Border(
        bottom: BorderSide(
        width: 1,
        color: Color(0x14505056),
        ),
        ),
        ),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             /* Image.asset(
                imagePath,
                width: screenSize.width*0.105,
                height: screenSize.height*0.085,
              ),
              SizedBox(width:screenSize.width*0.0769 ),*/
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF08293F),
                  fontSize: 14,
                  fontFamily: 'Roboto',
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
              Text(
                convertedValue,
                style: const TextStyle(
                  color: Color(0xFF4B56DB),
                  fontSize: 16,
                  fontFamily: 'TT Fors Trial',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double convertToInches(double cmValue) {
    // Conversion factor from cm to inches
    const double cmToInchesConversionFactor = 0.393701;
    return cmValue * cmToInchesConversionFactor;
  }


}
