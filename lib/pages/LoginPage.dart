import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/my_paswdfield.dart';
import '../components/square_tile.dart';
import 'HomeManPage.dart';
import 'HomeWomanPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(String gender, BuildContext context) {
    if (gender == 'male') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeManPage()),
      );
    } else if (gender == 'female') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeWomanPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
           decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Accueil.png',),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.07179),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 70),
                  Image.asset('assets/images/fitsize_blue_logo.png'),
                  SizedBox(height: 124),
                  const Text(
                    'Connectez-vous à votre compte',
                    style: TextStyle(
                      color: Color(0xFF08293F),
                      fontSize: 16,
                      fontFamily: 'TT Fors Trial',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.0379),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SquareTile(imagePath: 'assets/images/google.png'),
                      SizedBox(width: screenSize.width * 0.051),
                      const SquareTile(imagePath: 'assets/images/apple.png')
                    ],
                  ),
                  SizedBox(height: 46),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
                        child: const Text(
                          'ou',
                          style: TextStyle(
                            color: Color(0xFF353537),
                            fontSize: 16,
                            fontFamily: 'TT Fors Trial',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 45),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Adresse mail',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'TT Fors Trial',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.0094),
                  const MyTextField(
                    hintText: 'dupondavid@gmail.com',
                    obscureText: false,
                  ),
                  SizedBox(height: screenSize.height * 0.0236),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Mot de passe',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'TT Fors Trial',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.0094),
                  MyPswdField(
                    hintText: 'min. 8 caractères',
                  ),
                  SizedBox(height: screenSize.height * 0.0142),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF353537),
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  MyButton(
                    onTap: () {
                      // Determine the user's gender based on some logic
                      String userGender = 'male'; // Change this based on your logic
                      signUserIn(userGender, context);
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.0568),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
