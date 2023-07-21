import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/Screens/card_tap_screen.dart';



class CardofStage extends StatefulWidget {
  final String price;
  final List<String> imageUrls;
  final int rating;
  final String category;
  final String subcategory;
  final String description;
  final String id;

  const CardofStage({
    required this.id,
    required this.price,
    required this.subcategory,
    required this.imageUrls,
    required this.rating,
    required this.category,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  __CardofStageState createState() => __CardofStageState();
}

class __CardofStageState extends State<CardofStage> {
  late String userId;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final User? user = _auth.currentUser;
    userId = user?.uid ?? '';
  }

  void addToFavorites() {
    final favoritesCollection = FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('products');

    favoritesCollection.doc(widget.id).set({});
  }

  // void removeFromCart() {
  //   final favoritesCollection = FirebaseFirestore.instance
  //       .collection('cart')
  //       .doc(userId)
  //       .collection('products');

  //   favoritesCollection.doc(widget.id).delete();
  // }

void removeFromCart() {
  final cartCollection = FirebaseFirestore.instance
      .collection('cart')
      .doc(userId)
      .collection('products');

  // final removedItem = Map<String, dynamic>.from(widget.toJson()); // Create a copy of the item data before deleting

  cartCollection.doc(widget.id).delete();

  // Show a snackbar to indicate the item removal
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Item removed from cart'),
    ),
  );
}

  Stream<DocumentSnapshot> getcartStream() {
    return FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('products')
        .doc(widget.id)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: getcartStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        bool isFavorite =
            snapshot.hasData && snapshot.data!.exists; // Check if the document exists

        return InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CardonTapScreen(
                id: widget.id,
                category: widget.category,
                description: widget.description,
                imageUrls: widget.imageUrls,
                price: widget.price,
                rating: widget.rating,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightGreen,
              ),
              width: 250,
              height: 250,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.imageUrls[0]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero,
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          height: 300,
                          width: double.infinity,
                        ),
                      
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.subcategory,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        alignment: Alignment.centerRight,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Text(
                                "${widget.rating}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 2),
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        "Rs: ${widget.price}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 247, 246, 246),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                removeFromCart();
                              });
                            },
                            child: Icon(Icons.delete
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      
                    
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
