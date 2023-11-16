import 'package:flutter/material.dart';
import '../components/TextAndSwitch.dart';
import '../components/DeconnexionButton.dart';
import 'AccueilPage.dart';

class SettingsPage extends StatelessWidget {
  final Function(bool) updateMetricStandard;
  final Function(bool) updateUSStandard;

  const SettingsPage({
    super.key,
    required this.updateMetricStandard,
    required this.updateUSStandard,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.07179),
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.0734),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Paramètres',
                          style: TextStyle(
                            color: Color(0xFF08293F),
                            fontSize: screenSize.width * 0.04,
                            fontFamily: 'TT Fors Trial',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 38, 36, 56),
                            size: screenSize.width * 0.08,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: screenSize.height * 0.04739),
                Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9EEF1).withOpacity(0.5),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Informations par défaut',
                                style: TextStyle(
                                  color: Color(0xFF08293F),
                                  fontSize: screenSize.width * 0.03,
                                  fontFamily: 'TT Fors Trial',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black.withOpacity(0.1),
                          ),
                          SizedBox(height: screenSize.height * 0.028),
                          TextAndSwitch(
                            text: 'EU/US :',
                            activeText: 'US',
                            inactiveText: 'EU',
                            onSwitch: (bool value) {
                              updateUSStandard(value);
                            },
                          ),
                          SizedBox(height: screenSize.height * 0.021),
                          TextAndSwitch(
                            text: 'Poids :',
                            activeText: 'Kg',
                            inactiveText: 'Lb',
                            onSwitch: (bool value) {},
                          ),
                          SizedBox(height: screenSize.height * 0.021),
                          TextAndSwitch(
                            text: 'Taille :',
                            activeText: 'Cm',
                            inactiveText: 'In',
                            onSwitch: (bool value) {
                              updateMetricStandard(value);
                            },
                          ),
                          SizedBox(height: screenSize.height * 0.0059),
                        ],
                      ),
                    ),
                  ),

                SizedBox(height: screenSize.height * 0.4123),
                DeconnexionButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AccueilPage()),
                    );
                  },
                ),
                SizedBox(height: screenSize.height * 0.0236),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Supprimer mon compte',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4B56DB),
                      fontSize: screenSize.width * 0.03,
                      fontFamily: 'TT Fors Trial',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.0829),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
