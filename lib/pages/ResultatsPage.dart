import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../pages/AccueilPage.dart';

class ResultatsPage extends StatefulWidget {
  @override
  _ResultatsPageState createState() => _ResultatsPageState();
}

class _ResultatsPageState extends State<ResultatsPage> {
  Map<String, String> sizeValues = {
    'M': 'Serré',
    'L': 'Ajustement idéal',
    'XL': 'Ample',
  };

  String selectedSize = "L";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Image.asset(
                        'assets/images/Jupe.png',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 16,
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
                  Positioned(
                    top: 372,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      child:Container(
                      width: MediaQuery.of(context).size.width,
                      height: 472,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22),
                          ),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 10,
                            offset: Offset(-1, -1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      // Your content goes here
                    ),
                    ),
                  ),

              Positioned(
                top: 392,
                //left: 90,
                child: GestureDetector(
                    child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11,vertical: 11),
                      child: Container(
                      width: 211,
                      height: 42,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF4F4F4),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFD1D1D1)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Sauvegarder votre scan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF505056),
                              fontSize: 14,
                              fontFamily: 'TT Fors Trial',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          SizedBox(width: 8,),
                          Image.asset(
                              'images/mingcute_user-4-fill.png'
                          ),
                        ],
                      ),
                    ),  )
                  ),
              ),

              Positioned(
                top: 460,
                //left: 90,
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child:  Container(
                width: 334,
                height: 293,
                decoration: ShapeDecoration(
                  color: Color(0xFFF9F9FB),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 11,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),

                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                     Row (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                          'Taille recommandé',
                          style: TextStyle(
                            color: Color(0xFF08293F),
                            fontSize: 16,
                            fontFamily: 'TT Fors Trial',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                          const SizedBox(width: 12,),
                          Image.asset(
                              'images/Group_468.png'
                          ),

                        ],
                      ),
                      SizedBox(height: 97,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: sizeValues.keys.map((key) {
                                final isSelected = selectedSize == key;
                                final buttonWidth = isSelected ? 112.0 : 94.0;
                                final buttonHeight = isSelected ? 80.0 : 74.0;
                                final buttonColor = isSelected
                                    ? const Color(0xFF08293F)
                                    : const Color(0xFFF4F4F4);

                                final onPrimaryColor = isSelected
                                    ? const Color(0xFF08293F)
                                    : const Color(0xFFF4F4F4);

                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedSize = key;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: buttonColor,
                                      onPrimary: onPrimaryColor,
                                      minimumSize: Size(buttonWidth, buttonHeight),
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        side: BorderSide(
                                          color: isSelected
                                              ? const Color(0xFF08293F)
                                              : const Color(0xFFF4F4F4),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          key,
                                          style: TextStyle(
                                            color: selectedSize == key
                                                ? const Color(0xFFD8FD00)
                                                : const Color(0xFF08293F),
                                            fontFamily: 'Fors',
                                            fontSize: selectedSize == key ? 30 : 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        //SizedBox(height: 7),
                                        SizedBox(
                                          width: isSelected ? 80 : 74,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            sizeValues[key]!,
                                              style: TextStyle(
                                                color: selectedSize == key
                                                    ? const Color(0xFFD8FD00)
                                                    : const Color(0xFF505056),
                                                fontSize: 14,
                                                fontFamily: 'TT Fors Trial',
                                                fontWeight: FontWeight.w400,
                                                //height: 0.09,
                                              ),
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),

                        ],
                      ),
                      const SizedBox(height: 35,),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Taille basée sur le référentiel de la boutique',
                              style: TextStyle(
                                color: Color(0xFF08293F),
                                fontSize: 13,
                                fontFamily: 'TT Fors Trial',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),

                    ],
                  ),
              ),
                ),
              ),

              /*Positioned(
                top: 601,
                left: 40,
                right: 40,
                child:
              ),*/



                  Positioned(
                    bottom: 20,
                    child: MyButton(
                      onTap: () {
                        // Your onTap logic here
                      },
                      buttonText: "Retour à l'article",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
