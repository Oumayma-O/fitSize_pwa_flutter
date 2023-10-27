import 'package:fitsize/pages/ScanEtape2Page.dart';
import 'package:flutter/material.dart';

class ScanEtape1Page extends StatefulWidget {

  final String choixScan; // Add a parameter to accept the button text

  ScanEtape1Page({required this.choixScan}); // Constructor to initialize the parameter




  @override
  _ScanEtape1PageState createState() => _ScanEtape1PageState();
}

class _ScanEtape1PageState extends State<ScanEtape1Page> {

  int selectedBoxIndex = 0;

List<String> boxes = [];


  @override
  Widget build(BuildContext context) {
  print("choixScan scan etape 1 page: ${widget.choixScan}");

    List<String> texts = [];

  if (widget.choixScan == "Seul(e)") {
    texts = ['Tout seul', 'Par un ami'];
  } else if (widget.choixScan == "Par un ami") {
    texts = ['Par un ami', 'Tout seul'];
  }


    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/image 21.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Darken the background image
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),
          // Top-left icon
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255), size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),

          Container(
            height: 700, // Set the height of the container
            child: Stack(
              children: [
                // Image to the left of "Group 205"
                Positioned(
                  right: 35, // Position the image to the left
                  top: 350, // Adjust the top position relative to the container
                  child: Image.asset(
                    'assets/images/polygon 1.png', // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
                // "Group 205" image
                Positioned(
                  right: 20, // Position the "Group 205" image to the right
                  top: 60, // Adjust the top position relative to the container
                  child: Image.asset(
                    'assets/images/Group 205.png',
                    fit: BoxFit.cover,
                    height: 700,
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 30),
             

         Padding(
          padding: const EdgeInsets.only(right: 80.0), // Adjust the padding as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                texts[0],
                style: TextStyle(
                  fontFamily: 'Fors',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(width: 20),
              Text(
                texts[1],
                style: TextStyle(
                  fontFamily: 'ForsLight',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFAFAFC),
                ),
              ),
            ],
          ),
        ),

             SizedBox(height: 20),
              
             InkWell(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4.0),
                  color: Color(0xFF4B56DB),
                ),
           
              ),
              onTap: () {
       
                Navigator.of(context).push(
                  MaterialPageRoute(
                builder: (context) => ScanEtape2Page(choixScan: widget.choixScan),
                  ),
                );
              },
            ),


              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScrollableBox extends StatefulWidget {
  final String text;
  final TextStyle customTextStyle;
  final Function onTap;
  final bool isSelected;

  _ScrollableBox({
    required this.text,
    required this.customTextStyle,
    required this.onTap,
    required this.isSelected,
  });

  @override
  _ScrollableBoxState createState() => _ScrollableBoxState();
}

class _ScrollableBoxState extends State<_ScrollableBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          widget.text,
          style: widget.isSelected
              ? widget.customTextStyle.copyWith(color: Colors.red)
              : widget.customTextStyle,
        ),
      ),
    );
  }
}
