import 'package:fitsize/pages/AccueilPage.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key});

  double calculateTextSize(BuildContext context, double baseSize) {
    double scaleFactor = MediaQuery.of(context).size.height * 0.001;
    return baseSize * scaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle customTextStyle2 = TextStyle(
      fontFamily: 'Fors',
      fontWeight: FontWeight.w700,
      color: Color(0xFFFAFAFC),
      fontSize: calculateTextSize(context, 30),
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccueilPage()));
        },
        child: Container(
          color: Color(0xFF08293F),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Image.asset(
                        'assets/images/background.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.4,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 150,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.65,
                      left: 30,
                      right: 0,
                      child: Text(
                        'Bienvenue sur Fitsize,',
                        style: customTextStyle2,
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.7,
                      left: 30,
                      right: 0,
                      child: Text(
                        'découvrez une expérience de',
                        style: customTextStyle3,
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.75,
                      left: 30,
                      right: 0,
                      child: Text(
                        'mesure unique.',
                        style: customTextStyle3,
                        textAlign: TextAlign.left, // Align text to the left
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
