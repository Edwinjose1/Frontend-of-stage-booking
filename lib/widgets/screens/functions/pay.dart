

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:user_side_app/main.dart';

import 'function_class.dart';

class Pay {
  final String userId;
  final String productid;
  final String price;
  final String address;
  final String phoneNumber;
  final DateTime? dateselected;
  final bool isConfirmed;
   Pay({required this.isConfirmed,required this.userId,required this.productid,required this.price,required this.address,required this.phoneNumber,required this.dateselected});
  

  

  Razorpay razorpay = Razorpay();


  paymentmodel() {
    var options = {
      'key': 'rzp_test_FXs5QJNU6J151U',
      'amount': (int.parse(price) + 200) * 100,
      'name': 'EventHive',
      'description': int.parse(price) + 200 * 100,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9074961559', 'email': 'edwinjose82429@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void handlePaymentErrorResponse(
      PaymentFailureResponse response, BuildContext context) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
  log(response.toString());

  BuildContext context = Navigator.of(navigatorKey.currentContext!).context;


  addToMyorder(
    context: context, 
    userId: userId,
    totalamount: price,
    paymethod: "Direct",
    productId: productid,
    address: address,
    phoneNumber: phoneNumber,
    date: dateselected,
    isConfirmed: false
  );
}


  void handleExternalWalletSelected(
      ExternalWalletResponse response, BuildContext context) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }
 
}
