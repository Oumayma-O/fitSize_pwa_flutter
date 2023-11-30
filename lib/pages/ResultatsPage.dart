import 'dart:async';

import 'package:fitsize/components/SizeCommponent.dart';
import 'package:fitsize/pages/Details2Page.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../services/data.service.dart';
import '../pages/AccueilPage.dart';
import '../widgets/MessageBubbleClipper.dart';
import 'DetailsPage.dart';
import 'LoginPage.dart';

class ResultatsPage extends StatefulWidget {
  @override
  _ResultatsPageState createState() => _ResultatsPageState();
}

class _ResultatsPageState extends State<ResultatsPage> {
  late String productImagePath =
      "img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg?w=1060&t=st=1700829312~exp=1700829912~hmac=4c259d7d1de30adeabe0de5a701daef6faa4d77927c73df468bee5bff0e35811";
  bool showFitBubble = true;
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _setDefaultSelectedSize();
  }

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
                        fit: BoxFit.cover,
                        height: screenSize.height * 0.65,
                        width: screenSize.width,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenSize.height * 0.03,
                    left: screenSize.width * 0.03,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 38, 36, 56),
                        size: screenSize.width * 0.08,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AccueilPage()),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: screenSize.height * 0.485,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height * 0.559,
                        decoration:  ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(screenSize.width * 0.06),
                              topRight: Radius.circular(screenSize.width * 0.06),
                            ),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: screenSize.width * 0.02,
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
                    top: screenSize.height * 0.5189,
                    child: Container(
                      width: screenSize.width * 0.8564,
                      //height: screenSize.height * 0.373,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF9F9FB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenSize.width * 0.04),
                        ),
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
                          horizontal: screenSize.width * 0.03,
                          vertical: screenSize.height * 0.0236,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  'Taille recommandée',
                                  style: TextStyle(
                                    color: Color(0xFF08293F),
                                    fontSize: screenSize.width * 0.05,
                                    fontFamily: 'TT Fors Trial',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(width: screenSize.width * 0.1282),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Image.asset(
                                        'images/Group_468.png',
                                      ),
                                      onPressed: () {
                                        Navigator.of(context!).push(
                                          MaterialPageRoute(
                                            builder: (context) => Details2Page(),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: screenSize.height * 0.035,),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * 0.01,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        ...sizeDescription.keys.map((key) {
                                          final isSelected = selectedSize == key;

                                          return isSelected
                                              ? ChatBubble(
                                            text: "Fit ${(sizeValues[selectedSizeKey] ?? 0) * 100}%",
                                            width: selectedSizeKey == perfectFit
                                                ? screenSize.width * 0.3
                                                : screenSize.width * 0.22,
                                            height: selectedSizeKey == perfectFit
                                                ? screenSize.height * 0.0568
                                                : screenSize.height * 0.03696,
                                            color: Color(0xFF1CE496),
                                          )
                                              : Expanded(
                                            child: SizedBox(
                                              height: screenSize.height * 0.0568 + 9,
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.height * 0.01184),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ...sizeDescription.keys.map((key) {
                                          final isSelected = selectedSize == key;

                                          return SizeComponent(
                                            title: key,
                                            description: sizeDescription[key]!,
                                            isSelected: isSelected,
                                            onTap: () {
                                              setState(() {
                                                selectedSize = key;
                                              });
                                            },
                                            perfectFit: perfectFit == key,
                                          );
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.02,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Taille basée sur le référentiel de la boutique',
                                  style: TextStyle(
                                    color: Color(0xFF08293F),
                                    fontSize: screenSize.width * 0.035,
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
                  Positioned(
                    bottom: screenSize.height * 0.0236,
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
