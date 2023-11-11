import 'package:fitsize/pages/LoadingPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  bool isCheckboxChecked = false;

  TextStyle customTextStyle = TextStyle(
    fontFamily: 'ForsLight',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color:  Color(0xFF08293F),
  );

TextStyle customTextStyle2 = TextStyle(
  fontFamily: 'ForsLight',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xFF08293F),
  height: 20 / 14, 
  letterSpacing: 0,

);


  TextStyle customTextStyle3 = const TextStyle(
    fontFamily: 'Fors',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xFFFAFAFC),
  );

  TextStyle customTextStyle4 = const TextStyle(
    fontFamily: 'Fors',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Color(0xFF4B56DB),
    decoration: TextDecoration.underline,
  );

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFFAFAFC),
          child: Stack(
            children: [
              // Background image
              Image.asset(
                'assets/images/_Layer_.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
              ),
              // Top images
              Positioned(
                top: 0.14 * MediaQuery.of(context).size.height,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/image1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 0.25 * MediaQuery.of(context).size.height,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/image2.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Stack for the icon in the top-left corner
              Stack(
                children: [
                  Positioned(
                    top: 20, 
                   right: 20, 
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 38, 36, 56),
                        size: 32,
                      ),
                          onPressed: () {
               
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoadingPage()),
                      );
                    },
                    ),
                  ),
    
            Padding(
              padding: EdgeInsets.only(top: 0.35 * MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset('assets/images/Vector.png'),
                          ),
                          SizedBox(width: 0.06 * MediaQuery.of(context).size.width),
                          Text(
                            'Renseigner votre taille & poids',
                            style: customTextStyle2,
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 0.03 * MediaQuery.of(context).size.height,
                    ),

                      Row(
                        children: [
                          SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
                          Image.asset('assets/images/mingcute_photo-album-fill.png'),
                          SizedBox(width: 0.04 * MediaQuery.of(context).size.width),
                          Text(
                            'Prendre deux photos',
                            style: customTextStyle2,
                          ),
                        ],
                      ),
                   SizedBox(
                    height: 0.03 * MediaQuery.of(context).size.height,
                  ),

                      Row(
                        children: [
                          SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
                          Image.asset('assets/images/mdi_tshirt-crew.png'),
                          SizedBox(width: 0.04 * MediaQuery.of(context).size.width),
                          Text(
                            'Obtenir le meilleur ajustement de taille',
                            style: customTextStyle2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 0.06 * MediaQuery.of(context).size.height),
               ElevatedButton(
                onPressed: isCheckboxChecked
                    ? () {
                       
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SexePage()),
                        );
                    }
                    : null, 
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF4B56DB),
                  minimumSize: Size(0.85 * MediaQuery.of(context).size.width, 60),
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Commencer', style: customTextStyle3),
              ),

                  SizedBox(height: 0.005 * MediaQuery.of(context).size.height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), 
                    child: Transform.scale(
                      scale: 1.25,
                      child: Checkbox(
                        value: isCheckboxChecked,
                        onChanged: (newValue) {
                          setState(() {
                            isCheckboxChecked = newValue ?? false;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width:5),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: RichText(
                            text: TextSpan(
                              style: customTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  text: "En sélectionnant cette option, j'accepte ",
                                ),
                                TextSpan(
                                  text: "la politique\nde confidentialité",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: " de Fitsize et nos conditions\nd'utilisation.",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ou', style: customTextStyle),
                    ],
                  ),
                  SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Créer un compte / Se connecter',
                          style: customTextStyle4,
                        ),
                      )
                    ],
                  ),
                   SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                 
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Line 2.png',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(22),
                        child: Text(
                          'Toutes les données sont cryptées dans les deux sens,\nsécurisées par SSL et ne sont jamais partagées avec qui\nque ce soit.',
                          style: customTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                   )
                   ],
                   ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
