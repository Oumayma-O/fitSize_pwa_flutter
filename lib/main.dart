
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:fitsize/beamer_routes.dart';

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
      ],
    ),
  );

  runApp(MyApp(routerDelegate));
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
