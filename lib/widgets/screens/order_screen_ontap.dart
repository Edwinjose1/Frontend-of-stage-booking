import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/core/colours.dart';
import 'package:user_side_app/widgets/screens/stageof_card.dart';

class OrderScreenontap extends StatefulWidget {
   OrderScreenontap({
    Key? key,
    required  this.address,
    required this.date,
    required this.paymethod,
    required this.phoneNumber,
    required this.productId,
    required this.isConfirmed,
    required this.totalamount,
  }) : super(key: key);

  final String address;
  final bool isConfirmed;
  final String paymethod;
  final String date;
  final String phoneNumber;
  final String productId;
  final String totalamount;

  @override
  State<OrderScreenontap> createState() => _OrderScreenontapState();
}

class _OrderScreenontapState extends State<OrderScreenontap> {
  List<Product> _allProducts = []; // Initialize as an empty list
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    List<Product> products = await getAllProducts();
    setState(() {
      _allProducts = products;
      _filterProducts(widget.productId); // Move the filtering call here
    });
  }

  void _filterProducts(String productid) {
    setState(() {
      _filteredProducts =
          _allProducts.where((product) => product.id == productid).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
          backgroundColor: kPink,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'Product ID',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(widget.productId),
                  ),
                  ListTile(
                    title: Text(
                      'Total Amount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(widget.totalamount),
                  ),
                  ListTile(
                    title: Text(
                      'Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(widget.address),
                  ),
                  ListTile(
                    title: Text(
                      'Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(widget.date),
                  ),
                  ListTile(
                    title: Text(
                      'Payment Method',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(widget.paymethod),
                  ),
                  ListTile(
                    title: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(widget.phoneNumber),
                  ),
                  SizedBox(height: 16), // Add some spacing
                  buildProductList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductList() {
    if (_filteredProducts.isEmpty) {
      return Text('No products found');
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _filteredProducts.map((product) {
          return buildProduct(product);
        }).toList(),
      );
    }
  }

  Widget buildProduct(Product product) => InkWell(
        onTap: () {
          // Handle onTap action if needed
        },
        child: Stagecard(
          id: product.id,
          subcategory: product.subcategory,
          rating: 4,
          price: product.price,
          imageUrls: product.imageUrls,
          category: product.category,
          description: product.description,
        ),
      );

  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];

    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      snapshot.docs.forEach((DocumentSnapshot doc) {
        Product product = Product.fromJson(doc.data() as Map<String, dynamic>);
        products.add(product);
      });
    } catch (error) {
      print('Error getting products: $error');
    }

    return products;
  }
}

class Product {
  final String subcategory;
  final String category;
  final String description;
  final String price;
  final String note;
  final String id;
  final List<String> imageUrls;

  Product({
    required this.subcategory,
    required this.id,
    required this.category,
    required this.description,
    required this.price,
    required this.note,
    required this.imageUrls,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        category: json['category'],
        subcategory: json['subcategory'],
        description: json['description'],
        price: json['price'],
        id: json['id'],
        note: json['note'],
        imageUrls: (json['imageUrls'] as List<dynamic>?)
                ?.map((imageUrl) => imageUrl as String)
                .toList() ??
            [],
      );
}
