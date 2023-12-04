import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/shop/domain/models/shop_model.dart';

class ShopRepository {
  Future<List<ShopModel>> getShop() async {
    final response = await http.get(Uri.parse('${Config.url}/api/index'));

    if(response.statusCode == 200) {
      print(response.body);
      //store data in result --- from response
      final List result = jsonDecode(response.body)[0];
      //get each data from result and store it in ShopModel
      return result.map(((e) => ShopModel.fromJson(e))).toList();
    } else {
      //Error message
      throw Exception(response.reasonPhrase);
    }
  }
}