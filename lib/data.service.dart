import 'dart:convert';
import 'dart:developer';
import 'package:fitsize/models/APIResponse.dart';
import 'package:http/http.dart' as http;

class DataService {
  static const apiUrl = 'https://fit-size.com/fitshop/modules/guidetailles/api.php';
  static const token = 'Vc2Tc7UjrJzto4ByrVFC48JSLVJ9aCcMRxdqqbrdUrGumEP0ay3SBblaO89QxiKl';

  Future<String?> getLogoPath() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl?action=getLogo'),
        headers: {'Token': token,
          "content-type": "application/json"
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Success fetching logo : ${response.statusCode}');
        return data['logoPath'];
      } else {
        // Handle error, you can throw an exception or return a default value
        print('Error fetching logo: ${response.statusCode}');
        return 'images/fit_shop.png';
      }
    } catch (e) {
      // Handle exceptions
      print('Exception: $e');
      return null;
    }
  }


  Future<String?> getProductImagePath() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl?action=getProduct&product_id=27'),
        headers: {'Token': token},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Success fetching logo: ${response.statusCode}');
        print('data: $data');

        return data["cover_image_path"];
      } else {
        // Handle error, you can throw an exception or return a default value
        print('Error fetching product image: ${response.statusCode}');
        return 'assets/images/Jupe.png';
      }
    } catch (e) {
      // Handle exceptions
      print('Exception: $e');
      return null;
    }
  }
}
