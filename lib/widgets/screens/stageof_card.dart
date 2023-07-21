// // import 'package:flutter/material.dart';

// // import 'card_tap_screen.dart';

// // class Stagecard extends StatelessWidget {
// //   final String price;

// //   final List<String> imageUrls;
// //   final int rating;
// //   final String category;
// //   final String subcategory;
// //   final String description;

// //   const Stagecard({
// //     required this.price,
// //     required this.subcategory,
    
// //     required this.imageUrls,
// //     required this.rating,
// //     required this.category,
// //     required this.description,

// //     Key? key,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     print("Edwin jose");
// //     return InkWell(
// //       onTap: () => Navigator.of(context).push(
// //         MaterialPageRoute(builder: (context) => CardonTapScreen(category:category,description: description,imageUrls:imageUrls,price:price,rating:rating,)),
// //       ),
// //       child: Padding(
         
// //         padding: const EdgeInsets.all(8.0),
// //         child: Container(
// //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.lightGreen),
          
// //           width: 250,
// //           height: 250,
          
// //           child: Column(
// //             children: [
// //               Expanded(
// //                 child: Stack(
// //                   children: [
// //                     Container(
// //                       // decoration:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))) ,
// //                       decoration:  BoxDecoration(
// //               image: DecorationImage(
// //                   image: NetworkImage(imageUrls[0]), fit: BoxFit.cover),
// //               borderRadius: BorderRadius.only(bottomLeft: Radius.zero,bottomRight: Radius.zero,topLeft: Radius.circular(20),topRight: Radius.circular(20)),
// //             ),
// //                       height: 300,
// //                       width:double.infinity,
// //                       // child: Image.network(
                        
// //                       //   imageUrls[0],
// //                       //   fit: BoxFit.cover,
// //                       // ),
// //                     ),
// //                     Positioned(
// //                       top: 0,
// //                       right: 0,
// //                       child: SizedBox(
// //                         width: 140,
// //                         height: 50,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 8,
// //               ),
// //               Row(
// //                 children: [
// //                   SizedBox(
// //                     width: 10,
// //                   ),
// //                   Expanded(
// //                     child: Container(
// //                       alignment: Alignment.centerLeft,
// //                       child: Text(
                        
// //                         subcategory,
// //                         style: TextStyle(
// //                           fontSize: 11,
// //                           fontWeight: FontWeight.w500,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 30,
// //                   ),
// //                   Container(
// //                     alignment: Alignment.centerRight,
// //                     height: 20,
// //                     decoration: BoxDecoration(
// //                       color: Colors.green,
// //                       borderRadius: BorderRadius.circular(6),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.grey.withOpacity(0.3),
// //                           spreadRadius: 2,
// //                           blurRadius: 4,
// //                           offset: Offset(0, 2),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Padding(
// //                       padding: EdgeInsets.all(4),
// //                       child: Row(
// //                         children: [
// //                           Text(
// //                             "$rating",
// //                             style: TextStyle(
// //                               fontSize: 12,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           SizedBox(width: 2),
// //                           Icon(
// //                             Icons.star,
// //                             size: 14,
// //                             color: Colors.white,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(width: 10,)
// //                 ],
// //               ),
// //               SizedBox(height: 8),
// //               Row(
// //                 children: [
// //                   SizedBox(
// //                     width: 10,
// //                   ),
// //                   Text(
// //                     "Rs: $price",
// //                     style: TextStyle(
// //                       fontSize: 15,
// //                       fontWeight: FontWeight.w600,
// //                       color: Color.fromARGB(255, 247, 246, 246)
// //                     ),
// //                   ),
// //                    Expanded(
// //                     child: Container(
// //                       alignment: Alignment.centerRight,
// //                       child:Icon(Icons.favorite_border_outlined)
// //                     ),
// //                   ),
// //                   SizedBox(width: 50,)
                 
// //                 ],
// //               ),
// //                SizedBox(height: 10,)
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';

// // import 'card_tap_screen.dart';

// // class Stagecard extends StatefulWidget {
// //   final String price;
// //   final List<String> imageUrls;
// //   final int rating;
// //   final String category;
// //   final String subcategory;
// //   final String description;

