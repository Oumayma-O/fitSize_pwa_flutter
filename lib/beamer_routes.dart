// beamer_routes.dart
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:fitsize/pages/LoadingPage.dart';
import 'package:fitsize/pages/AccueilPage.dart';

class LoadingLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('loading'),
        title: "Loading Page",
        name: '/loading',
        child: LoadingPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/loading'];
}

class AccueilLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('accueil'),
        title: "Accueil Page",
        name: '/accueil',
        child: AccueilPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/accueil'];
}
