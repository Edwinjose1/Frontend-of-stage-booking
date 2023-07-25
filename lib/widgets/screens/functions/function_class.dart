
 
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/home_screen.dart';

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
     return AlertDialog(
  title: Text("Congratulations", style: TextStyle(color: Colors.red)),
  content: Text('Booking Confirmed!\nAdmin will confirm your order\nPlease wait for it!', style: TextStyle(color: Colors.green)),
  actions: [
    TextButton(
      child: Text('OK'),
      onPressed: () async {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
    ),
  ],
);

    },
  );
}

 String generateBookingId() {
    // Generate a unique booking ID using a combination of timestamp and random number
    DateTime now = DateTime.now();
    int timestamp = now.microsecondsSinceEpoch;
    int randomNumber = DateTime.now().millisecond;
    String bookingId = 'BOOK-$timestamp-$randomNumber';
    return bookingId;
  }
void addToMyorder({
  required String productId,
  required String address,
  required String phoneNumber,
  required DateTime? date,
  required String totalamount,
  required String paymethod,
  required bool isConfirmed,
 
  required BuildContext context,
  required String userId,
}) async {
  final myorderCollection = FirebaseFirestore.instance
      .collection('myorder')
      .doc(userId)
      .collection('products');

  // Check if the product is already booked on the selected date
  final QuerySnapshot querySnapshot = await myorderCollection
      .where('productId', isEqualTo: productId)
      .where('date', isEqualTo: date)
      .get();
  if (querySnapshot.docs.isNotEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cannot Book',style: TextStyle(color: Colors.red),),
          content: Text('This product is already booked on the selected date.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); 

              },
            ),
          ],
        );
      },
    );
    return; // Exit the method if the product is already booked
  }

  // Generate a new booking ID
String bookingId = generateBookingId();
  myorderCollection.doc(bookingId).set({
    'productId': productId,
    'userId':userId,
    'address': address,
    'phoneNumber': phoneNumber,
    'date': date,
    'totalamount': totalamount,
    'paymethod': paymethod,
      'bookingId': bookingId, 
    'isConfirmed': false, 
  });

  showAlertDialog(context);
// 
void addToMyorder({
  required String productId,
  required String address,
  required String phoneNumber,
  required DateTime? date,
  required String totalamount,
  required String paymethod,
  required bool isConfirmed,
  required BuildContext context,
  required String userId,
}) async {
  final myorderCollection = FirebaseFirestore.instance
      .collection('myorder')
      .doc(userId)
      .collection('products');

  // Check if the product is already booked on the selected date
  final QuerySnapshot querySnapshot = await myorderCollection
      .where('productId', isEqualTo: productId)
      .where('date', isEqualTo: date)
      .get();
  if (querySnapshot.docs.isNotEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cannot Booked',style: TextStyle(color: Colors.red),),
          content: Text('This product is already booked on the selected date.',),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return; // Exit the method if the product is already booked
  }

  // Generate a new booking ID
  String bookingId = generateBookingId();

  // Use the bookingId as the document ID while setting the data in Firestore
  myorderCollection.doc(bookingId).set({
    'bookingId': bookingId, // Add the bookingId inside the document
    'productId': productId,
    'address': address,
    'phoneNumber': phoneNumber,
    'date': date,
    'userId':userId,
    'totalamount': totalamount,
    'paymethod': paymethod,
    'isConfirmed': isConfirmed,
  });

  showAlertDialog(context);
}
}