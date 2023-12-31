import 'package:fitsize/pages/AccueilPage.dart';
import 'package:fitsize/pages/ScanEtape2Page.dart';
import 'package:fitsize/pages/TutorielEtape2Page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'ScanEtape9Page.dart';

class TutorielEtape1Page extends StatefulWidget {
  final String selectedChoix;
  final String selectedSexe;

  TutorielEtape1Page({required this.selectedChoix, required this.selectedSexe});


  @override
  _TutorielEtape1PageState createState() => _TutorielEtape1PageState();
}

class _TutorielEtape1PageState extends State<TutorielEtape1Page> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final textScaleFactor = MediaQuery
        .of(context)
        .textScaleFactor;

    print("choixScan tutoriel Etape1 page: ${widget.selectedChoix}");

    // Define the image path based on the selectedSexe
    String backgroundImage = widget.selectedSexe == 'Homme'
        ? 'assets/images/Photo-homme-face.png'
        : 'assets/images/Photo-femme-face.png';

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 194, 194),
      body: Container(

        child: Stack(

          children: [
            Positioned(
              child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(backgroundImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),


              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Color(0xFF262438), size: 30),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:screenSize.width*0.071),
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 38, 36, 56),
                            size: 32,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => AccueilPage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenSize.height*0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //height: 162,
                            //width: 334,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Replace etape1 image with a Container containing texts
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal:screenSize.width*0.05,vertical: screenSize.height*0.018),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(229, 8, 41, 63),
                                    borderRadius: BorderRadius.circular(12), // Add this for rounded corners
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center, // Center text vertically
                                    mainAxisSize: MainAxisSize.min, // Take minimum vertical space
                                    children: [
                                    SizedBox(height: screenSize.height*0.0189),
                                      const Text(
                                        'Position de face',
                                        style: TextStyle(
                                          fontFamily: 'Fors',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFAFAFC),
                                        ),
                                      ),
                                      SizedBox(height: screenSize.height*0.0094),
                                        const Text(
                                        "Portez des vêtements près du corps !",
                                        style: TextStyle(
                                          fontFamily: 'ForsLight',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: Color.fromARGB(151, 255, 255, 255),
                                        ),
                                      ),

                                      const Text(
                                        "Tenez-vous face à l'appareil photo avec les",
                                        style: TextStyle(
                                          fontFamily: 'ForsLight',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: Color.fromARGB(151, 255, 255, 255),
                                        ),
                                      ),

                                        const Text(
                                        " bras légèrement écartés et les jambes à",
                                        style: TextStyle(
                                          fontFamily: 'ForsLight',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color:  Color.fromARGB(151, 255, 255, 255),
                                        ),
                                      ),
                                          const Text(
                                        " environ 35 degrés.",
                                        style: TextStyle(
                                          fontFamily: 'ForsLight',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color:  Color.fromARGB(151, 255, 255, 255),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  child: Image.asset(
                                    'assets/images/Group 228.png',
                                    width: 61,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),


                  SizedBox(height: screenSize.height*0.016),
                 Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Passer',
                            style: const TextStyle(
                              color: Color(0xFF353637),
                              fontFamily: 'Fors',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ScanEtape9Page(
                                  selectedChoix: widget.selectedChoix,
                                  selectedSexe: widget.selectedSexe,
                                ),
                              ),
                            );
                          },

                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
      ),

    );
  }
}