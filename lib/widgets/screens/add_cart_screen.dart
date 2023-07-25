
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/core/colours.dart';
import 'package:user_side_app/widgets/favorite_screen.dart';
import 'package:user_side_app/widgets/mainwidgets/addtocart_cards.dart';


class CartScreen extends StatefulWidget {
  final String? userId;

  CartScreen({required this.userId});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int rating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPink,
        title: Text('Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: readCart(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong: ${snapshot.error}");
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              final cartproductid =
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

                    final cartproducts = products
                        .where((product) =>
                            cartproductid.contains(product.id))
                        .toList();

                    return Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: cartproducts.length,
                            itemBuilder: (context, index) {
                              final product = cartproducts[index];
                              return buildProduct(product);
                            },
                          ),
                        ),
                        Container(
                          color:kPink,
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total: ${calculateTotal(cartproducts)}',
                                style: TextStyle(
                                  color: kWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(kapptheam)),
                                onPressed: () {
                                  // Handle buy button click
                                },
                                child: Text('Buy'),
                              ),
                            ],
                          ),
                        ),
                      ],
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
        child: CardofStage(
          id: product.id,
          subcategory: product.subcategory,
          rating: rating,
          price: product.price,
          imageUrls: product.imageUrls,
          category: product.category,
          description: product.description,
        ),
      );

  Stream<QuerySnapshot<Map<String, dynamic>>> readCart() =>
      FirebaseFirestore.instance
          .collection('cart')
          .doc(widget.userId)
          .collection('products')
          .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> readProducts() =>
      FirebaseFirestore.instance.collection('products').snapshots();

  String calculateTotal(List<Product> products) {
    double total = 0;
    for (var product in products) {
      double price = double.tryParse(product.price) ?? 0;
      total += price;
    }
    return total.toStringAsFixed(2);
  }
}
