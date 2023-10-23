import 'package:fitsize/pages/LoadingPage.dart';
import 'package:flutter/material.dart';

class SexePage extends StatelessWidget {
  SexePage({Key? key});

  final TextStyle customTextStyle3 = TextStyle(
    fontFamily: 'Fors',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xFFFAFAFC),
  );
final TextStyle customTextStyle = TextStyle(
  fontFamily: 'Fors',
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Color(0xFF08293F),
);

final TextStyle customTextStyle2 = TextStyle(
  fontFamily: 'ForsLight',
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xFF08293F),
);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFFFAFAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Padding for the icons at the top
          Padding(
            padding: EdgeInsets.only(left: 10, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 38, 36, 56), size: 30),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 38, 36, 56),
                    size: 32,
                  ),
                 onPressed: () {
                      // Navigate to the SexePage when the button is pressed
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoadingPage()),
                      );
                    },
                ),
              ],
            ),
          ),
          // Middle Section with Text and Cards
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15), // Add left and right padding
              child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20), // Add left padding
                      child: Text('Quel est votre sexe ?', style: customTextStyle),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20), // Add left padding
                      child: Text('Cela me permet de mieux concevoir votre profil', style: customTextStyle2),
                    ),
                  ),
                  SizedBox(height: 20),

                  CardList(),
                ],
              ),
            ),
          ),
          // Separated button at the bottom
          Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: 
             
               ElevatedButton(
                    onPressed: () {
                      // Navigate to the SexePage when the button is pressed
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SexePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF4B56DB),
                      minimumSize: Size(0.8 * MediaQuery.of(context).size.width, 50),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text('Suivant', style: customTextStyle3),
                  ),

            ),
        
          ),
              
          SizedBox(height: 20),
        ],
      ),
    );
  }
}



class CardWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  CardWidget({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set the desired width
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 39, 33, 51), width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 60,
            height: 50,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF08293F),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}


class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 20),
        Expanded(
          child: CardWidget(imagePath: 'assets/images/icon_man.png', text: 'Homme'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CardWidget(imagePath: 'assets/images/icon_woman.png', text: 'Femme'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CardWidget(imagePath: 'assets/images/more.png', text: 'Autres'),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