// //   const Stagecard({
// //     required this.price,
// //     required this.subcategory,
// //     required this.imageUrls,
// //     required this.rating,
// //     required this.category,
// //     required this.description,
// //     Key? key,
// //   }) : super(key: key);

// //   @override
// //   _StagecardState createState() => _StagecardState();
// // }

// // class _StagecardState extends State<Stagecard> {
// //   bool isFavorite = false;

// //   void addToFavorites() {
// //     final userId = 'USER_ID'; // Replace with the actual user ID

// //     final favoritesCollection = FirebaseFirestore.instance
// //         .collection('favorites')
// //         .doc(userId)
// //         .collection('product');

// //     favoritesCollection.doc(widget.subcategory).set({});
// //   }

// //   void removeFromFavorites() {
// //     final userId = 'USER_ID'; // Replace with the actual user ID

// //     final favoritesCollection = FirebaseFirestore.instance
// //         .collection('favorites')
// //         .doc(userId)
// //         .collection('product');

// //     favoritesCollection.doc(widget.subcategory).delete();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: () => Navigator.of(context).push(
// //         MaterialPageRoute(
// //           builder: (context) => CardonTapScreen(
// //             category: widget.category,
// //             description: widget.description,
// //             imageUrls: widget.imageUrls,
// //             price: widget.price,
// //             rating: widget.rating,
// //           ),
// //         ),
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Container(
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(20),
// //             color: Colors.lightGreen,
// //           ),
// //           width: 250,
// //           height: 250,
// //           child: Column(
// //             children: [
// //               Expanded(
// //                 child: Stack(
// //                   children: [
// //                     Container(
// //                       decoration: BoxDecoration(
// //                         image: DecorationImage(
// //                           image: NetworkImage(widget.imageUrls[0]),
// //                           fit: BoxFit.cover,
// //                         ),
// //                         borderRadius: BorderRadius.only(
// //                           bottomLeft: Radius.zero,
// //                           bottomRight: Radius.zero,
// //                           topLeft: Radius.circular(20),
// //                           topRight: Radius.circular(20),
// //                         ),
// //                       ),
// //                       height: 300,
// //                       width: double.infinity,
// //                     ),
// //                     Positioned(
// //                       top: 0,
// //                       right: 0,
// //                       child: SizedBox(
// //                         width: 140,
// //                         height: 50,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 8),
// //               Row(
// //                 children: [
// //                   SizedBox(width: 10),
// //                   Expanded(
// //                     child: Container(
// //                       alignment: Alignment.centerLeft,
// //                       child: Text(
// //                         widget.subcategory,
// //                         style: TextStyle(
// //                           fontSize: 11,
// //                           fontWeight: FontWeight.w500,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(width: 30),
// //                   Container(
// //                     alignment: Alignment.centerRight,
// //                     height: 20,
// //                     decoration: BoxDecoration(
// //                       color: Colors.green,
// //                       borderRadius: BorderRadius.circular(6),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.grey.withOpacity(0.3),
// //                           spreadRadius: 2,
// //                           blurRadius: 4,
// //                           offset: Offset(0, 2),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Padding(
// //                       padding: EdgeInsets.all(4),
// //                       child: Row(
// //                         children: [
// //                           Text(
// //                             "${widget.rating}",
// //                             style: TextStyle(
// //                               fontSize: 12,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';

// // import 'card_tap_screen.dart';

// // class Stagecard extends StatefulWidget {
// //   final String price;
// //   final List<String> imageUrls;
// //   final int rating;
// //   final String category;
// //   final String subcategory;
// //   final String description;
// //   final String id;

// //   const Stagecard({
// //     required this.id,
// //     required this.price,
// //     required this.subcategory,
// //     required this.imageUrls,
// //     required this.rating,
// //     required this.category,
// //     required this.description,
// //     Key? key,
// //   }) : super(key: key);

// //   @override
// //   _StagecardState createState() => _StagecardState();
// // }

// // class _StagecardState extends State<Stagecard> {
// //   bool isFavorite = false;
// //    late String userId; // Declare user
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// // @override
// //   void initState() {
// //     super.initState();
// //     final User? user = _auth.currentUser;
// //     userId = user?.uid ?? ''; // Retrieve the user ID or an empty string if the user is not authenticated
// //   }
// // // Inside a method or a function where you want to retrieve the user ID



// //   // final String userId = 'USER_ID'; // Replace with the actual user ID

// //   void addToFavorites() {
// //     final favoritesCollection = FirebaseFirestore.instance
// //         .collection('favorites')
// //         .doc(userId)
// //         .collection('products');

// //     favoritesCollection.doc(widget.id).set({});
// //   }

// //   void removeFromFavorites() {
// //     final favoritesCollection = FirebaseFirestore.instance
// //         .collection('favorites')
// //         .doc(userId)
// //         .collection('products');

// //     favoritesCollection.doc(widget.id).delete();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: () => Navigator.of(context).push(
// //         MaterialPageRoute(
// //           builder: (context) => CardonTapScreen(
// //             category: widget.category,
// //             description: widget.description,
// //             imageUrls: widget.imageUrls,
// //             price: widget.price,
// //             rating: widget.rating,
// //           ),
// //         ),
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Container(
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(20),
// //             color: Colors.lightGreen,
// //           ),
// //           width: 250,
// //           height: 250,
// //           child: Column(
// //             children: [
// //               Expanded(
// //                 child: Stack(
// //                   children: [
// //                     Container(
// //                       decoration: BoxDecoration(
// //                         image: DecorationImage(
// //                           image: NetworkImage(widget.imageUrls[0]),
// //                           fit: BoxFit.cover,
// //                         ),
// //                         borderRadius: BorderRadius.only(
// //                           bottomLeft: Radius.zero,
// //                           bottomRight: Radius.zero,
// //                           topLeft: Radius.circular(20),
// //                           topRight: Radius.circular(20),
// //                         ),
// //                       ),
// //                       height: 300,
// //                       width: double.infinity,
// //                     ),
// //                     Positioned(
// //                       top: 0,
// //                       right: 0,
// //                       child: SizedBox(
// //                         width: 140,
// //                         height: 50,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 8),
// //               Row(
// //                 children: [
// //                   SizedBox(width: 10),
// //                   Expanded(
// //                     child: Container(
// //                       alignment: Alignment.centerLeft,
// //                       child: Text(
// //                         widget.subcategory,
// //                         style: TextStyle(
// //                           fontSize: 11,
// //                           fontWeight: FontWeight.w500,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(width: 30),
// //                   Container(
// //                     alignment: Alignment.centerRight,
// //                     height: 20,
// //                     decoration: BoxDecoration(
// //                       color: Colors.green,
// //                       borderRadius: BorderRadius.circular(6),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.grey.withOpacity(0.3),
// //                           spreadRadius: 2,
// //                           blurRadius: 4,
// //                           offset: Offset(0, 2),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Padding(
// //                       padding: EdgeInsets.all(4),
// //                       child: Row(
// //                         children: [
// //                           Text(
// //                             "${widget.rating}",
// //                             style: TextStyle(
// //                               fontSize: 12,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           SizedBox(width: 2),
// //                           Icon(
// //                             Icons.star,
// //                             size: 14,
// //                             color: Colors.white,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(width: 10),
// //                 ],
// //               ),
// //               SizedBox(height: 8),
// //               Row(
// //                 children: [
// //                   SizedBox(width: 10),
// //                   Text(
// //                     "Rs: ${widget.price}",
// //                     style: TextStyle(
// //                       fontSize: 15,
// //                       fontWeight: FontWeight.w600,
// //                       color: Color.fromARGB(255, 247, 246, 246),
// //                     ),
// //                   ),
// //                   Expanded(
// //                     child: Container(
// //                       alignment: Alignment.centerRight,
// //                       child: InkWell(
// //                         onTap: () {
// //                           setState(() {
// //                             isFavorite = !isFavorite;
// //                             if (isFavorite) {
// //                               addToFavorites();
// //                             } else {
// //                               removeFromFavorites();
// //                             }
// //                           });
// //                         },
// //                         child: Icon(
// //                           isFavorite
// //                               ? Icons.favorite
// //                               : Icons.favorite_border_outlined,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(width: 50),
// //                 ],
// //               ),
// //               SizedBox(height: 10),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'card_tap_screen.dart';

// class Stagecard extends StatefulWidget {
//   final String price;
//   final List<String> imageUrls;
//   final int rating;
//   final String category;
//   final String subcategory;
//   final String description;
//   final String id;

//   const Stagecard({
//     required this.id,
//     required this.price,
//     required this.subcategory,
//     required this.imageUrls,
//     required this.rating,
//     required this.category,
//     required this.description,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _StagecardState createState() => _StagecardState();
// }

// class _StagecardState extends State<Stagecard> {
//   bool isFavorite = false;
//   late String userId; // Declare user
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     final User? user = _auth.currentUser;
//     userId = user?.uid ?? ''; // Retrieve the user ID or an empty string if the user is not authenticated
//     checkIfFavorite();
//   }

//   void checkIfFavorite() {
//     final favoritesCollection = FirebaseFirestore.instance
//         .collection('favorites')
//         .doc(userId)
//         .collection('products');

//     favoritesCollection.doc(widget.id).get().then((snapshot) {
//       if (snapshot.exists) {
//         setState(() {
//           isFavorite = true;
//         });
//       } else {
//         setState(() {
//           isFavorite = false;
//         });
//       }
//     });
//   }

//   void addToFavorites() {
//     final favoritesCollection = FirebaseFirestore.instance
//         .collection('favorites')
//         .doc(userId)
//         .collection('products');

//     favoritesCollection.doc(widget.id).set({}).then((_) {
//       setState(() {
//         isFavorite = true;
//       });
//     });
//   }

//   void removeFromFavorites() {
//     final favoritesCollection = FirebaseFirestore.instance
//         .collection('favorites')
//         .doc(userId)
//         .collection('products');

//     favoritesCollection.doc(widget.id).delete().then((_) {
//       setState(() {
//         isFavorite = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => CardonTapScreen(
//             category: widget.category,
//             description: widget.description,
//             imageUrls: widget.imageUrls,
//             price: widget.price,
//             rating: widget.rating,
//           ),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.lightGreen,
//           ),
//           width: 250,
//           height: 250,
//           child: Column(
//             children: [
//               Expanded(
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(widget.imageUrls[0]),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.zero,
//                           bottomRight: Radius.zero,
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                       ),
//                       height: 300,
//                       width: double.infinity,
//                     ),
//                     Positioned(
//                       top: 0,
//                       right: 0,
//                       child: SizedBox(
//                         width: 140,
//                         height: 50,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         widget.subcategory,
//                         style: TextStyle(
//                           fontSize: 11,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 30),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     height: 20,
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(6),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           spreadRadius: 2,
//                           blurRadius: 4,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(4),
//                       child: Row(
//                         children: [
//                           Text(
//                             "${widget.rating}",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(width: 2),
//                           Icon(
//                             Icons.star,
//                             size: 14,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   SizedBox(width: 10),
//                   Text(
//                     "Rs: ${widget.price}",
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromARGB(255, 247, 246, 246),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.centerRight,
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             isFavorite = !isFavorite;
//                             if (isFavorite) {
//                               addToFavorites();
//                             } else {
//                               removeFromFavorites();
//                             }
//                           });
//                         },
//                         child: Icon(
//                           isFavorite
//                               ? Icons.favorite
//                               : Icons.favorite_border_outlined,
//                           color: isFavorite ? Colors.black : null,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 50),
//                 ],
//               ),
//               SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'card_tap_screen.dart';

class Stagecard extends StatefulWidget {
  final String price;
  final List<String> imageUrls;
  final int rating;
  final String category;
  final String subcategory;
  final String description;
  final String id;

  const Stagecard({
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
  _StagecardState createState() => _StagecardState();
}

class _StagecardState extends State<Stagecard> {
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

  void removeFromFavorites() {
    final favoritesCollection = FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('products');

    favoritesCollection.doc(widget.id).delete();
  }

  Stream<DocumentSnapshot> getFavoritesStream() {
    return FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('products')
        .doc(widget.id)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: getFavoritesStream(),
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
                        Positioned(
                          top: 0,
                          right: 0,
                          child: SizedBox(
                            width: 140,
                            height: 50,
                          ),
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
                                if (isFavorite) {
                                  removeFromFavorites();
                                } else {
                                  addToFavorites();
                                }
                              });
                            },
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: isFavorite ? Colors.black : null,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
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
