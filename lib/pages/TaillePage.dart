import 'package:flutter/material.dart';
import 'package:fitsize/pages/LoadingPage.dart';
import 'package:fitsize/pages/PoidsPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:fitsize/widgets/PrecedentButton.dart';
import 'package:fitsize/widgets/SuivantButton.dart';

class TaillePage extends StatefulWidget {
  final String selectedSexe;

  TaillePage({required this.selectedSexe});

  @override
  _TaillePageState createState() => _TaillePageState();
}

class _TaillePageState extends State<TaillePage> {
  String selectedUnit = "Cm";
  int taille = 180;

  double _containerWidth = 180;

  @override
  void initState() {
    super.initState();
    if (selectedUnit == "In") {
      taille = 66;
    }
  }

  String _getSelectedSexe() {
    switch (widget.selectedSexe) {
      case 'Homme':
        _containerWidth = 180;
        return "Je suis un homme";
      case 'Femme':
        _containerWidth = 180;
        return "Je suis une femme";
      case 'Autres':
        _containerWidth = 280;
        return "Je suis une personne non binaire";
      default:
        _containerWidth = 180;
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFC),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color(0xFF262438),
                        size: 32,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoadingPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFC0EDD8),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  _getSelectedSexe(),
                                  style: customTextStyle2,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => SexePage()),
                                  );
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Color(0xFF08293F),
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                          height: 40,
                          width: _containerWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text('Quelle taille faites-vous ?', style: customTextStyle),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text('Cela nous permet de mieux concevoir votre profil', style: customTextStyle2),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 41, 63),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          taille.toString(),
                          style: customTextStyle5,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            ((taille ~/ 10) * 10 - 10).toString(),
                            style: customTextStyle6,
                          ),
                          Spacer(),
                          Text(
                            ((taille ~/ 10) * 10 + 10).toString(),
                            style: customTextStyle6,
                          ),
                        ],
                      ),
                    ),
               

                        Container(
                            width: double.infinity, 
                            child: Center(
                              child: GestureDetector(
                                onHorizontalDragUpdate: (details) {
                                  setState(() {
                                    if (details.primaryDelta! > 0) {
                                      if (taille > 1) {
                                        taille--;
                                      }
                                    } else if (details.primaryDelta! < 0) {
                                      if (taille < 250) {
                                        taille++;
                                      }
                                    }
                                  });
                                },
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/boxwhite.png',
                                  width: 490,
                                  height: 100,
                                ),
                                Positioned(
                                  top: -15,
                                  left: 11,
                                  right:11,
                                  child: Image.asset('assets/images/image3.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),



                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedUnit = "Cm";
                              taille = 170;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedUnit == "Cm" ? Color.fromARGB(255, 8, 41, 63) : Colors.white,
                            onPrimary: selectedUnit == "Cm" ? Color.fromARGB(220, 215, 253, 0) : Color.fromARGB(255, 8, 41, 63),
                            minimumSize: Size(70, 50),
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: selectedUnit == "Cm" ? Color.fromARGB(255, 8, 41, 63) : Color.fromARGB(255, 8, 41, 63),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            'Cm',
                            style: TextStyle(
                              fontFamily: 'Fors',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedUnit = "In";
                              taille = 66;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedUnit == "In" ? Color.fromARGB(255, 8, 41, 63) : Colors.white,
                            onPrimary: selectedUnit == "In" ? Color.fromARGB(220, 215, 253, 0) : Color.fromARGB(255, 8, 41, 63),
                            minimumSize: Size(70, 50),
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: selectedUnit == "In" ? Color.fromARGB(255, 8, 41, 63) : Color.fromARGB(255, 8, 41, 63),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            'In',
                            style: TextStyle(
                              fontFamily: 'Fors',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrecedentButton(
                  buttonText: 'Précédent',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 10),
                SuivantButton(
                  buttonText: 'Suivant',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PoidsPage(
                          selectedTaille: '$taille $selectedUnit',
                          selectedSexe: widget.selectedSexe,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final TextStyle customTextStyle3 = TextStyle(
    fontFamily: 'Fors',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xFFFAFAFC),
  );

  final TextStyle customTextStyle4 = TextStyle(
    fontFamily: 'Fors',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xFF4B56DB),
  );

  final TextStyle customTextStyle = TextStyle(
    fontFamily: 'Fors',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Color(0xFF08293F),
  );

  final TextStyle customTextStyle2 = TextStyle(
    fontFamily: 'ForsLight',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF08293F),
  );

  final TextStyle customTextStyle5 = TextStyle(
    fontFamily: 'ForsLight',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(220, 215, 253, 0),
  );

  final TextStyle customTextStyle6 = TextStyle(
    fontFamily: 'ForsLight',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Color(0xFF989DA0),
  );
}
