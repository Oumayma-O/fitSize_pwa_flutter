import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  late WeightSliderController _controller;
  double taille = 30.0;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(initialWeight: taille, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 8, 41, 63),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${taille.toStringAsFixed(1)}",
                  style: customTextStyle5,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    ((taille ~/ 10) * 10 - 10).toString(),
                    style: customTextStyle6,
                  ),
                  Spacer(),
                  Text(
                    ((taille ~/ 10) * 10 + 10).toString(),
                    style: customTextStyle6,
                  ),
                ],
              ),
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: 1,
                child: VerticalWeightSlider(
                  controller: _controller,
                  decoration: const PointerDecoration(
                    width: 100.0,
                    height: 3.0,
                    largeColor: Color.fromARGB(210, 137, 137, 137),
                    mediumColor: Color.fromARGB(156, 87, 69, 225),
                    smallColor: Color(0xFFF0F0F0),
                    gap: 30.0,
                  ),
                  onChanged: (double value) {
                    setState(() {
                      taille = value;
                    });
                  },
                  indicator: Container(
                    height: 10.0,
                    width: 130.0,
                    alignment: Alignment.centerLeft,
                    color: Color.fromARGB(255, 8, 41, 63),
                  ),
                ),
              ),
            ),
          ],
        ),
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

  final TextStyle customTextStyle6 = TextStyle(
    fontFamily: 'ForsLight',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Color(0xFF989DA0),
  );
}

