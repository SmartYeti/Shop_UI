import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/branch/domain/models/addbranch.model.dart';
import 'package:shop_ui/features/branch/domain/models/branch.model.dart';

class BranchRepository {
  Future<Either<String, List<BranchModel>>> getBranch(String shopId) async {
    try {
      final response =
          await http.get(Uri.parse('${Config.url}/api/showBranch/$shopId'));
      if (response.body.isEmpty) {}

      final result = jsonDecode(response.body) as List;
      List<BranchModel> fresult =
          result.map(((e) => BranchModel.fromJson(e))).toList();

      return Right(fresult);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, dynamic>> addShop(AddBranchModel addBranchModel) async {
    try {
      final response =
          await http.post(Uri.parse('${Config.url}/api/create'), body: {
        'shopId': addBranchModel.shopId,
        'branchId': addBranchModel.branchId,
        'branchName': addBranchModel.branchName,
        'address1': addBranchModel.address1,
        'address2': addBranchModel.address2,
        'dateOpened': addBranchModel.dateOpened,
        'type': addBranchModel.type,
        'notes': addBranchModel.notes,
        'remark': addBranchModel.remark,
      });

      return Right(response.statusCode);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
