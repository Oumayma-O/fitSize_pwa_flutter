import 'package:fitsize/components/DetailsButton.dart';
import 'package:flutter/material.dart';

import 'CustomSwitch.dart';

class ScanContainer extends StatelessWidget {
  const ScanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.8564,
      height: screenSize.height * 0.1398,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Votre Scan',
                      style: TextStyle(
                        color: Color(0xFF08293F),
                        fontSize: 18,
                        fontFamily: 'TT Fors Trial',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: screenSize.width * 0.02),
                    const Text(
                      '01/09/2023',
                      style: TextStyle(
                        color: Color(0xFF08293F),
                        fontSize: 14,
                        fontFamily: 'TT Fors Trial',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'EU/US :',
                      style: TextStyle(
                        color: Color(0xFF08293F),
                        fontSize: 14,
                        fontFamily: 'TT Fors Trial',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.03),
                    const CustomSwitch(activeText: "EU",inactiveText:"US"),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DetailsButton(
                      onTap: () {
                        // Handle button tap
                      },
                    ),
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
