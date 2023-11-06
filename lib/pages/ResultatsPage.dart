import 'package:fitsize/pages/AccueilPage.dart';
import 'package:flutter/material.dart';
import 'package:fitsize/widgets/PrecedentButton.dart';
import 'package:fitsize/widgets/SuivantButton.dart';

class ResultatsPage extends StatefulWidget {
  @override
  _ResultatsPageState createState() => _ResultatsPageState();
}

class _ResultatsPageState extends State<ResultatsPage> {
  Map<String, double> sizeValues = {
    "M": 0.80,
    "L": 0.90,
    "XL": 0.99,
  };

  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
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
                        width: MediaQuery.of(context).size.height * 0.6,
                      ),
                    ),
                  ),
                 Positioned(
                    top: 8,
                    left: 320,
                    right: 0,
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
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.61,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 128, 
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(64.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                 
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 8, 41, 63),
                            minimumSize: Size(128, 59),
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(64.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center, 
                            children: [
                              Text(
                                "Fit ${(sizeValues[selectedSize] ?? 0) * 100}%",
                                style: TextStyle(
                                  fontFamily: 'Fors',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 5), 
                              Image.asset('assets/images/Group 117.png'), 
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.67,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: sizeValues.keys.map((key) {
                          final isSelected = selectedSize == key;
                       final buttonColor = isSelected
                        ? Color(0xFFC0EDD8)
                        : Color(0xFFF0F5F8);

                      final onPrimaryColor = isSelected
                        ? Color(0xFF08293F)
                        : Color(0xFF989DA0);


                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedSize = key;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: buttonColor,
                                onPrimary: onPrimaryColor,
                                minimumSize: Size(101, 48),
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                    color: isSelected
                                        ? Color(0xFF08293F)
                                        :Color(0xFF989DA0),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                key,
                                style: TextStyle(
                                  fontFamily: 'Fors',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.83,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrecedentButton(
                              buttonText: "Détail des mensurations",
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AccueilPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SuivantButton(
                              buttonText: "Retour à l’article",
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AccueilPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
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
