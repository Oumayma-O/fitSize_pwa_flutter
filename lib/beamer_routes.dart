import 'package:beamer/beamer.dart';
import 'package:fitsize/pages/ChoixScanPage.dart';
import 'package:fitsize/pages/DetailsPage.dart';
import 'package:fitsize/pages/HomeManPage.dart';
import 'package:fitsize/pages/HomeWomanPage.dart';
import 'package:fitsize/pages/LoadingPage2.dart';
import 'package:fitsize/pages/LoginPage.dart';
import 'package:fitsize/pages/PoidsPage.dart';
import 'package:fitsize/pages/ResultatsPage.dart';
import 'package:fitsize/pages/ScanEtape1Page.dart';
import 'package:fitsize/pages/ScanEtape2Page.dart';
import 'package:fitsize/pages/SettingsPage.dart';
import 'package:fitsize/pages/SexePage.dart';
import 'package:fitsize/pages/TaillePage.dart';
import 'package:fitsize/pages/TutorielEtape1Page.dart';
import 'package:fitsize/pages/TutorielEtape2Page.dart';
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





class Loading2Location extends BeamLocation<BeamState> {

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('loading2'),
        title: "Loading2 Page",
        name: '/loading2',
        child: LoadingPage2(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/loading2'];
}


class AccueilLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
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
        key: const ValueKey('Sexe'),
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
        key: const ValueKey('Taille'),
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

class ChoixScanLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final selectedTaille = state.pathParameters['selectedTaille'] ?? '';
    final selectedSexe = state.pathParameters['selectedSexe'] ?? '';
    final selectedPoids = state.pathParameters['selectedPoids'] ?? '';
    return [
      BeamPage(
        key: ValueKey('choixScan'),
        title: "Choix Scan Page",
        name: '/choix-scan',
        child: ChoixScanPage(
          selectedTaille: selectedTaille,
          selectedSexe: selectedSexe,
          selectedPoids: selectedPoids,
        ),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
    '/choix-scan/taille/:selectedTaille/sexe/:selectedSexe/poids/:selectedPoids',
    '/choix-scan',
  ];
}

class TutorielEtape1Location extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final selectedChoix = state.pathParameters['selectedChoix'] ?? '';
    final selectedSexe = state.pathParameters['selectedSexe'] ?? '';
    return [
      BeamPage(
        key: ValueKey('TutorielEtape1'),
        title: "Tutoriel Etape1 Page",
        name: '/TutorielEtape1',
        child: TutorielEtape1Page(selectedChoix: selectedChoix, selectedSexe: selectedSexe),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
    '/TutorielEtape1/:selectedChoix/:selectedSexe', // Define the path pattern
  ];
}

class TutorielEtape2Location extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
  final selectedChoix = state.pathParameters['selectedChoix'] ?? '';
    final selectedSexe = state.pathParameters['selectedSexe'] ?? '';
    return [
      BeamPage(
        key: ValueKey('TutorielEtape2'),
        title: "Tutoriel Etape2 Page",
        name: '/TutorielEtape2',
    child: TutorielEtape2Page(selectedChoix: selectedChoix, selectedSexe: selectedSexe),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
    '/TutorielEtape2/:selectedChoix/:selectedSexe', // Define the path pattern
  ];
}





class ScanEtape1Location extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
   final selectedChoix = state.pathParameters['selectedChoix'] ?? '';
    return [
      BeamPage(
        key: ValueKey('ScanEtape1'),
        title: "Scan Etape1 Page",
        name: '/ScanEtape1',
     child: ScanEtape1Page(selectedChoix: selectedChoix),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/ScanEtape1'];
}




class ScanEtape2Location extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
   final choixScan = state.pathParameters['choixScan'] ?? '';
    return [
      BeamPage(
        key: ValueKey('ScanEtape2'),
        title: "Scan Etape2 Page",
        name: '/ScanEtape2',
     child: ScanEtape2Page(choixScan: choixScan),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/ScanEtape2'];
}



class ResultatsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('resultats'),
        title: "Resultats Page",
        name: '/Resultats',
        child: ResultatsPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/Resultats'];
}

class SettingsLocation extends BeamLocation<BeamState> {
  final Function(bool) updateMetricStandard;
  final Function(bool) updateUSStandard;

  SettingsLocation({required this.updateMetricStandard, required this.updateUSStandard});

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('settings'),
        title: "Settings Page",
        name: '/settings',
        child: SettingsPage(updateMetricStandard: updateMetricStandard, updateUSStandard: updateUSStandard),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/settings'];
}

class HomeManLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('home-man'),
        title: "HomeMan Page",
        name: '/home-man',
        child: HomeManPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/home-man'];
}

class HomeWomanLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
       BeamPage(
        key: ValueKey('home-woman'),
        title: "HomeWoman Page",
        name: '/home-woman',
        child: HomeWomanPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/home-woman'];
}

class DetailsLocation extends BeamLocation<BeamState> {
  final bool isMetricStandard;

  DetailsLocation({required this.isMetricStandard});

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('details'),
        title: "Details Page",
        name: '/details',
        child: DetailsPage(isMetricStandard: isMetricStandard),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/details'];
}


class LoginPageLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey('login'),
        title: "Login Page",
        name: '/login',
        child: LoginPage(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/login'];
}

