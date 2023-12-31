import 'package:fitsize/pages/LoadingPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:flutter/material.dart';

import '../services/data.service.dart';
import 'LoginPage.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  bool isCheckboxChecked = false;
  late String logoPath="http://fit-size.com/fitshop/img/logo-1693983394.jpg";

  @override
  void initState() {
    super.initState();
    _fetchLogoPath();
  }

  Future<void> _fetchLogoPath() async {
    final logoService = DataService();

    try {
      final path = await logoService.getLogoPath();
      if (path != null) {
        setState(() {
          logoPath = path;
        });
      } else {
        // Handle the case where the API call fails
      }
    } catch (e) {
      // Handle exceptions
    }
  }



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
              image: AssetImage("images/Accueil.png"),
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
                        Image.network(logoPath,
                          height: screenSize.height * 0.0663,
                          width: screenSize.width*0.366,),
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
                          textPadding: const EdgeInsets.only(
                              ),
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
                          textPadding: const EdgeInsets.only(
                              ),
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
                          textPadding: const EdgeInsets.only(
                              ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                            child: Transform.scale(
                              scale: 1.25,
                              //alignment: Alignment.topLeft, // Align the top border with the top of the text
                              child: Checkbox(
                                value: isCheckboxChecked,
                                onChanged: (newValue) {
                                  setState(() {
                                    isCheckboxChecked = newValue ?? false;
                                  });
                                },
                              ),
                            ),
                          ),],
                        ),

                        SizedBox(width: screenSize.width * 0.03),

                            Expanded(
                              child: Text(
                                "En sélectionnant cette option, j'accepte la politique de confidentialité de Fitsize et nos conditions d'utilisation.",
                                style: TextStyle(
                                  color: Color(0xFF08293F),
                                  fontSize: 12 * textScaleFactor,
                                  fontFamily: 'TT Fors Trial',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
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
           SizedBox(width: MediaQuery
               .of(context)
               .size.width*0.041),
          Expanded(
            child: Padding(
              padding: textPadding ?? EdgeInsets.only(top:MediaQuery
                  .of(context)
                  .size.height*0.009478 ,bottom: MediaQuery
                  .of(context)
                  .size.width*0.004739),
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
