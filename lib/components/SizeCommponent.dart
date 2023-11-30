import 'package:flutter/material.dart';

class SizeComponent extends StatelessWidget {

  final String title;
  final String description;
  final bool isSelected;
  final Function() onTap;

  final bool perfectFit;

  const SizeComponent({super.key,required this.title,required this.description , required this.isSelected,required this.onTap,required this.perfectFit});

  @override
  Widget  build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    var buttonWidth = perfectFit
        ? screenSize.width * 0.31
        : screenSize.width * 0.248;
    var buttonHeight = perfectFit
        ? screenSize.height * 0.094
        : screenSize.height * 0.0876;
    final buttonColor = isSelected
        ? const Color(0xFF08293F)
        : const Color(0xFFE5E6E9);

    final onPrimaryColor = isSelected
        ? const Color(0xFF08293F)
        : const Color(0xFFE5E6E9);

    return ElevatedButton(
      onPressed: onTap,

      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: onPrimaryColor,
        minimumSize: Size(buttonWidth, buttonHeight),
        padding: EdgeInsets.only(bottom: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: isSelected
                ? const Color(0xFF08293F)
                : const Color(0xFFE5E6E9),
            width: 1.0,
          ),
        ),
        elevation: isSelected ? 5 : 0,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.00473,
          bottom: screenSize.height * 0.01184,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             title,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFFD8FD00)
                    : const Color(0xFF08293F),
                fontFamily: 'Fors',
                fontSize: perfectFit ? 30 : 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: isSelected
                  ? screenSize.width * 0.2051
                  : screenSize.width * 0.192,
              child: Text(
                textAlign: TextAlign.center,
                description,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFFD8FD00)
                      : const Color(0xFF505056),
                  fontSize: 14,
                  fontFamily: 'TT Fors Trial',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
