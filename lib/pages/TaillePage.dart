import 'package:fitsize/pages/LoadingPage.dart';
import 'package:fitsize/pages/PoidsPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:flutter/material.dart';

class TaillePage extends StatefulWidget {
  final String selectedSexe;

  TaillePage({required this.selectedSexe});

  @override
  _TaillePageState createState() => _TaillePageState();
}

class _TaillePageState extends State<TaillePage> {
  String selectedUnit = "Cm"; // Initialize with "Cm"
  int taille = 180;
  bool isDragging = false;



     @override
      void initState() {
        super.initState();
        // Print the selectedText value to the console
        print("Selected Sexe from SexePage: ${widget.selectedSexe}");

        // Set the default value of 'taille' based on the selected unit
        if (selectedUnit == "In") {
          taille = 66;
        }
      }

  double _containerWidth = 150; // Default width for "Je suis un homme" or "Je suis une femme"


  String _getSelectedSexe() {
    switch (widget.selectedSexe) {
      case 'Homme':
        _containerWidth = 150;
        return "Je suis un homme";
      case 'Femme':
        _containerWidth = 150;
        return "Je suis une femme";
      case 'Autres':
        _containerWidth = 230;
        return "Je suis une personne non binaire";
      default:
        _containerWidth = 150; // Default width for unknown selections
        return "";
    }
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
            mainAxisAlignment: MainAxisAlignment.end, // Set this to MainAxisAlignment.end
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Color(0xFF262438),
                  size: 32,
                ),
                onPressed: () {
                  // Navigate to the LoadingPage when the button is pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoadingPage()),
                  );
                },
              ),
            ],
          ),
        ),

          // Middle Section with Text and Circle
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15), // Add left and right padding
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                 Padding(
                  padding: const EdgeInsets.only(right: 10), // Add right padding
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
                              style: TextStyle(
                                color: Color(0xFF08293F),
                                fontSize: 12,
                              ),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20), // Add left and right padding
                      child: Text('Quelle taille faites-vous ?', style: customTextStyle),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20), // Add left and right padding
                      child: Text('Cela nous permet de mieux concevoir votre profil', style: customTextStyle2),
                    ),
                  ),
                  SizedBox(height: 60),

//////////////////////////////////////////

              


 
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 8, 41, 63),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            taille.toString(), // Display the value of 'taille' as text
                            style: TextStyle(
                              color: Color.fromARGB(220, 215, 253, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                   
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            (taille - 1).toString(),
                            style: TextStyle(
                              color: Color(0xFF989DA0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            (taille + 1).toString(),
                            style: TextStyle(
                              color: Color(0xFF989DA0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                   GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        if (details.primaryDelta! > 0) {
                          // Scrolled to the right, decrease taille by 1 if it's greater than 1
                          if (taille > 1) {
                            taille--;
                          }
                        } else if (details.primaryDelta! < 0) {
                          // Scrolled to the left, increase taille by 1 if it's less than 250
                          if (taille < 250) {
                            taille++;
                          }
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(0),
                      child: Image.asset('assets/images/image3.png'),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(50, 158, 158, 158),
                            width: 7.0,
                          ),
                        ),
                      ),
                    ),
                  ),

                    SizedBox(height: 40),


////////////////////////////////////////



          // Add two small buttons centered and in the same line
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                // Update the selected unit and 'taille' value
                setState(() {
                  selectedUnit = "Cm";
                  taille = 170; // Set the 'taille' value to 170
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
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(width: 20),

             ElevatedButton(
                  onPressed: () {
                    // Update the selected unit and 'taille' value
                    setState(() {
                      selectedUnit = "In";
                      taille = 66; // Set the 'taille' value to 66
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
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Previous Button
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the previous page when the button is pressed
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF7F7F8),
                  minimumSize: Size(0.8 * MediaQuery.of(context).size.width, 50),
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: Color(0xFF4B56DB),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text('Précédent', style: customTextStyle4),
              ),
            ),
          ),
          // Next Button
          Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
              
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PoidsPage(
                        selectedTaille: '$taille $selectedUnit', // Concatenate 'taille' and 'selectedUnit'
                        selectedSexe: widget.selectedSexe, // Pass the selectedSexe to PoidsPage
                      ),
                    ),
                  );
                },

                  
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4B56DB),
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

