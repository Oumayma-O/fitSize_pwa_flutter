import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/measurement.dart';

class DetailsPage extends StatefulWidget {
  final bool isMetricStandard;

  DetailsPage({Key? key, required this.isMetricStandard});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String selectedCategory = 'Tout';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.0734),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Spacer(),
                Text(
                  'Détails des mensurations',
                  style: TextStyle(
                    color: Color(0xFF08293F),
                    fontSize: 18,
                    fontFamily: 'TT Fors Trial',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: screenSize.height * 0.047),
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.0379,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    category: categories[index],
                    isSelected: categories[index] == selectedCategory,
                    onSelect: () {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: screenSize.height * 0.0213),
            Expanded(
              child: ListWidget(
                items: getMeasurementsForCategory(selectedCategory),
                isMetricStandard: widget.isMetricStandard,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onSelect;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.025,
          vertical: screenSize.height * 0.011,
        ),
        decoration: ShapeDecoration(
          color: isSelected ? Color(0xFF08293F) : Color(0x33989DA0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF08293F),
              fontSize: 12,
              fontFamily: 'TT Fors Trial',
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  final List<String> items;
  final bool isMetricStandard;

  ListWidget({
    Key? key,
    required this.items,
    required this.isMetricStandard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Measurement(
          text: items[index],
          isMetricStandard: isMetricStandard,
        );
      },
    );
  }
}

List<String> getMeasurementsForCategory(String category) {
  switch (category) {
    case 'Tout':
      return [
        'Tour de cou',
        'Tour de cou détendu',
        'Largeur de la base du cou',
        'Tour de base du cou',
        'Pente de l\'épaule',
        'Largeur d\'épaule avant',
        'Largeur de poitrine',
        'Tour de poitrine',
        'Tour de buste',
        'Tour de poitrine supérieure',
        'Tour de bras',
        'Tour de bras (emmanchure)',
        'Tour de coude',
        'Tour de bras supérieur',
        'Tour de biceps supérieur',
        'Tour de taille',
        'Tour de hanches supérieur',
        'Tour de hanches',
        'Milieu de la taille',
        'Bas de la taille',
        'Tour d\'abdomen',
        'Point de cou arrière à la taille',
        'Point de cou latéral au niveau de la taille',
        'Point de cou latéral au genou',
        'Hauteur de hanche supérieure',
        'Hauteur de hanche',
        'Longueur de la hanche supérieure à la hanche',
        'Niveau de hanche supérieure latérale au genou',
        'Tour de genou supérieur au tour de cheville',
        'Hauteur du genou',
        'Tour de genou',
        'Longueur du bras inférieur',
        'Tour de mollet',
        'Tour de cuisse',
        'Tour de mi-cuisse',
        'Hauteur de la taille',
        'Hauteur de la jambe intérieure',
        'Longueur d\'entrejambe à mi-cuisse',
        'Longueur d\'entrejambe au genou',
        'Longueur d\'entrejambe au mollet',
        'Longueur de jambe extérieure',
        'Hauteur du corps droit',
        'Longueur totale d\'entrejambe',
        'Point de cou arrière à la hanche',
        'Hauteur du cou arrière',
        'Hauteur de la poitrine',
        'Hauteur de hanche',
        'Longueur de l\'abdomen au genou supérieur',
        'Longueur de la taille à la hanche',
        'Longueur du cou',
        'Hauteur',
        'Largeur de taille',
        'Largeur de l\'épaule arrière',
        'Point de cou arrière à la taille',
        'Point de cou latéral à la hanche supérieure',
        'Niveau de taille latéral aux chevilles',
        'Point de cou latéral au point de buste',
        'Point de buste latéral au niveau de la taille',
      ];
    case 'Haut du corps':
      return [
        'Tour de cou',
        'Tour de cou détendu',
        'Largeur de la base du cou',
        'Tour de base du cou',
        'Pente de l\'épaule',
        'Largeur d\'épaule avant',
        'Largeur de poitrine',
        'Tour de poitrine',
        'Tour de buste',
        'Tour de poitrine supérieure',
        'Tour de bras',
        'Tour de bras (emmanchure)',
        'Tour de coude',
        'Tour de bras supérieur',
        'Tour de biceps supérieur',
      ];
    case 'Milieu du corps':
      return [
        'Tour de taille',
        'Tour de hanches supérieur',
        'Tour de hanches',
        'Milieu de la taille',
        'Bas de la taille',
        'Tour d\'abdomen',
        'Point de cou arrière à la taille',
        'Point de cou latéral au niveau de la taille',
        'Point de cou latéral au genou',
      ];
    case 'Bas du corps':
      return [
        'Hauteur de hanche supérieure',
        'Hauteur de hanche',
        'Longueur de la hanche supérieure à la hanche',
        'Niveau de hanche supérieure latérale au genou',
        'Tour de genou supérieur au tour de cheville',
        'Hauteur du genou',
        'Tour de genou',
        'Longueur du bras inférieur',
        'Tour de mollet',
        'Tour de cuisse',
        'Tour de mi-cuisse',
        'Hauteur de la taille',
        'Hauteur de la jambe intérieure',
        'Longueur d\'entrejambe à mi-cuisse',
        'Longueur d\'entrejambe au genou',
        'Longueur d\'entrejambe au mollet',
        'Longueur de jambe extérieure',
        'Hauteur du corps droit',
      ];
    case 'Globales':
      return [
        'Longueur totale d\'entrejambe',
        'Point de cou arrière à la hanche',
        'Hauteur du cou arrière',
        'Hauteur de la poitrine',
        'Hauteur de hanche',
        'Longueur de l\'abdomen au genou supérieur',
        'Longueur de la taille à la hanche',
        'Longueur du cou',
        'Hauteur',
        'Largeur de taille',
        'Largeur de l\'épaule arrière',
        'Point de cou arrière à la taille',
        'Point de cou latéral à la hanche supérieure',
        'Niveau de taille latéral aux chevilles',
        'Point de cou latéral au point de buste',
        'Point de buste latéral au niveau de la taille',
      ];
    default:
      return [];
  }
}

final List<String> categories = [
  'Tout',
  'Haut du corps',
  'Milieu du corps',
  'Bas du corps',
  'Linéaires',
  'Volumétriques',
  'Globales',
];
