import 'package:fitsize/pages/AccueilPage.dart';
import 'package:fitsize/pages/ScanEtape1Page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TutorielEtape2Page extends StatefulWidget {
  final String selectedChoix;

  TutorielEtape2Page({required this.selectedChoix});

  @override
  _TutorielEtape2PageState createState() => _TutorielEtape2PageState();
}

class _TutorielEtape2PageState extends State<TutorielEtape2Page> {
  @override
  Widget build(BuildContext context) {
    print("choixScan tutoriel Etape2 page: ${widget.selectedChoix}");

    return Scaffold(
      body: SingleChildScrollView( 
        child: Stack(
          children: [
       
            Container(
              width: MediaQuery.of(context).size.width+40,
              height: MediaQuery.of(context).size.height+ 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fond photo profil.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Color(0xFF262438), size: 30),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(20),
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

             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:150,
                    width:334,
                    child: Stack(
                      alignment: Alignment.center, 
                      children: [
                        Image.asset('assets/images/etape1.png'),
                        Positioned(
                          top: 20, 
                          child: Image.asset('assets/images/Group 229.png'), 
                        ),
                      ],
                    ),
                  ),
                ],
              ),
                SizedBox(height: 20),
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