// beamer_routes.dart
import 'package:beamer/beamer.dart';
import 'package:fitsize/pages/PoidsPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:fitsize/pages/TaillePage.dart';
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


class SexeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('Sexe'),
        title: "Sexe Page",
        name: '/sexe',
        child: SexePage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/sexe'];
}


class TailleLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final selectedSexe = state.pathParameters['selectedSexe'] ?? '';
    return [
      BeamPage(
        key: ValueKey('Taille'),
        title: "Taille Page",
        name: '/taille',
        child: TaillePage(
          selectedSexe: selectedSexe,
        ),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
    '/taille/:selectedSexe', 
    '/taille',
  ];
}


class PoidsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final selectedTaille = state.pathParameters['selectedTaille'] ?? '';
    final selectedSexe = state.pathParameters['selectedSexe'] ?? '';
    
    return [
      BeamPage(
        key: ValueKey('Poids'),
        title: "Poids Page",
        name: '/Poids',
        child: PoidsPage(
          selectedTaille: selectedTaille,
          selectedSexe: selectedSexe,
        ),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
    '/taille/:selectedTaille/sexe/:selectedSexe',
    '/taille',
  ];
}
