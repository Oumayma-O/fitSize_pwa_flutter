import 'package:fitsize/components/MesureDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/measurement_model.dart';
import '../services/MeasurementService.dart';

enum BodyPart { HautDuCorps, BasDuCorps }

class Details2Page extends StatefulWidget {
  @override
  _Details2PageState createState() => _Details2PageState();
}

class _Details2PageState extends State<Details2Page> {
  final MeasurementService measurementService = MeasurementService();
  late List<Mesure> currentList; // Declare as late, initialize in initState
  int _currentSelection = 0;

  @override
  void initState() {
    super.initState();
    currentList = measurementService.getHautDuCorpsList();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.07179),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.0734),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Spacer(),
                  const Text(
                    'Détails des mensurations',
                    style: TextStyle(
                      color: Color(0xFF08293F),
                      fontSize: 18,
                      fontFamily: 'TT Fors Trial',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: screenSize.height *0.04265),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0x3308293F)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: CupertinoSlidingSegmentedControl<int>(
                  padding: EdgeInsets.all(4),
                  children: {
                    0: buildSegment('Haut du Corps', _currentSelection == 0),
                    1: buildSegment('Bas du Corps', _currentSelection == 1),
                  },
                  backgroundColor: Colors.white,
                  thumbColor: Color(0xFF4B56DB),
                  groupValue: _currentSelection,
                  onValueChanged: (index) {
                    setState(() {
                      _currentSelection = index!;
                      if (index == 0) {
                        currentList = measurementService.getHautDuCorpsList();
                      } else if (index == 1) {
                        currentList = measurementService.getBasDuCorpsList();
                      }
                    });
                  },
                ),
              ),

              SizedBox(height: screenSize.height *0.01421),

              Expanded(
                child: ListView.builder(
                  itemCount: currentList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical:screenSize.height * 0.00947),
                      child: MesureDetails(
                        imagePath: currentList[index].imagePath,
                        title: currentList[index].title,
                        description: currentList[index].description,
                        value: currentList[index].value,
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildSegment(String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.0769, vertical: MediaQuery.of(context).size.height *0.01895),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'TT Fors Trial',
          fontWeight: FontWeight.w500,
          height: 0,
          color: isSelected ? Colors.white : Color(0xFF505056),
        ),
      ),
    );
  }
}
