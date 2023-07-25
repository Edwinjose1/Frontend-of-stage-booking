import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/core/colours.dart';
import 'package:user_side_app/widgets/screens/stageof_card.dart';





class FavoriteScreen extends StatelessWidget {
  final String? userId;

  FavoriteScreen({required this.userId});

  int rating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
         leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white
            ),
            height: 55,
            width: 55,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        
        backgroundColor: kPink,
        title: Text('Favorites'),
      
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: readFavorites(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong: ${snapshot.error}");
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              final favoriteProductIds =
                  snapshot.data!.docs.map((doc) => doc.id).toList();

              return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: readProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong: ${snapshot.error}");
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    final products = snapshot.data!.docs
                        .map((doc) => Product.fromJson(doc.data()))
                        .toList();

                    final favoriteProducts = products
                        .where((product) =>
                            favoriteProductIds.contains(product.id))
                        .toList();

                    return GridView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: favoriteProducts.length,
                      itemBuilder: (context, index) {
                        final product = favoriteProducts[index];
                        return buildProduct(product);
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildProduct(Product product) => InkWell(
        onTap: () {
          // Handle product tap
        },
        child: Stagecard(
          id: product.id,
          subcategory: product.subcategory,
          rating: rating,
          price: product.price,
          imageUrls: product.imageUrls,
          category: product.category,
          description: product.description,
        ),
      );

  Stream<QuerySnapshot<Map<String, dynamic>>> readFavorites() =>
      FirebaseFirestore.instance
          .collection('favorites')
          .doc(userId)
          .collection('products')
          .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> readProducts() =>
      FirebaseFirestore.instance.collection('products').snapshots();
}

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

