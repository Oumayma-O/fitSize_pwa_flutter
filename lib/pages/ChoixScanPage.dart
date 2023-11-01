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
    height: 1.4,
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
        
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),
         
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
        
          Column(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40), 
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Scannez-vous en prenant une photo de face et de côté',
                    style: customTextStyle,
                  ),
                ),
              ),
              SizedBox(height: 30),
           
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SuivantButtonWithIcon(
                    buttonText: "Seul(e)", 
                    iconData: Icons.person,
                   onPressed: () {
             
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoTutoPage(choixScan: "Seul(e)"), 
                    ),
                  );

                  },
                  ),
                ),
              ),
       
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: PrecedentButtonWithIcon(
                    buttonText: "Par un ami", 
                    iconData: Icons.group, 
                   onPressed: () {

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoTutoPage(choixScan: "Par un ami"), 
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
