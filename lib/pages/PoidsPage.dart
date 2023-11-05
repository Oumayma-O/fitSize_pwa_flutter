import 'package:flutter/material.dart';
import 'package:fitsize/pages/ChoixScanPage.dart';
import 'package:fitsize/pages/LoadingPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:fitsize/pages/TaillePage.dart';
import 'package:fitsize/widgets/SuivantButton.dart';

class PoidsPage extends StatefulWidget {
  final String selectedSexe;
  final String selectedTaille;

  PoidsPage({required this.selectedSexe, required this.selectedTaille});

  @override
  _PoidsPageState createState() => _PoidsPageState();
}

class _PoidsPageState extends State<PoidsPage> {
  String selectedUnit = "Kg";
  int poids = 85;
  bool isDragging = false;

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
    color: Color.fromARGB(255, 215, 253, 0),
  );

  final TextStyle customTextStyle6 = TextStyle(
    fontFamily: 'ForsLight',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Color(0xFF989DA0),
  );

  @override
  void initState() {
    super.initState();
    print("Selected Sexe from SexePage: ${widget.selectedSexe}");
    print("Selected Taille from TaillePage: ${widget.selectedTaille}");
    if (selectedUnit == "Ib") {
      poids = 187;
    }
  }

  double _containerWidth = 180;

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
                padding: EdgeInsets.only(left: 10, right: 20, top: 30),
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
              SizedBox(height: 30),
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
                            'Je fais ${widget.selectedTaille}',
                            style: customTextStyle2,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => TaillePage(selectedSexe: widget.selectedSexe)),
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
                    width: 160,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text('Quel poids faites-vous ?', style: customTextStyle),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text('Cela nous permet de mieux concevoir votre profil', style: customTextStyle2),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 8, 41, 63),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      poids.toString(), 
                      style: customTextStyle5,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  children: [
                    Text(
                      (poids - 10).toString(),
                      style: customTextStyle6,
                    ),
                    Spacer(),
                    Text(
                      (poids - 5).toString(),
                      style: customTextStyle6,
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text(
                      (poids + 5).toString(),
                      style: customTextStyle6,
                    ),
                    Spacer(),
                    Text(
                      (poids + 10).toString(),
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
                          if (poids > 1) {
                            poids--;
                          }
                        } else if (details.primaryDelta! < 0) {
                          if (poids < 250) {
                            poids++;
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
                          top: -18,
                          left: 11,
                          right: 11,
                          child: Image.asset('assets/images/Groupregle2.png'),
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
                        selectedUnit = "Kg";
                        poids = 170;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedUnit == "Kg" ? Color.fromARGB(255, 8, 41, 63) : Colors.white,
                      onPrimary: selectedUnit == "Kg" ? Color.fromARGB(255, 215, 253, 0) : Color.fromARGB(255, 8, 41, 63),
                      minimumSize: Size(90, 50),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: selectedUnit == "Kg" ? Color.fromARGB(255, 8, 41, 63) : Color.fromARGB(255, 8, 41, 63),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Kg',
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
                        selectedUnit = "Ib";
                        poids = 154;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedUnit == "Ib" ? Color.fromARGB(255, 8, 41, 63) : Colors.white,
                      onPrimary: selectedUnit == "Ib" ? Color.fromARGB(255, 215, 253, 0) : Color.fromARGB(255, 8, 41, 63),
                     minimumSize: Size(90, 50),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: selectedUnit == "Ib" ? Color.fromARGB(255, 8, 41, 63) : Color.fromARGB(255, 8, 41, 63),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Ib',
                      style: TextStyle(
                        fontFamily: 'Fors',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 9),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               
                Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: SuivantButton(
                    buttonText: 'Suivant',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChoixScanPage( 
                          selectedPoids: '$poids $selectedUnit',
                          selectedTaille: widget.selectedTaille,
                          selectedSexe: widget.selectedSexe,),
                        ),
                      );
                    },
                  ),
                ),
        
              ],
            ),
          ),
        ],
      ),
    );
  }
}
