class Product {
  Product({
    this.name,
    this.sellingPrice,
    this.barCode,
    this.quantity,
    this.purchasePrice,
    this.user,
    this.id,
    this.createdAt,
    this.v,
  });

  String? name;
  int? sellingPrice;
  String? barCode;
  int? quantity;
  String? user;
  String? id;
  DateTime? createdAt;
  int? v;
  int? purchasePrice;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        name: json["name"],
        sellingPrice: json["sellingPrice"],
        barCode: json["barCode"],
        quantity: json["quantity"],
        purchasePrice: json['purchasePrice'],
        user: json["user"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "sellingPrice": sellingPrice,
        "barCode": barCode,
        "quantity": quantity,
        "user": user,
        "_id": id,
        'purchasePrice': purchasePrice,
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
      };
}
