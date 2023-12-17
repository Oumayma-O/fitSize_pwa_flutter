
import 'package:fitsize/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitsize/pages/AccueilPage.dart';
import 'package:fitsize/pages/PoidsPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:fitsize/pages/TaillePage.dart';
import 'package:fitsize/pages/TutorielEtape1Page.dart';


class ChoixScanPage extends StatefulWidget {
  final String selectedSexe;
  final String selectedTaille;
  final String selectedPoids;
  String selectedCard = "";
  String selectedChoix = "Seul(e)";

  ChoixScanPage({
    required this.selectedSexe,
    required this.selectedTaille,
    required this.selectedPoids,
  });

  @override
  _ChoixScanPageState createState() => _ChoixScanPageState();
}

class _ChoixScanPageState extends State<ChoixScanPage> {


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

  List<CardData> cardData = [
    CardData(
      svgIconPath: 'assets/iconSVG/selfie.svg',
      svgDarkIconPath: 'assets/iconSVG/selfieDark.svg',
      text: 'Seul(e)',
      isSelected: false,
    ),
    CardData(
      svgIconPath: 'assets/iconSVG/parAmi.svg',
      svgDarkIconPath: 'assets/iconSVG/parAmiDark.svg',
      text: 'Par un ami',
      isSelected: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    print("Selected Sexe from SexePage: ${widget.selectedSexe}");
    print("Selected Taille from TaillePage: ${widget.selectedTaille}");
    print("Selected Poids from PoidsPage: ${widget.selectedPoids}");
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07179),
        child:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only( top: MediaQuery.of(context).size.height*0.03199),
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
                            MaterialPageRoute(builder: (context) => AccueilPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.0379),
                Padding(
                  padding: EdgeInsets.only(left: widget.selectedSexe == 'Autres' ? 60 : 160),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFC0EDD8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height*0.0521,
                      //width: _containerWidth,
                      child: Row(
                        children: [
                          //SizedBox(width: 10),
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
                            child: const Icon(
                              Icons.edit,
                              color: Color(0xFF08293F),
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFC0EDD8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                      ),
                      height: 44,
                      width: 142,
                      child: Row(
                        children: [
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
                            child: const Icon(
                              Icons.edit,
                              color: Color(0xFF08293F),
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFC0EDD8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height*0.0521,
                      width: 132,
                      child: Row(
                        children: [
                          Padding(
                          padding: const EdgeInsets.only( left: 16,right: 8.0,top:12,bottom: 12),
                            child: Text(
                              'Je fais ${widget.selectedPoids}',
                              style: customTextStyle2,
                            ),
                          ),

                           GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => PoidsPage(
                                  selectedSexe: widget.selectedSexe,
                                  selectedTaille: widget.selectedTaille,
                                ),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Color(0xFF08293F),
                              size: 16,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.0331),
                Align(
                  alignment: Alignment.centerLeft,
                  child:  Text('Comment souhaitez vous être pris(e) en photo ?', style: customTextStyle),

                ),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerLeft,
                  child:  Text('Capturez vos mensurations en prenant une photo de face et de profil.', style: customTextStyle2),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.0568),


                    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: cardData.map((card) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.0205),
                    child: CardWidget(
                      card: card,
                      isSelected: card.text == widget.selectedChoix,
                      onTap: () {
                        _onCardSelected(card);
                      },
                    ),
                  );
                }).toList(),
              ),
            ],
          ),


           
          ),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.05687),
            child: MyButton(
              buttonText: 'Suivant',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                     TutorielEtape1Page(
                  selectedChoix: widget.selectedChoix,
                  selectedSexe: widget.selectedSexe, // Pass the selectedSexe here
                ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
    );
  }

  void _onCardSelected(CardData card) {
    setState(() {
      // Update the selectedChoix here
      widget.selectedChoix = card.text;
      for (var item in cardData) {
        item.isSelected = item.text == card.text;
      }
    });
  }
}

class CardData {
  final String svgIconPath;
  final String svgDarkIconPath;
  final String text;
  bool isSelected;

  CardData({
    required this.svgIconPath,
    required this.svgDarkIconPath,
    required this.text,
    this.isSelected = false,
  });
}

class CardWidget extends StatelessWidget {
  final CardData card;
  final bool isSelected;
  final VoidCallback? onTap; // Add the onTap parameter

  CardWidget({
    required this.card,
    required this.isSelected,
    this.onTap, // Add onTap to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width*0.3846,
        //height: MediaQuery.of(context).size.height*0.1184,
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.011848,horizontal: MediaQuery.of(context).size.width*0.025641),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Color.fromARGB(255, 8, 41, 63)
                : Color.fromARGB(255, 39, 33, 51),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected
              ? Color.fromARGB(255, 8, 41, 63)
              : Colors.white,
        ),
        child:  Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01421,top:MediaQuery.of(context).size.height*0.018957),
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height:MediaQuery.of(context).size.height*0.004),
            SvgPicture.asset(
              isSelected ? card.svgDarkIconPath : card.svgIconPath,
              width:  MediaQuery.of(context).size.width*0.0692,
              height:  MediaQuery.of(context).size.height*0.04739,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.011848),
            Text(
              card.text,
              style: TextStyle(
                fontFamily: 'ForsLight',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isSelected
                    ? Color.fromARGB(250, 215, 253, 0)
                    : Color.fromARGB(255, 8, 41, 63),
              ),
            ),
            //SizedBox(height: MediaQuery.of(context).size.height*0.004),
          ],
        ),
      ),
      ),
    );
  }
}
