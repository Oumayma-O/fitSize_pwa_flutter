import 'package:fitsize/pages/LoadingPage2.dart';
import 'package:flutter/material.dart';

class ScanEtape2Page extends StatefulWidget {

  final String choixScan;

  ScanEtape2Page({required this.choixScan}); 




  @override
  _ScanEtape2PageState createState() => _ScanEtape2PageState();
}

class _ScanEtape2PageState extends State<ScanEtape2Page> {

  int selectedBoxIndex = 0;

List<String> boxes = [];


  @override
  Widget build(BuildContext context) {
  print("choixScan scan etape 2 page: ${widget.choixScan}");

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
            'assets/images/image 20.png',
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
      
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255), size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),

          Container(
            height: 700, 
            child: Stack(
              children: [
           
                Positioned(
                  right: 35, 
                  top: 350, 
                  child: Image.asset(
                    'assets/images/Polygon 1.png', 
                    fit: BoxFit.cover,
                  ),
                ),
           
                Positioned(
                  right: 20, 
                  top: 60, 
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
              const SizedBox(height: 30),
             

         Padding(
          padding: const EdgeInsets.only(right: 80.0), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                texts[0],
                style: const TextStyle(
                  fontFamily: 'Fors',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                texts[1],
                style: const TextStyle(
                  fontFamily: 'ForsLight',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFAFAFC),
                ),
              ),
            ],
          ),
        ),

             const SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4.0),
                        color: const Color(0xFF4B56DB),
                      ),
                   
                    ),
                     onTap: () {
                
                    // Use Navigator to push a new route when the circle button is pressed.
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoadingPage2();
                        },
                      ),
                    );
                  },
                  ),
                ),


                
              ),
              const SizedBox(height: 30),
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

  const _ScrollableBox({
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
