import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/auth/data/datasource/auth.local.datasource.dart';
import 'package:shop_ui/features/auth/domain/models/login.model.dart';
import 'package:shop_ui/features/auth/domain/models/register.model.dart';

class AuthRemoteDatasource {
  late AuthlocalDatasource _authlocalDatasource;

  AuthRemoteDatasource(AuthlocalDatasource authlocalDatasource) {
    _authlocalDatasource = authlocalDatasource;
  }

  Future<Response> login(LoginModel loginModel) async {
    String? token = await _authlocalDatasource.getUserToken();

    final response = await post(
      Uri.parse('${Config.url}/login'),
      body: jsonEncode({
        'shopId': loginModel.shopId,
        'empId': loginModel.empId,
        'password': loginModel.password,
      }),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        print(data);
        _authlocalDatasource.saveToken(data['authorization']['token']);
        return response;
      case 500:
        throw ('Can\'t login! Something went wrong!');

      default:
        throw (data['message']);
    }
  }

  Future<Response> register(RegisterModel registerModel) async {
    String? token = await _authlocalDatasource.getUserToken();

    final response = await post(
      Uri.parse('${Config.url}/register'),
      body: jsonEncode({
        'shopId': registerModel.shopId,
        'empId': registerModel.empId,
        'lastName': registerModel.lastName,
        'firstName': registerModel.firstName,
        'middleName': registerModel.middleName,
        'password': registerModel.password,
        'status': registerModel.status,
        'dateHired': registerModel.dateHired,
        'salary': registerModel.salary,
        'notes': registerModel.notes,
        'remark': registerModel.remark,
      }),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        _authlocalDatasource.saveToken(data['authorization']['token']);
        _authlocalDatasource.getUser();
        return response;
      case 500:
        throw ('Can\'t register! Something went wrong!');

      default:
        throw (data['message']);
    }
  }

  Future<Response> logout() async {
    String? token = await _authlocalDatasource.getUserToken();
    final response = await post(
      Uri.parse('${Config.url}/logout'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        _authlocalDatasource.deleteToken();
        return response;
      case 500:
        throw ('Can\'t logout! Something went wrong!');
      default:
        throw (data['message']);
    }
  }
}
