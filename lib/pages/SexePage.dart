import 'package:fitsize/components/my_button.dart';
import 'package:fitsize/pages/AccueilPage.dart';
import 'package:fitsize/pages/TaillePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class SexePage extends StatefulWidget {
  late final String? selectedSexe;

  @override
  _SexePageState createState() => _SexePageState();
}



class _SexePageState extends State<SexePage> {
  String selectedCard = "";
  String selectedSexe = "Homme";



  List<CardData> cardData = [
    CardData(
      svgIconPath: 'assets/iconSVG/icon_man.svg',
      svgDarkIconPath: 'assets/iconSVG/icon_manDark.svg',
      text: 'Homme',
      isSelected: true,
    ),
    CardData(
      svgIconPath: 'assets/iconSVG/icon_woman.svg',
      svgDarkIconPath: 'assets/iconSVG/icon_womanDark.svg',
      text: 'Femme',
      isSelected: false,
    ),
    CardData(
      svgIconPath: 'assets/iconSVG/basil_other-1-outline.svg',
      svgDarkIconPath: 'assets/iconSVG/basil_other-1-outlineDark.svg',
      text: 'Autres',
      isSelected: false,
    ),
  ];

  final TextStyle customTextStyle3 = const TextStyle(
    fontFamily: 'Fors',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xFFFAFAFC),
  );
final TextStyle customTextStyle = const TextStyle(
  fontFamily: 'Fors',
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Color(0xFF08293F),
);

final TextStyle customTextStyle2 = const TextStyle(
  fontFamily: 'ForsLight',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xFF08293F),
);


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
     backgroundColor: Color(0xFFFAFAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(left:screenSize.width*0.05897,right:screenSize.width*0.07179,top: screenSize.height*0.03554),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            Align(
            alignment: Alignment.centerLeft,
              child:IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 38, 36, 56), size: 30),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),),
                Spacer(),
                IconButton(
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
              ],
            ),
          ),

          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.0717),
                child: Column(

                children: <Widget>[
                  SizedBox(height:screenSize.height*0.07582),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Quel est votre sexe ?', style: customTextStyle),

                  ),
                  SizedBox(height: screenSize.height*0.004739),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Text('Cela me permet de mieux concevoir votre profil', style: customTextStyle2),

                  ),
                  SizedBox(height: screenSize.height*0.02369),


                  CardList(cardData: cardData, onCardSelected: _onCardSelected),


                ],
              ),
    ),
          ),


          Padding(
            padding: EdgeInsets.only(bottom: screenSize.height*0.0568),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:
              MyButton(
            buttonText: 'Suivant',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TaillePage(selectedSexe: selectedSexe),
                ),
              );
            },
          ),

            ),

          ),

          //SizedBox(height: 20),
        ],

    ),
    );
  }


void _onCardSelected(CardData card) {
  setState(() {
    selectedCard = card.text;
    selectedSexe = card.text;
    for (var item in cardData) {
      item.isSelected = item.text == selectedCard;
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

  CardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    final textScaleFactor = MediaQuery
        .of(context)
        .textScaleFactor;

    return Container(
      width: screenSize.width * 100/390,
      padding: EdgeInsets.symmetric(vertical:screenSize.height *10/844 ,horizontal:screenSize.width* 10/390),
      decoration: BoxDecoration(
        border: Border.all(
            color: card.isSelected
                ? Color.fromARGB(255, 8, 41, 63)
                : Color.fromARGB(255, 39, 33, 51),
            width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
        color: card.isSelected
            ? Color.fromARGB(255, 8, 41, 63)
            : Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: screenSize.height* 8/844),
          SvgPicture.asset(
            card.isSelected ? card.svgIconPath : card.svgDarkIconPath,
            width: screenSize.width * 30/390,
            height: screenSize.height * 30/844,

          ),
          SizedBox(height: screenSize.height* 8/844),
          Text(
            card.text,
            style: TextStyle(
              fontSize: 14,
              color: card.isSelected
                  ? Color.fromARGB(250, 215, 253, 0)
                  : Color.fromARGB(255, 8, 41, 63),
            ),
          ),
          SizedBox(height: screenSize.height* 8/844),
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<CardData> cardData;
  final Function(CardData) onCardSelected;

  CardList({required this.cardData, required this.onCardSelected});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var card in cardData)
          GestureDetector(
            onTap: () {
              onCardSelected(card);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:screenSize.width * 5.0/390),
              child: CardWidget(card: card),
            ),
          ),

      ],
    );
  }
}
