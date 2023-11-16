import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/measurement.dart';

class DetailsPage extends StatelessWidget {
  final bool isMetricStandard;

  DetailsPage({Key? key, required this.isMetricStandard});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Create a list to store the replicated widgets
    List<Widget> replicatedMeasurements = [];

    // Use a for loop to replicate the widget 12 times
    for (int i = 0; i < 12; i++) {
      replicatedMeasurements.add(
        Column(
          children: [
            Measurement(
              text: 'Tour de cou',
              value: 54.0, // Set the value as a double
              imagePath: 'assets/images/Rectangle50.png',
              isMetricStandard: isMetricStandard,
            ),
            SizedBox(height: screenSize.height * 0.0213),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.07179),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.0734),

                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      ],
                    ),
                    Spacer(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Détails des mensurations',
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
                  ],
                ),

                SizedBox(height: screenSize.height * 0.047),
                ...replicatedMeasurements,
              ],
            ),
          ),
        ),
      ),
    );
  }
}