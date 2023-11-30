

import '../models/measurement_model.dart';

class MeasurementService {
  List<Mesure> hautDuCorpsList = [
    Mesure(
      imagePath: 'images/Cou.png',
      title: 'Cou',
      description: 'Tour du cou',
      value: 3.4,
    ),
    Mesure(
      imagePath: 'images/Largeur_des_epaules.png',
      title: 'Largeur des épaules',
      description: "Tour d'épaules",
      value: 3.4,
    ),
    Mesure(
      imagePath: 'images/Poitrine.png',
      title: 'Poitrine',
      description: 'Tour du poitrine',
      value: 3.4,
    ),
    Mesure(
      imagePath: 'images/Abdomen.png',
      title: 'Abdomen',
      description: "Tour d'abdomen",
      value: 3.4,
    ),
    Mesure(
      imagePath: 'images/Longueur_des_bras.png',
      title: 'Largeur des bras',
      description: 'Epaule au poignet',
      value: 3.4,
    ),
  ];

  List<Mesure> basDuCorpsList = [
    Mesure(
      imagePath: 'images/Hanches.png',
      title: 'Hnaches',
      description: 'Tour de la partie la plus large',
      value: 3.4,
    ),
    Mesure(
      imagePath: 'images/Hauteur_des_hanches.png',
      title: 'Hauteur des hanches',
      description: 'De la hanche vers le bas',
      value: 3.4,
    ),
    Mesure(
      imagePath: 'images/jambe_interieure.png',
      title: 'Jambe intérieure',
      description: 'Cuisse vers le bas',
      value: 3.4,
    ),
    Mesure(
      imagePath: 'images/Cuisse.png',
      title: 'Cuisse',
      description: 'Tour le plus large',
      value: 3.4,
    ),
    Mesure(
      imagePath: 'images/Mollet.png',
      title: 'Mollet',
      description: 'Tour du mollet',
      value: 3.4,
    ),
  ];

  List<Mesure> getHautDuCorpsList() {
    return hautDuCorpsList;
  }

  List<Mesure> getBasDuCorpsList() {
    return basDuCorpsList;
  }
}
