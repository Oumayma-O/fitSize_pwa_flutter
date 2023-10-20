import 'package:fitsize/pages/AccueilPage.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key});

  double calculateTextSize(BuildContext context, double baseSize) {
    // Adjust these factors as needed for responsive text size
    double scaleFactor = MediaQuery.of(context).size.height * 0.001;
    return baseSize * scaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle customTextStyle2 = TextStyle(
      fontFamily: 'Fors',
      fontWeight: FontWeight.w700,
      color: Color(0xFFFAFAFC),
      fontSize: calculateTextSize(context, 28),
    );

    TextStyle customTextStyle3 = TextStyle(
      fontFamily: 'ForsThin',
      fontWeight: FontWeight.w400,
      color: Color(0xFFFAFAFC),
      fontSize: calculateTextSize(context, 24),
    );

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigate to the AccueilPage when tapped
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccueilPage()));
        },
        child: Container(
          color: Color(0xFF08293F),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: -19,
                      left: 0,
                      right: 0,
                      height: MediaQuery.of(context).size.height * 0.6, // Adjust the height as needed
                      child: Image.asset(
                        'assets/images/background.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.25,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 200, // Set the desired width
                          height: 150, // Set the desired height
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain, // Use BoxFit.contain to fit the image within the specified dimensions
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.55,
                      left: -70,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Bienvenue sur Fitsize,',
                          style: customTextStyle2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.6,
                      left: -56,
                      right: 0,
                      child: Center(
                        child: Text(
                          'découvrez une expérience de',
                          style: customTextStyle3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                       Positioned(
                      top: MediaQuery.of(context).size.height * 0.65,
                      left: -185,
                      right: 0,
                      child: Center(
                        child: Text(
                          'mesure unique.',
                          style: customTextStyle3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
