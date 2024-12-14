class Product {
  final String id;
  final String name;
  final double price;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imagePath': imagePath,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      imagePath: map['imagePath'],
    );
  }
}
