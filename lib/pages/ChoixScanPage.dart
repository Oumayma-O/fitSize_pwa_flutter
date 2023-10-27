import 'package:fitsize/pages/VideoTutoPage.dart';
import 'package:fitsize/widgets/PrecedentButtonWithIcon.dart';
import 'package:fitsize/widgets/SuivantButtonWithIcon.dart';
import 'package:flutter/material.dart';

class ChoixScanPage extends StatelessWidget {



  final TextStyle customTextStyle = TextStyle(
    fontFamily: 'ForsLight',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 254, 254, 255),
    letterSpacing: 0.0,
    height: 1.4, // Line height
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/scan.png',
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
              icon: Icon(Icons.arrow_back, color: Color(0xFF262438), size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          // Your page content on top of the background image
          Column(
            mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the bottom
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40), // Add left and right padding
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Scannez-vous en prenant une photo de face et de côté',
                    style: customTextStyle,
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Replace the existing SuivantButton widgets with this code
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SuivantButtonWithIcon(
                    buttonText: "Seul(e)", // Add your desired text
                    iconData: Icons.person, // Use the Icons.group icon
                   onPressed: () {
                    // Navigate to VideoTutoPage when "Seul(e)" button is pressed
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoTutoPage(choixScan: "Seul(e)"), // Pass the button text
                    ),
                  );

                  },
                  ),
                ),
              ),
              // Next Button
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: PrecedentButtonWithIcon(
                    buttonText: "Par un ami", // Add your desired text
                    iconData: Icons.group, // Use the Icons.group icon
                   onPressed: () {

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoTutoPage(choixScan: "Par un ami"), // Pass the button text
                    ),
                  );
                  },
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
