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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final textScaleFactor = MediaQuery
        .of(context)
        .textScaleFactor;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Accueil.png"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.07179),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double spacing = constraints.maxHeight * 0.05;

              return// ...

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenSize.height * 0.13),
                    Column(
                      children: [
                        Image.asset("images/fit_shop.png"),
                        SizedBox(height: screenSize.height * 0.0234),
                        // Responsive spacing
                        Image.asset("images/by_fitsize.png"),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.0829),
                    // Responsive spacing
                    Column(
                      children: [
                        _buildRowWithTextAndStyle(context,
                          "images/mdi_human-male-height.png",
                          "Renseigner votre taille & poids",
                          textPadding: EdgeInsets.only(
                              left: screenSize.width * 0.05128),
                          textStyle: TextStyle(
                            color: Color(0xFF08293F),
                            fontSize: 14 * textScaleFactor,
                            // Responsive font size
                            fontFamily: 'TT Fors Trial',
                            fontWeight: FontWeight.w400,
                            height: 1.5, // Adjust line height for wrapping
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.028),
                        // Responsive spacing
                        _buildRowWithTextAndStyle(context,
                          "assets/images/mingcute_photo-album-fill.png",
                          "Prendre deux photos",
                          textPadding: EdgeInsets.only(
                              left: screenSize.width * 0.05128),
                          textStyle: TextStyle(
                            color: Color(0xFF08293F),
                            fontSize: 14 * textScaleFactor,
                            // Responsive font size
                            fontFamily: 'TT Fors Trial',
                            fontWeight: FontWeight.w400,
                            height: 1.5, // Adjust line height for wrapping
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.028),
                        // Responsive spacing
                        _buildRowWithTextAndStyle(context,
                          "assets/images/mdi_tshirt-crew.png",
                          "Obtenir le meilleur ajustement de taille",
                          textPadding: EdgeInsets.only(
                              left: screenSize.width * 0.05128),
                          textStyle: TextStyle(
                            color: Color(0xFF08293F),
                            fontSize: 14 * textScaleFactor,
                            // Responsive font size
                            fontFamily: 'TT Fors Trial',
                            fontWeight: FontWeight.w400,
                            height: 1.5, // Adjust line height for wrapping
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.071),
                    // Responsive spacing
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: Size(screenSize.width * 0.8564, 50),
                      ),
                      child: Text(
                        "Commencer",
                        style: TextStyle(
                          fontFamily: 'TT Fors Trial',
                          fontWeight: FontWeight.w400,
                          fontSize: 16 * textScaleFactor,
                          // Responsive font size
                          color: Colors.white,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.028),
                    // Responsive spacing
                    Row(
                      children: [
                        //Checkbox(value: false, onChanged: (bool? value) {}),
                        Theme(
                          data: Theme.of(context).copyWith(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              side: const BorderSide(
                                width: 1.0, // Adjust the border width
                              ),
                            ),
                          ),
                          child: ClipRRect(
                            //borderRadius: BorderRadius.circular(20.0),
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
                        ),
                        SizedBox(width: screenSize.width * 0.03),
                        Expanded(
                          child: Text(
                            "En sélectionnant cette option, j'accepte la politique de confidentialité de Fitsize et nos conditions d'utilisation.",
                            style: TextStyle(
                              color: Color(0xFF08293F),
                              fontSize: 12 * textScaleFactor,
                              // Responsive font size
                              fontFamily: 'TT Fors Trial',
                              fontWeight: FontWeight.w400,
                              height: 1.5, // Adjust line height for wrapping
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.0189),
                    const Text("ou"),
                    SizedBox(height: screenSize.height * 0.029),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        "Créer un compte / Se connecter",
                        style: TextStyle(
                          color: Color(0xFF4B56DB),
                          fontSize: 12 * textScaleFactor,
                          fontFamily: 'TT Fors Trial',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          // Adjust line height for wrapping
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.0438),
                    // Responsive spacing
                    const Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                    SizedBox(height: screenSize.height * 0.0221),
                    // Responsive spacing
                    Opacity(
                      opacity: 0.70,
                      child: Text(
                        "Toutes les données sont cryptées dans les deux sens, sécurisées par SSL et ne sont jamais partagées avec qui que ce soit.",
                        style: TextStyle(
                          color: Color(0xFF08293F),
                          fontSize: 12 * textScaleFactor,
                          // Responsive font size
                          fontFamily: 'TT Fors Trial',
                          fontWeight: FontWeight.w400,
                          height: 1.5, // Adjust line height for wrapping
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                  ],
                );


            },
          ),
        ),
      ),
    );
  }
  Widget _buildRowWithTextAndStyle(BuildContext context,
      String imagePath,
      String text, {
        TextStyle? textStyle,
        EdgeInsets? textPadding,
      }) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Row(
        children: [
          Image.asset(imagePath),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: textPadding ?? EdgeInsets.all(8),
              child: Text(
                text,
                style: textStyle ?? const TextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
