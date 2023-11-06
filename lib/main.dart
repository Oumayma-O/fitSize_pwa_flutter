
import 'package:beamer/beamer.dart';
import 'package:fitsize/pages/DetailsPage.dart';
import 'package:fitsize/pages/HomeManPage.dart';
import 'package:fitsize/pages/HomeWomanPage.dart';
import 'package:fitsize/pages/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:fitsize/beamer_routes.dart';
import 'package:fitsize/pages/LoginPage.dart';



void main() {
  final routerDelegate = BeamerDelegate(
    initialPath: '/accueil', // or your desired initial path
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        // Existing locations
        LoadingLocation(),
        Loading2Location(),
        AccueilLocation(),
        SexeLocation(),
        TailleLocation(),
        PoidsLocation(),
        ChoixScanLocation(),
        TutorielEtape1Location(),
        ScanEtape1Location(),
        ScanEtape2Location(),
        ResultatsLocation(),
        TutorielEtape1Location(),
        TutorielEtape2Location(),
        SettingsLocation(),
        // Add the new locations
        HomeManLocation(),
        HomeWomanLocation(),
        DetailsLocation(),
        LoginPageLocation(),
      ],
    ),
  );


  runApp(MyApp(routerDelegate));
}

/*
void main() {
  runApp(   MaterialApp(
    home: HomeManPage(),
  ));
}
*/
class MyApp extends StatelessWidget {
  final BeamerDelegate routerDelegate;

  MyApp(this.routerDelegate);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
