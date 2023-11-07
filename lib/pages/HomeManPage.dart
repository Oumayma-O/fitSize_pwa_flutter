import 'package:flutter/material.dart';
import '../components/DetailsButton.dart';
import '../components/ScanButton.dart';
import '../components/ScanContainer.dart';
import '../components/bas_blue_square_tile.dart';
import '../components/haut_blue_square_tile.dart';
import '../components/sexe_blue_square_tile.dart';
import 'SettingsPage.dart';

class HomeManPage extends StatefulWidget {

  @override
  _HomeManPageState createState() => _HomeManPageState();
}

class _HomeManPageState extends State<HomeManPage> {
  bool isEUStandard = true;
  bool isMetricStandard =true;

  void updateMetricStandard(bool value) {
    setState(() {
      isMetricStandard = value;
    });
  }
  void updateUSStandard(bool value) {
    setState(() {
      isEUStandard = value;
    });
  }

  void _handleSwitch(bool value) {
    setState(() {
      isEUStandard = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenSize = constraints.biggest;

          return Stack(
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
                      Expanded(child: SizedBox(height: screenSize.height * 0.073)),
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => SettingsPage(updateMetricStandard: updateMetricStandard,updateUSStandard: updateUSStandard)),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/settings_wheel.png',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.052),
                      ScanContainer(
                        isEUStandard:isEUStandard,
                        isMetricStandard:isMetricStandard,
                        onSwitch: _handleSwitch,
                      ),
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
                          SizedBox(height: screenSize.height * 0.0094),
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
                              const SexeBlueSquareTile(text1: "Sexe", text2: "Homme", fontSize2: 20),
                              SizedBox(height: screenSize.height * 0.01895),
                              HautBlueSquareTile(text1: "Haut", text2: "L", fontSize2: 28, isEUStandard:isEUStandard),
                              SizedBox(height: screenSize.height * 0.01895),
                              BasBlueSquareTile(text1: "Bas", text2: "42", fontSize2: 28, isEUStandard: isEUStandard),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.06),
                      ScanButton(
                        onTap: () {
                          // Navigator.of(context).push(
                          // MaterialPageRoute(builder: (context) => TutorielEtape1Page()),
                          //);
                        },
                      ),
                      SizedBox(height: screenSize.height * 0.052),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Positioned(
                  left: screenSize.width * 0.5794,
                  bottom: screenSize.height * 0.045,
                  child: Image.asset(
                    'assets/images/man_model.png',
                    height: screenSize.height * 0.58,
                    width: screenSize.width * 0.587,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
