// import 'package:shop_ui/features/auth/domain/models/auth_restriction.model.dart';

class AuthModel {
  final int id;
  final String shopId;
  final String empId;
  final String lastName;
  final String firstName;
  final String middleName;
  // final String password;
  final List restriction;
  // final Restriction restriction;
  final String status;
  final String dateHired;
  final String salary;
  final String notes;
  final String remark;
//TODO: Model for restriction and connect authModel and restrictionModel

  AuthModel({
    required this.id,
    required this.shopId,
    required this.empId,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    // required this.password,
    required this.restriction,
    required this.status,
    required this.dateHired,
    required this.salary,
    required this.notes,
    required this.remark,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      shopId: json['shopId'],
      empId: json['empId'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      // password: json['password'],
      restriction: json['restriction'],
      // restriction: Restriction.fromJson(json['restriction']),
      status: json['status'],
      dateHired: json['dateHired'],
      salary: json['salary'],
      notes: json['notes'],
      remark: json['remark'],
    );
  }
//AYAW LANG SA NI DELETE-TA
  // factory AuthModel.fromMap(Map<String, dynamic> json) {
  //   return AuthModel(
  //     id: json['id'] as int,
  //     branchId: json['branchId'] as String,
  //     empId: json['empId'] as String,
  //     lastName: json['lastName'] as String,
  //     firstName: json['firstName'] as String,
  //     middleName: json['middleName'] as String,
  //     password: json['password'] as String,
  //     status: json['status'] as String,
  //     dateHired: json['dateHired'] as DateTime,
  //     salary: json['salary'] as double,
  //     notes: json['notes'] as String,
  //     remark: json['remark'] as String,
  //   );
  // }
}
