
import 'package:beamer/beamer.dart';
import 'package:fitsize/pages/HomeManPage.dart';
import 'package:fitsize/pages/HomeWomanPage.dart';
import 'package:flutter/material.dart';
import 'package:fitsize/beamer_routes.dart';
import 'package:fitsize/pages/LoginPage.dart';


/*void main() {
  final routerDelegate = BeamerDelegate(
    initialPath: '/loading',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        LoadingLocation(),
        AccueilLocation(),
      ],
    ),
  );

  runApp(MyApp(routerDelegate));
}*/


void main() {
  runApp(   MaterialApp(
    home: HomeWomanPage(),
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
