import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/Screens/add_cart_screen.dart';
import 'package:user_side_app/widgets/Screens/payment_screen.dart';
import 'package:user_side_app/widgets/core/colours.dart';

class BuyAndCart extends StatefulWidget {
  final String productid;
  final String price;
  const BuyAndCart({
    super.key,
    required this.productid,
    required this.price,
  });

  @override
  State<BuyAndCart> createState() => _BuyAndCartState();
}

class _BuyAndCartState extends State<BuyAndCart> {
  late String userId;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final User? user = _auth.currentUser;
    userId = user?.uid ?? '';
  }

  void addToCart(BuildContext context) {
  final favoritesCollection = FirebaseFirestore.instance
      .collection('cart')
      .doc(userId)
      .collection('products');

  favoritesCollection.doc(widget.productid).set({}).then((_) {
    final snackBar = SnackBar(
      content: Text('Item added to cart'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });
}








  Stream<DocumentSnapshot> getCartStream() {
    return FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('products')
        .doc(widget.productid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: getCartStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          bool isinCart = snapshot.hasData && snapshot.data!.exists;
          return Container(
              height: 60,
              color: Colors.black,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kapptheam,
                        onPrimary: Colors.white,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                        minimumSize: Size(150, 60),
                      ),
                      onPressed: () {
                        setState(() {
                          if (isinCart) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CartScreen(userId: userId,)));
                          } else {
                            addToCart(context);
                          }
                        });
                      },
                      child: Text(
                        isinCart ? "Go to cart" : 'Add to cart',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPink,
                        onPrimary: Colors.white,
                        shadowColor: Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(),
                        minimumSize: Size(150, 60),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Paymentscreen(productid:widget.productid,price: widget.price,)));
                      },
                      child: Text(
                        'Book Now',
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
