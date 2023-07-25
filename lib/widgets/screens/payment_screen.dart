import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:user_side_app/widgets/core/colours.dart';
import 'package:user_side_app/widgets/mainwidgets/total_amount.dart';

import 'functions/function_class.dart';
import 'functions/pay.dart';

class Paymentscreen extends StatefulWidget {
  Paymentscreen({Key? key, required this.productid, required this.price})
      : super(key: key);

  final String productid;
  final String price;

  @override
  _PaymentscreenState createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  bool isAddressError = false;
  bool isPhoneNumberError = false;
  late String userId;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  late DocumentReference currentUserDoc;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    final User? user = _auth.currentUser;
    userId = user?.uid ?? '';
    currentUserDoc = usersCollection.doc(userId);

    // Fetch and set the existing address and phone number
    currentUserDoc.get().then((snapshot) {
      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;
        var address = data['address'] as String?;
        var phoneNumber = data['phone_number'] as String?;

        setState(() {
          addressController.text = address ?? '';
          phoneNumberController.text = phoneNumber ?? '';
        });
      }
    });
  }

  void removeFrommyorder() {
    final myorderCollection = FirebaseFirestore.instance
        .collection('myorder')
        .doc(userId)
        .collection('products');

    myorderCollection.doc(widget.productid).delete();
  }

  Stream<DocumentSnapshot> getmyorderStream() {
    return FirebaseFirestore.instance
        .collection('myorder')
        .doc(userId)
        .collection('products')
        .doc(widget.productid)
        .snapshots();
  }

  void showAddressPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Address'),
          content: TextField(
            controller: addressController,
            decoration: InputDecoration(
              hintText: 'Enter your address',
              // Remove underline
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                if (addressController.text.isNotEmpty) {
                  setState(() {
                    isAddressError = false;
                  });

                  await currentUserDoc.set(
                    {'address': addressController.text},
                    SetOptions(merge: true),
                  );

                  Navigator.of(context).pop();
                } else {
                  setState(() {
                    isAddressError = true;
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  void showPhoneNumberPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Phone Number'),
          content: TextField(
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            decoration: InputDecoration(
              hintText: 'Enter your phone number',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                if (phoneNumberController.text.isNotEmpty) {
                  setState(() {
                    isPhoneNumberError = false;
                  });

                  await currentUserDoc.set(
                    {'phone_number': phoneNumberController.text},
                    SetOptions(merge: true),
                  );

                  Navigator.of(context).pop();
                } else {
                  setState(() {
                    isPhoneNumberError = true;
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ??
          DateTime.now().add(Duration(
              days:
                  2)), // Use selectedDate if available, otherwise set initial date
      firstDate: DateTime.now().add(Duration(days: 2)), // Day after tomorrow
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });

      // Update the date in Firebase
      await currentUserDoc.set(
        {'date': selectedDate},
        SetOptions(merge: true),
      );
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    addressController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Success'),
          content:
              Text('Congratulations! Your order has been placed successfully.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                // Navigate to the home screen
                
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(

        title: Text(
          "Payment",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPink,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color.fromARGB(119, 40, 15, 37),
            ),
            height: 55,
            width: 30,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                Text(
                  'Delivery Address',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showAddressPopup(context);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[200],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          readOnly: true,
                                          controller: addressController,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: addressController
                                                    .text.isNotEmpty
                                                ? Colors.black
                                                : Colors.grey,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Tap to enter address',
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showAddressPopup(context);
                                          // Handle the edit button press here
                                          // For example, you can call a function to enable editing mode
                                        },
                                        icon: Icon(Icons.edit),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                if (isAddressError)
                  Text(
                    textAlign: TextAlign.center,
                    'Please enter a valid address',
                    style: TextStyle(color: kPink),
                  ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[200],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        readOnly: true,
                                        controller: phoneNumberController,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: phoneNumberController
                                                  .text.isNotEmpty
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Tap to enter phone number',
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit,color: Colors.black,),
                                      onPressed: () {
                                        showPhoneNumberPopup(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (isPhoneNumberError)
                  Text(
                    'Please enter a valid phone number',
                    style: TextStyle(color: Colors.red),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(kPink)),
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDate != null
                                ? 'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}'
                                : 'Select Date',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit,color: kWhite),
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

          
                SizedBox(height: 10,),
                Text(
                  'Payment details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Totalamount(price: widget.price),
                SizedBox(height: 5),
                Text(
                  "Select a payment method",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () async {
                    if (addressController.text.isNotEmpty &&
                        phoneNumberController.text.isNotEmpty &&
                        selectedDate != null) {
                      addToMyorder(
                          userId: userId,
                          context: context,
                          totalamount: widget.price,
                          paymethod: "Direct",
                          productId: widget.productid,
                          address: addressController.text,
                          phoneNumber: phoneNumberController.text,
                          date: selectedDate,
                          isConfirmed: false);
                    } else {
                      setState(() {
                        isAddressError = addressController.text.isEmpty;
                        isPhoneNumberError = phoneNumberController.text.isEmpty;
                      });

                      if (selectedDate == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Missing Date'),
                              content: Text(
                                  'Please select a date before placing the order.'),
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
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kapptheam,
                    ),
                    height: 50,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://st2.depositphotos.com/1031343/6862/v/950/depositphotos_68629709-stock-illustration-cash-on-delivery-label-sticker.jpg',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Cash on Delivery',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    if (addressController.text.isNotEmpty &&
                        phoneNumberController.text.isNotEmpty) {
                      // Proceed to payment method
                      Pay(
                        isConfirmed: false,
                        address: addressController.text,
                        dateselected: selectedDate,
                        phoneNumber: phoneNumberController.text,
                        price: widget.price,
                        productid: widget.productid,
                        userId: userId,
                      ).paymentmodel();
                    } else {
                      setState(() {
                        isAddressError = addressController.text.isEmpty;
                        isPhoneNumberError = phoneNumberController.text.isEmpty;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kapptheam,
                    ),
                    height: 50,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://yt3.ggpht.com/ytc/AMLnZu8hEuwIDjx39XqXih5os_s6PVzgsptnGb8Q1tkKvw=s900-c-k-c0x00ffffff-no-rj',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Razorpay',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
