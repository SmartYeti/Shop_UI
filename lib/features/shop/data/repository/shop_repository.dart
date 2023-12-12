import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/shop/domain/models/add_shop.model.dart';
import 'package:shop_ui/features/shop/domain/models/shop_model.dart';

class ShopRepository {
  Future<Either<String, String>> addShop(AddShopModel addShopModel) async {
    try {
      final response = await http.post(Uri.parse('${Config.url}/api/create'),
          body: jsonEncode({addShopModel}));
      //jsonEncode({addShopModel})

      return Right(response.body);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ShopModel>>> getShop() async {
    // final response = await http.get(Uri.parse('${Config.url}/api/index'));
    // if(response.statusCode == 200) {
    //   print(response.body);
    //   //store data in result --- from response
    //   final List result = jsonDecode(response.body)[0];
    //   //get each data from result and store it in ShopModel
    //   return result.map(((e) => ShopModel.fromJson(e))).toList();
    // } else {
    //   //Error message
    //   throw Exception(response.reasonPhrase);
    // }
    try {
      final response = await http.get(Uri.parse('${Config.url}/api/index'));

      final result = jsonDecode(response.body) as List;
      List<ShopModel> fresult =
          result.map(((e) => ShopModel.fromJson(e))).toList();
      // print(result);
      return Right(fresult);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
