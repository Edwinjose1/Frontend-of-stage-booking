// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInProvider extends ChangeNotifier{
//   final googleSignIn =GoogleSignIn();
//   GoogleSignInAccount? _user;
//   GoogleSignInAccount get user => _user!;
//   Future googleLogin() async{
//   print('number 1');
//     final googleUser =await googleSignIn.signIn();
//      print('number 2');
//     _user=googleUser;
     
//     final googleAuth=await googleUser!.authentication;
//     final credential=GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
      
//     );
//      print('number 3');
//     await FirebaseAuth.instance.signInWithCredential(credential);
//    notifyListeners();

//   }
// }
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_sign_in/google_sign_in.dart';

// // import '../../home_screen.dart';

// // class GoogleSignInProvider extends ChangeNotifier {
// //   final googleSignIn = GoogleSignIn();
// //   GoogleSignInAccount? _user;
// //   GoogleSignInAccount get user => _user!;

// //   Future googleLogin(BuildContext context) async {
// //     final googleUser = await googleSignIn.signIn();
// //     _user = googleUser;
// //     final googleAuth = await googleUser!.authentication;
// //     final credential = GoogleAuthProvider.credential(
// //       accessToken: googleAuth.accessToken,
// //       idToken: googleAuth.idToken,
// //     );
// //     await FirebaseAuth.instance.signInWithCredential(credential);

// //     // Navigate to the home screen
// //         Navigator.of(context).pushReplacement(
// //       MaterialPageRoute(builder: (context) => HomeScreen()),);

// //     notifyListeners();
// //   }
// // }
// // // import 'dart:developer';

// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_sign_in/google_sign_in.dart';

// // // import '../../home_screen.dart';

// // // class GoogleSignInProvider extends ChangeNotifier {
// // //   GoogleSignInAccount? _user;
// // //   GoogleSignInAccount get user => _user!;

// // //    googleLogin(BuildContext context) async {
// // //       final googleSignIn =  GoogleSignIn();

// // //     log('google sighn in calling');
    
// // //       final googleUser = await googleSignIn.signIn();
// // //       _user = googleUser;
// // //       final googleAuth = await googleUser!.authentication;
// // //           log('google sighn in calling credential');

// // //       final credential =  GoogleAuthProvider.credential(
// // //         accessToken: googleAuth.accessToken,
// // //         idToken: googleAuth.idToken,
// // //       );
// // //           log('google sighn in calling function');

// // //       await FirebaseAuth.instance.signInWithCredential(credential);

// // //       // Navigate to the home screen
// // //       Navigator.of(context).pushReplacement(
// // //         MaterialPageRoute(builder: (context) => HomeScreen()),
// // //       );

// // //       notifyListeners();
    
// // //     }
// // //   }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../home_screen.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  Future<void> googleLogin(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Store user details in Firestore
      final user = userCredential.user;
      final userData = {
        'email': user?.email,
        'displayName': user?.displayName,
        // Add additional user details as per your requirements
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .set(userData);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (error) {
      // Handle error during sign-in
      print('Error signing in with Google: $error');
    }
  }
}
