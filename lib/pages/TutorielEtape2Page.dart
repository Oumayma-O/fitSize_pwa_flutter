import 'package:fitsize/pages/AccueilPage.dart';
import 'package:fitsize/pages/ScanEtape1Page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TutorielEtape2Page extends StatefulWidget {
  final String selectedChoix;
  final String selectedSexe;

  TutorielEtape2Page({required this.selectedChoix, required this.selectedSexe});

  @override
  _TutorielEtape2PageState createState() => _TutorielEtape2PageState();
}
class _TutorielEtape2PageState extends State<TutorielEtape2Page> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    print("choixScan tutoriel Etape2 page: ${widget.selectedChoix}");


    String backgroundImage = widget.selectedSexe == 'Homme'
        ? 'assets/images/Photo-homme-profil.png'
        : 'assets/images/Photo-femme-profil.png';

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
                          icon: Icon(
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
                                      SizedBox(height: screenSize.height*0.025),
                                      const Text(
                                        'Position de profil',
                                        style: TextStyle(
                                          fontFamily: 'Fors',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFAFAFC),
                                        ),
                                      ),
                                      SizedBox(height: screenSize.height*0.0094),
                                        const Text(
                                        "Tenez-vous de profil en maintenant les",
                                        style: TextStyle(
                                          fontFamily: 'ForsLight',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: Color.fromARGB(151, 255, 255, 255),
                                        ),
                                      ),
                                      
                                      const Text(
                                        "jambes rapprochées et les bras le long du",
                                        style: TextStyle(
                                          fontFamily: 'ForsLight',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: Color.fromARGB(151, 255, 255, 255),
                                        ),
                                      ),

                                        const Text(
                                        "corps dans la photo.",
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
                                  top: 27,
                                  child: Image.asset(
                                    'assets/images/Group 229.png',
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
                            style: TextStyle(
                              color: Color(0xFF353637),
                              fontFamily: 'Fors',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                         
                                Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => ScanEtape1Page(selectedChoix: widget.selectedChoix),),
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