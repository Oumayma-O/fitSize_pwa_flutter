import 'package:fitsize/components/TextAndSwitch.dart';
import 'package:flutter/material.dart';
import '../components/DeconnexionButton.dart';
import 'AccueilPage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.07179),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.0734),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Paramètres',
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
                  const Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 38, 36, 56),
                        size: 32,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },

                    ),
                  ],)
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                          'Informations par défaut',
                          style: TextStyle(
                            color: Color(0xFF08293F),
                            fontSize: 14,
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
                      const TextAndSwitch(text: 'EU/US :', activeText: 'US', inactiveText: 'EU'),
                      SizedBox(height: screenSize.height * 0.021),
                      const TextAndSwitch(text: 'Poids :', activeText: 'Kg', inactiveText: 'Lb'),
                      SizedBox(height: screenSize.height * 0.021),
                      const TextAndSwitch(text: 'Taille :', activeText: 'Cm', inactiveText: 'In'),
                      SizedBox(height: screenSize.height * 0.0059),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenSize.height * 0.4123),
              DeconnexionButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AccueilPage()),
                  );
                },
              ),
              SizedBox(height: screenSize.height * 0.0236),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Supprimer mon compte',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4B56DB),
                    fontSize: 12,
                    fontFamily: 'TT Fors Trial',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
