import 'package:flutter/material.dart';
import 'package:fitsize/pages/AccueilPage.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool navigationCompleted = false; // Flag to track whether navigation has occurred

  double calculateTextSize(BuildContext context, double baseSize) {
    double scaleFactor = MediaQuery.of(context).size.height * 0.001;
    return baseSize * scaleFactor;
  }

  @override
  void initState() {
    super.initState();

    // Introduce a delay before navigating to AccueilPage
    Future.delayed(Duration(seconds: 2), () {
      if (!navigationCompleted) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccueilPage()));
        navigationCompleted = true; // Set the flag to true after navigation
      }
    });
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
      body: Container(
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
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.7,
                    left: 30,
                    right: 0,
                    child: Text(
                      'découvrez une expérience de',
                      style: customTextStyle3,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.75,
                    left: 30,
                    right: 0,
                    child: Text(
                      'mesure unique.',
                      style: customTextStyle3,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
