class Product {
  final String id;
  final String subcategory;
  final String price;
  final List<String> imageUrls;
  final String category;
  final String description;

  Product({
    required this.id,
    required this.subcategory,
    required this.price,
    required this.imageUrls,
    required this.category,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      subcategory: json['subcategory'],
      price: json['price'],
      imageUrls: List<String>.from(json['imageUrls']),
      category: json['category'],
      description: json['description'],
    );
  }
}