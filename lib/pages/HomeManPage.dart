import 'package:flutter/material.dart';
import '../components/ScanButton.dart';
import '../components/ScanContainer.dart';
import '../components/blue_square_tile.dart';

class HomeManPage extends StatelessWidget {
  const HomeManPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/H_F.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.07179),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/fitsize_blue.png'),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/settings_wheel.png',
                            width: 28,
                            height: 28,
                          ),
                        ],
                      ),
                      ],),


                      SizedBox(height: screenSize.height * 0.052),

                  ScanContainer(),

                  SizedBox(height: screenSize.height * 0.028),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Recommandation',
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
                      SizedBox(height: screenSize.height * 0.02),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Voici les tailles idéales selon votre scan',
                            style: TextStyle(
                              color: Color(0xFF08293F),
                              fontSize: 14,
                              fontFamily: 'assets/fonts/TT Fors Trial Regular.ttf',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: screenSize.height * 0.0414),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const BlueSquareTile(text1: "Sexe", text2: "Homme", fontSize2: 20),
                          SizedBox(height: screenSize.height * 0.01895),
                          const BlueSquareTile(text1: "Haut", text2: "L", fontSize2: 28),
                          SizedBox(height: screenSize.height * 0.01895),
                          const BlueSquareTile(text1: "Bas", text2: "42", fontSize2: 28),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: screenSize.height * 0.06),

                  ScanButton(
                    onTap: () {
                      // Handle button tap
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.052),

                ],
              ),
            ),
          ),
          Positioned(
            left: screenSize.width * 0.5794,
            bottom: screenSize.height * 0.045,
            child: Image.asset(
              'assets/images/man_model.png',
              height: screenSize.height * 0.58,
              width: screenSize.width * 0.587,
            ),
          ),
        ],
      ),
    );
  }
}
