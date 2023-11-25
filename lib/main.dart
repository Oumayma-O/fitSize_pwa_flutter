
import 'package:beamer/beamer.dart';
import 'package:fitsize/pages/ChoixScanPage.dart';
import 'package:fitsize/pages/DetailsPage.dart';
import 'package:fitsize/pages/HomeManPage.dart';
import 'package:fitsize/pages/HomeWomanPage.dart';
import 'package:fitsize/pages/LoadingPage.dart';
import 'package:fitsize/pages/LoadingPage2.dart';
import 'package:fitsize/pages/PoidsPage.dart';
import 'package:fitsize/pages/ResultatsPage.dart';
import 'package:fitsize/pages/SettingsPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:fitsize/pages/TaillePage.dart';
import 'package:fitsize/pages/TutorielEtape1Page.dart';
import 'package:flutter/material.dart';
import 'package:fitsize/beamer_routes.dart';
import 'package:fitsize/pages/LoginPage.dart';


/*
void main() {
  final routerDelegate = BeamerDelegate(
    initialPath: '/accueil',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
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
        SettingsLocation(
          updateMetricStandard: (bool value) {
          },
          updateUSStandard: (bool value) {
          },
        ),
        HomeManLocation(),
        HomeWomanLocation(),
        DetailsLocation(isMetricStandard: true),
        LoginPageLocation(),
      ],
    ).call,
  );

  runApp(MyApp(routerDelegate));
}*/



void main() {
  runApp(   MaterialApp(
    home: ChoixScanPage(selectedSexe: 'Homme', selectedTaille: '160cm', selectedPoids: '45',),
  ));
}

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
