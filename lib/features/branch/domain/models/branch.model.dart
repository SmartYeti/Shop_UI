class BranchModel {
  final int id;
  final String shopId;
  final String branchId;
  final String branchName;
  final String address1;
  final String address2;
  final String dateOpened;
  final String type;
  final String notes;
  final String remark;

  BranchModel({
    required this.id,
    required this.shopId,
    required this.branchId,
    required this.branchName,
    required this.address1,
    required this.address2,
    required this.dateOpened,
    required this.type,
    required this.notes,
    required this.remark,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'], 
      shopId: json['shopId'], 
      branchId: json['branchId'], 
      branchName: json['branchName'], 
      address1: json['address1'], 
      address2: json['address2'], 
      dateOpened: json['dateOpened'], 
      type: json['type'], 
      notes: json['notes'], 
      remark: json['remark'],
      );
  }
}