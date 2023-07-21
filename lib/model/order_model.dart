class OrderedProduct {
  final String id;
  final String description;
  final String subcategory;
  final String category;
  final List<String> imageUrls;
  final String price;
  final bool isDelivered;
  final bool isCanceled;
  final String address;
  final int date;

  OrderedProduct({
    required this.id,
    required this.address,
    required this.subcategory,
    required this.price,
    required this.imageUrls,
    required this.category,
    required this.description,
    required this.date,
    required this.isCanceled,
    required this.isDelivered,
  });

  Map<String, dynamic> toJson() {
    return {
      'address':address,
      'id': id,
      'description': description,
      'subcategory': subcategory,
      'category': category,
      'imageUrls': imageUrls,
      'price': price,
      'isDelivered': isDelivered,
      'isCanceled': isCanceled,
      'date': date,
    };
  }

  static OrderedProduct fromJson(Map<String, dynamic> json) {
    return OrderedProduct(
      address: json['address'],
      id: json['id'],
      description: json['description'],
      subcategory: json['subcategory'],
      category: json['category'],
      imageUrls: List<String>.from(json['imageUrls']),
      price: json['price'],
      isDelivered: json['isDelivered'],
      isCanceled: json['isCanceled'],
      date: json['date'],
    );
  }
}
