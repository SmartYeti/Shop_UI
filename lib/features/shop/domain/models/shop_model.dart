class ShopModel {
  final int id;
  final String shopId;
  final String shopName;
  final String address1;
  final String address2;
  final String notes;
  final String remark;

  ShopModel({
    required this.id,
    required this.shopId,
    required this.shopName,
    required this.address1,
    required this.address2,
    required this.notes,
    required this.remark,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json['id'],
      shopId: json['shopId'],
      shopName: json['shopName'],
      address1: json['address1'],
      address2: json['address2'],
      notes: json['notes'],
      remark: json['remark'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shopId': shopId,
      'shopName': shopName,
      'address1': address1,
      'address2': address2,
      'notes': notes,
      'remark': remark,
    };
  }
}
