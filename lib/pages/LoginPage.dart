import 'package:fitsize/components/my_paswdfield.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(

      //backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/Accueil.png'), // Change to your image path
        fit: BoxFit.cover, // This will make the image cover the entire container
        ),
        ),
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.07179),

          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: screenSize.height * 0.1279),

              // logo
             Image.asset('assets/images/fitsize_blue_logo.png'),

              SizedBox(height: screenSize.height * 0.1469),

              // welcome back, you've been missed!
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

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  const SquareTile(imagePath: 'assets/images/google.png'),

                  SizedBox(width: screenSize.width * 0.051),

                  // apple button
                  const SquareTile(imagePath: 'assets/images/apple.png')
                ],
              ),

              SizedBox(height: screenSize.height * 0.054),

              // or continue with

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.02),
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


              SizedBox(height: screenSize.height * 0.0533),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child:Row(
                children:[
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


              // username textfield
              const MyTextField(
                hintText: 'dupondavid@gmail.com',
                obscureText: false,
              ),

              SizedBox(height: screenSize.height * 0.0236),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child:Row(
                children:[
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

              // password textfield
              MyPswdField(
                hintText: 'min. 8 caractères',
              ),

              SizedBox(height: screenSize.height * 0.0142),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF353537),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),

                  ],

                ),
              ),

              SizedBox(height: screenSize.height * 0.071),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),

              SizedBox(height: screenSize.height * 0.0568),


            ],
          ),
    ),
        ),
      ),
    );
  }
}