// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../../model/order_model.dart';



//  Future<void> addOrder({required OrderedProduct orderModel,required this.userId}) async {
//   final String userId;
//     final userdoc = FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('order')
//         .doc(orderModel.id);
//           final json = orderModel.toJson();
//             await userdoc.set(json);
//   log('product added to order');
//   }

// removeFromorder({required String id}) {
//   final docProduct = FirebaseFirestore.instance
//       .collection('users')
//       .doc(userId)
//       .collection('order')
//       .doc(id);
//   docProduct.delete();
// }


  