import 'package:flutter/material.dart';

class MesureDetails extends StatelessWidget {
  final String title;
  final double value;
  //final bool isMetricStandard;
  final String imagePath;
  final String description;


  const MesureDetails({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.value,
    //required this.isMetricStandard,

  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    //String convertedValue = isMetricStandard ? '$value Cm' : '${convertToInches(value)} In';


    return Container(
      //padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.025,vertical: screenSize.height*0.014),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0x33505056)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.041,vertical: screenSize.height*0.0308),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                width: screenSize.width*0.141,
                height:screenSize.height* 0.0663,
              ),
            ],
          ),
    ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height*0.01658,bottom: screenSize.height*0.01658,right:screenSize.width* 0.023),
            child:Column(
            //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical:screenSize.height* 0.002369),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF08293F),
                      fontSize: 16,
                      fontFamily: 'TT Fors Trial',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  )
                ],
              )),
              Padding(padding: EdgeInsets.symmetric(vertical: screenSize.height* 0.002369),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [

                      Text(
                        description,
                        style: const TextStyle(
                          color: Color(0xFF505056),
                          fontSize: 14,
                          fontFamily: 'TT Fors Trial',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ],
                  )),
              Padding(padding:  EdgeInsets.symmetric(vertical: screenSize.height* 0.002369),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${value} cm',
                        style: const TextStyle(
                          color: Color(0xFF4B56DB),
                          fontSize: 16,
                          fontFamily: 'TT Fors Trial',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      )
                    ],
                  ))

            ],
          ),
    ),
        ],
      ),
    );
  }

  double convertToInches(double cmValue) {
    // Conversion factor from cm to inches
    const double cmToInchesConversionFactor = 0.393701;
    return cmValue * cmToInchesConversionFactor;
  }


}
