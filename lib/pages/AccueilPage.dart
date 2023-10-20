import 'package:flutter/material.dart';

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
    color: Color.fromARGB(255, 60, 60, 60),
  );

  TextStyle customTextStyle2 = TextStyle(
    fontFamily: 'ForsLight',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 60, 60, 60),
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
      body: Container(
        color: Color(0xFFFFFFFF),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                  Positioned(
                    top: -20, // Adjust the top position as needed
                    left: 0,
                    right: 0,
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: Image.asset(
                        'assets/images/_Layer_.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                    Positioned(
                      top: 0.1 * MediaQuery.of(context).size.height,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'assets/images/image1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.2* MediaQuery.of(context).size.height,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'assets/images/image2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Padding(
              padding: EdgeInsets.only(bottom: 150.0),
              child: Container(
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
                              child: Image.asset('assets/images/vector.png'),
                            ),
                            SizedBox(width: 0.06 * MediaQuery.of(context).size.width),
                            Text(
                              'Renseigner votre taille & poids',
                              style: customTextStyle2,
                            ),
                          ],
                        ),
                        SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
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
                        SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
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
                    SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                    ElevatedButton(
                      onPressed: () {
                        // Add your button's onPressed logic here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF4B56DB),
                        minimumSize: Size(0.8 * MediaQuery.of(context).size.width, 50),
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text('Commencer', style: customTextStyle3),
                    ),
                    SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isCheckboxChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isCheckboxChecked = newValue ?? false;
                            });
                          },
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 22),
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
                    SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ou', style: customTextStyle2),
                      ],
                    ),
                    SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Add your link's onPressed logic here
                          },
                          child: Text(
                            'Créer un compte / Se connecter',
                            style: customTextStyle4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    Image.asset(
                      'assets/images/Line 2.png',
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Toutes les données sont cryptées dans les deux sens,\nsécurisées par SSL et ne sont jamais partagées avec qui\nque ce soit.',
                        style: customTextStyle,
                      ),
                    ),
                  SizedBox(height: 15),
                  ],
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
