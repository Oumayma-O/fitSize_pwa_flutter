import 'dart:async';

import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../data.service.dart';
import '../pages/AccueilPage.dart';
import '../widgets/MessageBubbleClipper.dart';
import 'DetailsPage.dart';
import 'LoginPage.dart';

class ResultatsPage extends StatefulWidget {

  @override
  _ResultatsPageState createState() => _ResultatsPageState();
}

class _ResultatsPageState extends State<ResultatsPage> {
  late String productImagePath = "img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg?w=1060&t=st=1700829312~exp=1700829912~hmac=4c259d7d1de30adeabe0de5a701daef6faa4d77927c73df468bee5bff0e35811";
  bool showFitBubble = true;
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _setDefaultSelectedSize();
    WidgetsBinding.instance!.addPostFrameCallback((_) =>_showFitPercentageBubble(context));
  }

 /* void _initOverlay() {
    final overlay = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => _buildOverlayContent(context),
    );

    overlay.insert(overlayEntry!);
  }*/

  Future<void> _fetchData() async {
    final dataService = DataService();

    try {
      final productImagePath = await dataService.getProductImagePath();

      if (productImagePath != null) {
        setState(() {
          this.productImagePath = productImagePath;
        });
      } else {
        this.productImagePath = 'assets/images/Jupe.png';
      }
    } catch (e) {
      // Handle exceptions
    }
  }

  /*@override
  void dispose() {
    // Remove the overlay when the page is disposed
    overlay?.remove();
    super.dispose();
  }*/

  Map<String, String> sizeDescription = {
    'M': 'Serré',
    'L': 'Ajustement idéal',
    'XL': 'Ample',
  };

  Map<String, double> sizeValues = {
    "M": 0.67,
    "L": 0.98,
    "XL": 0.90,
  };

  String selectedSize = "";
  String perfectFit = "";

  void _setDefaultSelectedSize() {
    double maxValue = double.minPositive;

    sizeValues.forEach((key, value) {
      if (value > maxValue) {
        maxValue = value;
        setState(() {
          perfectFit = key;
          selectedSize = key;
        });
      }
    });
  }

  String selectedSizeKey = "";


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    selectedSizeKey = selectedSize;

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
                      child: Image.network(
                        'https://$productImagePath',
                        // Assuming productImagePath is a valid URL
                        fit: BoxFit.cover,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.65,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
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
                          MaterialPageRoute(builder: (context) =>
                              AccueilPage()),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: screenSize.height*0.485,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: screenSize.height*0.559,
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

                  /*Positioned(
                top: 392,
                //left: 90,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
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
                    ),
                    ),
                  ),
              ),*/

                  Positioned(
                    top: screenSize.height*0.5189,
                    //left: 90,
                    child: Container(
                      width: screenSize.width*0.8564,
                      height: screenSize.height*0.373,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF9F9FB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 11,
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),

                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width*0.03, vertical: screenSize.height*0.0236),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //SizedBox(height: 20,),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text(
                                    'Taille recommandé',
                                    style: TextStyle(
                                      color: Color(0xFF08293F),
                                      fontSize: 16,
                                      fontFamily: 'TT Fors Trial',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  ],
                                ),

                                SizedBox(width: screenSize.width*0.1282,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Image.asset(
                                        'images/Group_468.png',
                                        //width: 24.0,
                                        //height: 24.0,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context!).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsPage(
                                                      isMetricStandard: true)),
                                        );
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: screenSize.height*0.1149,),


                            //SizedBox(height:selectedSizeKey == perfectFit ? 24 : 16,),

                            Container(
                              //height: 95,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: sizeDescription.keys.map((key) {
                                  final isSelected = selectedSize == key;
                                   var buttonWidth = key == perfectFit
                                      ? screenSize.width*0.287
                                      : screenSize.width*0.238;
                                   var buttonHeight = key == perfectFit
                                      ? screenSize.height*0.094
                                      : screenSize.height*0.0876;
                                  final buttonColor = isSelected
                                      ? const Color(0xFF08293F)
                                      : const Color(0xFFE5E6E9);

                                  final onPrimaryColor = isSelected
                                      ? const Color(0xFF08293F)
                                      : const Color(0xFFE5E6E9);

                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenSize.width*0.01),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedSize = key;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: buttonColor,
                                        onPrimary: onPrimaryColor,
                                        minimumSize: Size(
                                            buttonWidth, buttonHeight),
                                        padding: EdgeInsets.only(bottom: 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8.0),
                                          side: BorderSide(
                                            color: isSelected
                                                ? const Color(0xFF08293F)
                                                : const Color(0xFFE5E6E9),
                                            width: 1.0,
                                          ),
                                        ),
                                        elevation: isSelected ? 5 : 0,

                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height*0.00473, bottom: screenSize.height*0.01184),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              key,
                                              style: TextStyle(
                                                color: selectedSize == key
                                                    ? const Color(0xFFD8FD00)
                                                    : const Color(0xFF08293F),
                                                fontFamily: 'Fors',
                                                fontSize: key == perfectFit
                                                    ? 30
                                                    : 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            //SizedBox(height: 7),
                                            SizedBox(
                                              width: isSelected ? screenSize.width*0.2051 : screenSize.width*0.1897,
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                sizeDescription[key]!,
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
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),


                            SizedBox(height: screenSize.height*0.0296,),
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
                    //bottom: selectedSizeKey == perfectFit ? 48 : 31.20,
                    top:selectedSizeKey == perfectFit ? 518 : 550,
                    left:(selectedSizeKey == 'M')
                        ? 50
                        : (selectedSizeKey == 'L')
                        ? 135
                        : 258,
                    /*right:selectedSizeKey == 'M'
                        ? MainAxisAlignment.start
                        : (selectedSizeKey == 'L'
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.end),*/
                    child:
                      ChatBubble(
                        text: "Fit ${(sizeValues[selectedSizeKey] ?? 0) * 100}%",
                        width: selectedSizeKey == perfectFit ? MediaQuery
                              .of(context)
                              .size
                              .width*0.307 :MediaQuery
                              .of(context)
                              .size
                              .width*0.2,
                          height: selectedSizeKey == perfectFit ? MediaQuery
                              .of(context)
                              .size
                              .height*0.0568 : MediaQuery
                              .of(context)
                              .size
                              .height*0.03696,
                        color: Color(0xFF1CE496),
                      ),

            ),

                  Positioned(
                    bottom: screenSize.height*0.0236,
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

  void _showFitPercentageBubble(BuildContext context) {
    final overlay = Overlay.of(context);

    if (overlayEntry != null) {
      overlayEntry!.remove();
    }

    final RenderBox renderBox = context.findRenderObject() as RenderBox;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        // Adjust the top and left values as needed based on your layout
        top: renderBox.localToGlobal(Offset(0, -60)).dy,
        left: renderBox.localToGlobal(Offset(0, 0)).dx,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: selectedSizeKey == perfectFit ? MediaQuery
                .of(context)
                .size
                .width*0.307 :MediaQuery
                .of(context)
                .size
                .width*0.2,
            height: selectedSizeKey == perfectFit ? MediaQuery
                .of(context)
                .size
                .height*0.0568 : MediaQuery
                .of(context)
                .size
                .height*0.03696,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Color(0xFF1CE496),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                "Fit ${(sizeValues[selectedSizeKey] ?? 0) * 100}%",
                style: const TextStyle(
                  color: Color(0xFF08293F),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry!);

    // You may want to set a timer to remove the overlay after a certain duration
    Timer(Duration(seconds: 2), () {
      if (overlayEntry != null) {
        overlayEntry!.remove();
      }
    });
  }


  Widget _buildOverlayContent(BuildContext context) {
  final RenderBox renderBox = context.findRenderObject() as RenderBox;
  double initialTop = 0.0;
  double initialLeft = 0.0;

  if (selectedSizeKey == perfectFit) {
    // Calculate initial position based on the default selected button
    initialTop = renderBox.localToGlobal(Offset(0, -60)).dy;
    initialLeft = renderBox.localToGlobal(Offset(0, 0)).dx;
  }

  return Positioned(
    top: initialTop,
    left: initialLeft,
    child: Material(
      color: Colors.transparent,
      child: Container(
        width: selectedSizeKey == perfectFit ? MediaQuery
            .of(context)
            .size
            .width*0.307 :MediaQuery
            .of(context)
            .size
            .width*0.2,
        height: selectedSizeKey == perfectFit ? MediaQuery
            .of(context)
            .size
            .height*0.0568 : MediaQuery
            .of(context)
            .size
            .height*0.03696,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: Color(0xFF1CE496),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            "Fit ${(sizeValues[selectedSizeKey] ?? 0) * 100}%",
            style: const TextStyle(
              color: Color(0xFF08293F),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
      ),
    ),
  );
}
}
