import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/screens/stageof_card.dart';



class StageGridviewCatagory
 extends StatelessWidget {
  final String? subcategory;
  final int rating = 4;

  StageGridviewCatagory
  ({this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10), // Adjust the top padding value as needed
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: readProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong: ${snapshot.error}");
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            final products = snapshot.data!.docs
                .map((doc) => Product.fromJson(doc.data()))
                .toList();

            if (subcategory != null) {
              // Filter products by subcategory
              final filteredProducts = products
                  .where((product) => product.subcategory == subcategory)
                  .toList();

              return GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return buildProduct(product);
                },
              );
            } else {
              // Display all products
              return GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return buildProduct(product);
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildProduct(Product product) => InkWell(
        onTap: () {
        
        },
        child: Stagecard(
          id: product.id,
          subcategory:product.subcategory,
          rating: rating,
          price: product.price,
          
          imageUrls: product.imageUrls,
          category: product.category,
          description: product.description,
        ),
      );

  Stream<QuerySnapshot<Map<String, dynamic>>> readProduct() =>
      FirebaseFirestore.instance.collection('products').snapshots();
}

class Product {
  final String category;
  final String subcategory;
  final String description;
  final String price;
final String id;
  final String note;
  final List<String> imageUrls;

  Product({
    required  this. id,
    required this.category,
   required this.subcategory,
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
    id:json['id'],
        note: json['note'],
        imageUrls: (json['imageUrls'] as List<dynamic>?)
                ?.map((imageUrl) => imageUrl as String)
                .toList() ??
            [],
      );
}
