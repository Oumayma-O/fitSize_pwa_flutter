
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:fitsize/beamer_routes.dart';

void main() {
  final routerDelegate = BeamerDelegate(
    initialPath: '/loading',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        LoadingLocation(),
        AccueilLocation(),
        SexeLocation(),
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
