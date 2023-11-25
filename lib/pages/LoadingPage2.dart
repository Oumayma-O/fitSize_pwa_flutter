import 'dart:async';

import 'package:fitsize/pages/ResultatsPage.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class LoadingPage2 extends StatefulWidget {
  LoadingPage2({Key? key});

  @override
  _LoadingPage2State createState() => _LoadingPage2State();
}

class _LoadingPage2State extends State<LoadingPage2> {
  bool navigationCompleted = false;
  double progressBarValue = 0.0;

  @override
  void initState() {
    super.initState();
    startProgress();
  }

void startProgress() {
  const duration = const Duration(milliseconds: 500000);
  Timer.periodic(duration, (Timer timer) {
    if (progressBarValue < 1.0) {
      setState(() {
        progressBarValue += 0.2;
      });
    } else {
      timer.cancel();
      // Once the progress bar reaches 100%, navigate to the ResultsPage.
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ResultatsPage(),
      ));
    }
  });
}



  @override
  Widget build(BuildContext context) {
    TextStyle customTextStyle2 = const TextStyle(
      fontFamily: 'Fors',
      fontWeight: FontWeight.w600,
      color: Color(0xFFFAFAFC),
      fontSize: 16,
    );

    TextStyle customTextStyle3 = const TextStyle(
      fontFamily: 'ForsThin',
      fontWeight: FontWeight.w400,
      color: Color(0xFFFAFAFC),
      fontSize: 14,
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
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.asset(
                        'images/Group_4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.359,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 290,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.5,
                    left:MediaQuery.of(context).size.width * 0.4179,
                    right: MediaQuery.of(context).size.width * 0.4179,
                    child: Image.asset(
                      'assets/images/tape-measure.png',
                      width: 64,
                      height: 64,
                      fit: BoxFit.contain,
                    ),
                  ),
                     Positioned(
                      top: MediaQuery.of(context).size.height * 0.63,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.746,
                          child: GFProgressBar(
                            percentage: progressBarValue,
                            lineHeight: MediaQuery.of(context).size.height * 0.026,
                            alignment: MainAxisAlignment.spaceBetween,
                            backgroundColor: Color.fromARGB(251, 255, 255, 255),
                            progressBarColor: Color.fromARGB(255, 39, 255, 136),
                          ),
                        ),
                      ),
                    ),

                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.677,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 44.0),
                        child: Text(
                          'Notre couturier est en train de relever vos mesures !',
                          style: customTextStyle2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.7369,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: Text(
                          'Cela prend quelques secondes.',
                          style: customTextStyle3,
                          textAlign: TextAlign.center,
                        ),
                      ),
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
