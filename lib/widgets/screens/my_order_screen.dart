import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_side_app/widgets/core/colours.dart';

import 'order_screen_ontap.dart';

class MyOrderScreen extends StatelessWidget {
  final String? userId;

  MyOrderScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
        backgroundColor: kPink,
      ),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('myorder')
              .doc(userId)
              .collection('products')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            final filteredDocs = snapshot.data!.docs.where((doc) {
              final data = doc.data();
              return data['productId'] != null && data['totalamount'] != null;
            }).toList();

            if (filteredDocs.isEmpty) {
              return Center(child: Text('No data'));
            }

            final bookingDataList =
                filteredDocs.map((doc) => doc.data()).toList();
            log(bookingDataList.toString());

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: bookingDataList.length,
              itemBuilder: (context, index) {
                final data = bookingDataList[index];

                String productid = data['productId'] ?? '';
                String totalamount = data['totalamount'] ?? '';
                String address = data['address'] ?? '';
                Timestamp dateTimestamp = data['date'];
                String date =
                    _formatTimestamp(dateTimestamp); // Convert to String
                String paymethod = data['paymethod'] ?? '';
                String phoneNumber = data['phoneNumber'] ?? '';
                bool isConfirmed = data['isConfirmed'] ?? false;

                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OrderScreenontap(
                          isConfirmed: isConfirmed,
                          address: address,
                          date: date.toString(),
                          paymethod: paymethod,
                          phoneNumber: phoneNumber,
                          productId: productid,
                          totalamount: totalamount,
                        ),
                      ));
                    },
                    tileColor: kapptheam,
                    title: Text(
                      productid,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: kPink),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'Total Amount: $totalamount',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Date: $date',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isConfirmed ? 'Confirmed' : 'Pending',
                          style: TextStyle(
                            fontSize: 16,
                            color: isConfirmed ? kWhite : kPink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    // Convert Timestamp to DateTime
    DateTime dateTime = timestamp.toDate();

    // Format DateTime to a readable date string (e.g., '2023-07-18 12:30:00')
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> readMyOrder(String userId) =>
    FirebaseFirestore.instance
        .collectionGroup('products')
        .where('userId', isEqualTo: userId)
        .snapshots();
