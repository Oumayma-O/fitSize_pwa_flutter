import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/DetailsPage.dart';
import 'CustomSwitch.dart';
import 'DetailsButton.dart';

class ScanContainer extends StatelessWidget {
  final bool isEUStandard;
  final bool isMetricStandard;
  final Function(bool) onSwitch;

  ScanContainer({required this.isEUStandard, required this.isMetricStandard, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      //width: screenSize.width * 0.8564,
      //height: screenSize.height * 0.1398,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.0189,
          horizontal: screenSize.width * 0.041,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Votre Scan',
                  style: TextStyle(
                    color: Color(0xFF08293F),
                    fontSize: screenSize.width * 0.04, // Responsive font size
                    fontFamily: 'TT Fors Trial',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/uil_schedule.png',
                        width: screenSize.width * 0.0427,
                        height: screenSize.height * 0.0197,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    Text(
                      '01/09/2023',
                      style: TextStyle(
                        color: Color(0xFF08293F),
                        fontSize: screenSize.width * 0.03, // Responsive font size
                        fontFamily: 'TT Fors Trial',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: screenSize.height*0.011,),
            const Divider(),
            SizedBox(height: screenSize.height*0.015,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'EU/US :',
                      style: TextStyle(
                        color: Color(0xFF08293F),
                        fontSize: screenSize.width * 0.03, // Responsive font size
                        fontFamily: 'TT Fors Trial',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    CustomSwitch(
                      inactiveText: "EU",
                      activeText: "US",
                      initialValue: isEUStandard,
                      onSwitch: (value) {
                        onSwitch(value);
                      },
                    )
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DetailsButton(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(isMetricStandard: isMetricStandard),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
