import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DataService {
  static const apiUrl = 'https://fit-size.com/fitshop/modules/guidetailles/api.php';
  static const token = 'Vc2Tc7UjrJzto4ByrVFC48JSLVJ9aCcMRxdqqbrdUrGumEP0ay3SBblaO89QxiKl';

  Future<Map<String, dynamic>?> getUriAndProductId() async {
    final prefs = await SharedPreferences.getInstance();
    final shopUri = prefs.getString('shopUri');
    final productId = prefs.getInt('productId');

    if (shopUri != null && productId != null) {
      return {'shopUri': shopUri, 'productId': productId};
    } else {
      return null;
    }
  }

  Future<String?> getLogoPath() async {
    try {
      final uriAndProductId = await getUriAndProductId();

      if (uriAndProductId != null) {
        final shopUri = uriAndProductId['shopUri'];

        print('Fully constructed URI: ${Uri.parse('$shopUri/modules/guidetailles/api.php?action=getLogo')}');
        print('shopUri Service $shopUri');
      final response = await http.get(
        Uri.parse('$apiUrl?action=getLogo'),
        headers: {'Token': token,
          "content-type": "application/json"
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Success fetching logo : ${response.statusCode}');
        return data['logoUrl'];
      } else {
        print('Error fetching logo: ${response.statusCode}');
        return 'http://fit-size.com/fitshop/img/logo-1693983394.jpg';
      }
      }else {
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }


  Future<String?> getProductImagePath() async {
    try {
      final uriAndProductId = await getUriAndProductId();

      if (uriAndProductId != null) {
        final shopUri = uriAndProductId['shopUri'];
        final productId = uriAndProductId['productId'];

        print('Fully constructed URI using apiUrl: ${Uri.parse('$apiUrl?action=getProduct&product_id=$productId')}');
        final response = await http.get(
          Uri.parse('$apiUrl?action=getProduct&product_id=$productId'),
          headers: {'Token': token},
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          print('Success fetching logo: ${response.statusCode}');
          print('data: $data');

          return data["cover_image_path"];
        } else {
          print('Error fetching product image: ${response.statusCode}');
          return 'fit-size.com/fitshop/img/p/4/2/42-home_default.jpg';
        }
      }else {
        return null;
      }
      } catch (e) {
      print('Exception: $e');
      return null;
    }

  }
}
