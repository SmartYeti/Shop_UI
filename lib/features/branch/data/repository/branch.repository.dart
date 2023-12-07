import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/branch/domain/models/branch.model.dart';

class BranchRepository {
  Future <Either<String, List<BranchModel>>> getBranch() async {
    try {
      final response = await http.get(Uri.parse('${Config.url}/api/indexBranch'));

      final result = jsonDecode(response.body)[0] as List;
      List<BranchModel> fresult = result.map(((e) => BranchModel.fromJson(e))).toList();
      
      return Right(fresult);
    } catch (e) {
      return Left(e.toString());
    }
  }
}