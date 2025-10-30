class Garmentitem {
  final String name;
  final double unitPrice;
  final String imagePath;
  int quantity;

  Garmentitem({required this.name,required this.unitPrice,required this.imagePath, this.quantity=0});
  double get totalItemPrice => quantity*unitPrice;

  Map<String, dynamic> toJson() => {
    "name": name,
    "unitPrice":unitPrice,
    "imagePath":imagePath,
    "quantity": quantity
  };

  factory Garmentitem.fromJson(Map<String, dynamic> json) => Garmentitem(
    name: json["name"] as String, 
    unitPrice: json["unitPrice"] as double,
    imagePath: json["imagePath"] as String,
    quantity: json["quantity"] as int);
}