import 'package:fitsize/pages/ChoixScanPage.dart';
import 'package:fitsize/pages/LoadingPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:fitsize/pages/TaillePage.dart';
import 'package:fitsize/widgets/SuivantButton.dart';
import 'package:flutter/material.dart';
import  'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class PoidsPage extends StatefulWidget {
  final String selectedSexe;
  final String selectedTaille;

  PoidsPage({required this.selectedSexe, required this.selectedTaille});

  @override
  _PoidsPageState createState() => _PoidsPageState();
}

class _PoidsPageState extends State<PoidsPage> {
  String selectedUnit = "Kg";
  double _containerWidth = 170;

 
   RulerPickerController? _rulerPickerController;
   num currentValue = 71;
 


   List<RulerRange> ranges = const [

    RulerRange(begin: 0, end: 400, scale: 1),
  
  
  ];



@override
void initState() {
  super.initState();

   _rulerPickerController = RulerPickerController(value: currentValue);
}


  Widget _buildPositionBtn(num value) {
    return InkWell(
      onTap: () {
        _rulerPickerController?.value = value;
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          color:Color.fromARGB(255, 32, 32, 32),
          child: Text(
            value.toString(),
            style: TextStyle(color: Color(0xFFFAFAFC),),
          )),
    );
  }

  Widget _buildChangeRangerBtn(String tip, List<RulerRange> rangeList) {
    return InkWell(
      onTap: () {
        setState(() {
          ranges = rangeList;
        });
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          color:  Color.fromARGB(255, 23, 23, 23),
          child: Text(
            tip,
            style: TextStyle(color:Color(0xFFFAFAFC),),
          )),
    );
  }

  bool selected = false;


    void _updateCurrentValueAndUnit(String unit, num value) {
    setState(() {
      selectedUnit = unit;
      currentValue = value;
      if (selectedUnit == "Kg") {
        currentValue=71;
        _rulerPickerController?.value = currentValue; 
      } else if (selectedUnit == "Ib") {
        currentValue=155;
        _rulerPickerController?.value = currentValue ;
      }
    });
  }


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

      body: Stack(
  children: [
    Padding(
      padding: EdgeInsets.only(left: 10, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Color(0xFF262438),
              size: 32,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoadingPage()),
              );
            },
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 15, right: 15,top: 40),
      child: Column(
        children: [
           SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(right: 10),
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
                        style: customTextStyle2,
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
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
                    height: 40,
                    width: 160,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
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
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text('Quel poids faites-vous ?', style: customTextStyle),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text('Cela nous permet de mieux concevoir votre profil', style: customTextStyle2),
                ),
              ),
              const SizedBox(height: 20),
             Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 8, 41, 63),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Text(
        
              (currentValue-1).toStringAsFixed(0),
              style: customTextStyle5,
            ),

            ),
          ),
          const SizedBox(height: 20),
              Container(
                child: RulerPicker(
                  controller: _rulerPickerController!,
                  onBuildRulerScaleText: (index, value) {
                    return value.toInt().toString();
                  },
                  ranges: ranges,
                      scaleLineStyleList: const [
                        ScaleLineStyle(
                      color: Color.fromARGB(255, 43, 42, 42),
                      width: 1.5,
                      height: 30,
                      scale: 0,
                    ),
                    ScaleLineStyle(
                      color:Color.fromARGB(255, 45, 43, 43),
                      width: 1,
                      height: 25,
                      scale: 5,
                    ),
                    ScaleLineStyle(
                      color:Color.fromARGB(255, 45, 44, 44),
                      width: 1,
                      height: 15,
                      scale: -1,
                    ),
                      ],
                  onValueChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  rulerMarginTop: 8,
                  rulerBackgroundColor:Color(0xFFFAFAFC),
                ),
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedUnit = "Kg";
                        currentValue = 71;
                        _updateCurrentValueAndUnit("Kg", 71);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedUnit == "Kg" ? Color.fromARGB(255, 8, 41, 63) : Colors.white,
                      onPrimary: selectedUnit == "Kg" ? Color.fromARGB(255, 215, 253, 0) : Color.fromARGB(255, 8, 41, 63),
                      minimumSize: Size(90, 50),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: selectedUnit == "Kg" ? Color.fromARGB(255, 8, 41, 63) : Color.fromARGB(255, 8, 41, 63),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Kg',
                      style: TextStyle(
                        fontFamily: 'Fors',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedUnit = "Ib";
                        currentValue = 155;
                        _updateCurrentValueAndUnit("Ib", 155);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedUnit == "Ib" ? Color.fromARGB(255, 8, 41, 63) : Colors.white,
                      onPrimary: selectedUnit == "Ib" ? Color.fromARGB(255, 215, 253, 0) : Color.fromARGB(255, 8, 41, 63),
                      minimumSize: Size(90, 50),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: selectedUnit == "Ib" ? Color.fromARGB(255, 8, 41, 63) : Color.fromARGB(255, 8, 41, 63),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Ib',
                      style: TextStyle(
                        fontFamily: 'Fors',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SuivantButton(
                buttonText: 'Suivant',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChoixScanPage(
                        selectedPoids: '${(currentValue-1)} $selectedUnit',         
                        selectedTaille: widget.selectedTaille,
                        selectedSexe: widget.selectedSexe,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 35),
            ],
          ),
        ),
      ],
    ),
    );
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
}

