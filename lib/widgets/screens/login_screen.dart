import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/Screens/sign_up.dart';

import '../../home_screen.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Please log in to continue using our app',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10.0),
              // TextButton(
              //   onPressed: () {
              //     // Handle "Forgot Password?" button press
              //   },
              //   child: Text('Forgot Password?'),
              // ),
              SizedBox(height: 30.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.pink)),
                onPressed: signIn

                // Handle login button press
                ,
                child: Text('Login'),
              ),
              SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 136, 244),
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Handle "Don't have an account? Sign Up" button press
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupPage()));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Sign-in successful, proceed to next screen
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
    } on FirebaseAuthException catch (e) {
      print(e);
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage =
            'An error occurred while signing in. Please try again later.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password. Please try again.';
      } else {
        errorMessage =
            'No user found with this email. Please check your email or sign up for a new account.';
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
// Future<void> signIn() async {
//   final isValid = formkey.currentState!.validate();
//   if (!isValid) return;

//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) => Center(
//       child: CircularProgressIndicator(),
//     ),
//   );

//   try {
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );

//     // Retrieve user details from Firestore (if needed)
//     final user = userCredential.user;
//     DocumentSnapshot snapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user!.uid)
//         .get();
//     Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;

//     // Proceed to the next screen
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => HomeScreen()),
//     );
//   } on FirebaseAuthException catch (e) {
//     print(e);
//     String errorMessage;
//     if (e.code == 'user-not-found') {
//       errorMessage =
//           'An error occurred while signing in. Please try again later.';
//     } else if (e.code == 'wrong-password') {
//       errorMessage = 'Incorrect password. Please try again.';
//     } else {
//       errorMessage =
//           'No user found with this email. Please check your email or sign up for a new account.';
//     }
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Error'),
//         content: Text(errorMessage),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }
// Future<void> signIn() async {
//   final isValid = formkey.currentState!.validate();
//   if (!isValid) return;

//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) => Center(
//       child: CircularProgressIndicator(),
//     ),
//   );

//   try {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );

//     // Retrieve user details from Firestore (if needed)
//     final user = userCredential.user;
//     DocumentSnapshot snapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user!.uid)
//         .get();
//     Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
// setState(() {
//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(builder: (context) => HomeScreen()),
//   );
// });
//     // Proceed to the next screen
//     // Navigator.of(context).pushReplacement(
//     //   MaterialPageRoute(builder: (context) => HomeScreen()),
//     // );
//   } on FirebaseAuthException catch (e) {
//     print(e);
//     String errorMessage;
//     if (e.code == 'user-not-found') {
//       errorMessage =
//           'An error occurred while signing in. Please try again later.';
//     } else if (e.code == 'wrong-password') {
//       errorMessage = 'Incorrect password. Please try again.';
//     } else {
//       errorMessage =
//           'No user found with this email. Please check your email or sign up for a new account.';
//     }
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Error'),
//         content: Text(errorMessage),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   } finally {
//     Navigator.pop(context); // Close the loading dialog
//   }
// }
}
//   // Future<void> signIn() async {
//   //   final isValid = formkey.currentState!.validate();
//   //   if (!isValid) return;

//   //   showDialog(
//   //     context: context,
//   //     barrierDismissible: false,
//   //     builder: (context) => Center(
//   //       child: CircularProgressIndicator(),
//   //     ),
//   //   );

//   //   try {
//   //     UserCredential userCredential =
//   //         await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //       email: emailController.text.trim(),
//   //       password: passwordController.text.trim(),
//   //     );

//   //     // Retrieve user details from Firestore (if needed)
//   //     final user = userCredential.user;
//   //     DocumentSnapshot snapshot = await FirebaseFirestore.instance
//   //         .collection('users')
//   //         .doc(user!.uid)
//   //         .get();
//   //     Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
//   //   } on FirebaseAuthException catch (e) {
//   //     print(e);
//   //     String errorMessage;
//   //     if (e.code == 'user-not-found') {
//   //       errorMessage =
//   //           'An error occurred while signing in. Please try again later.';
//   //     } else if (e.code == 'wrong-password') {
//   //       errorMessage = 'Incorrect password. Please try again.';
//   //     } else {
//   //       errorMessage =
//   //           'No user found with this email. Please check your email or sign up for a new account.';
//   //     }
//   //     showDialog(
//   //       context: context,
//   //       builder: (context) => AlertDialog(
//   //         title: Text('Error'),
//   //         content: Text(errorMessage),
//   //         actions: [
//   //           TextButton(
//   //             onPressed: () {
//   //               Navigator.pop(context);
//   //             },
//   //             child: Text('OK'),
//   //           ),
//   //         ],
//   //       ),
//   //     );
//   //   } 
//   //   Navigator.pushReplacement(
//   //     context,
//   //     MaterialPageRoute(builder: (ctx) => HomeScreen()),
//   //   );
//   // }
//   Future<void> signIn() async {
//   final isValid = formkey.currentState!.validate();
//   if (!isValid) return;

//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) => Center(
//       child: CircularProgressIndicator(),
//     ),
//   );

//   try {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );

//     // Retrieve user details from Firestore (if needed)
//     final user = userCredential.user;
//     DocumentSnapshot snapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user!.uid)
//         .get();
//     Map<String, dynamic>? userData = snapshot.data() as Map<String, dynamic>?;

//     if (userData != null) {
//       Navigator.pushAndRemoveUntil(
//   context,
//   MaterialPageRoute(builder: (context) => HomeScreen()),
//   (Route<dynamic> route) => false,
// );
//       // Proceed to the next screen
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => HomeScreen()),
//       // );
//     } else {
//       throw Exception('Failed to retrieve user data from Firestore');
//     }
//   } on FirebaseAuthException catch (e) {
//     print(e);
//     String errorMessage;
//     if (e.code == 'user-not-found') {
//       errorMessage =
//           'An error occurred while signing in. Please try again later.';
//     } else if (e.code == 'wrong-password') {
//       errorMessage = 'Incorrect password. Please try again.';
//     } else {
//       errorMessage =
//           'No user found with this email. Please check your email or sign up for a new account.';
//     }
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Error'),
//         content: Text(errorMessage),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   } finally {
//     Navigator.pop(context); // Close the loading dialog
//   }
// }

// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:user_side_app/widgets/Screens/sign_up.dart';

// import '../../home_screen.dart';
// import 'forgot_password_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: formKey,
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 'Please log in to continue using our app',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 10.0),
//               SizedBox(height: 30.0),
//               ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.pink),
//                 ),
//                 onPressed: signIn,
//                 child: Text('Login'),
//               ),
//               SizedBox(height: 10.0),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => ForgotPasswordPage(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       "Forgot Password?",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 4, 136, 244),
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => SignupPage(),
//                     ),
//                   );
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     InkWell(
//                       child: Text(
//                         'Sign Up',
//                         style: TextStyle(color: Colors.redAccent),
//                       ),
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => SignupPage(),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> signIn() async {
//     final isValid = formKey.currentState!.validate();
//     if (!isValid) return;

//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => Center(
//         child: CircularProgressIndicator(),
//       ),
//     );

//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       // Retrieve user details from Firestore (if needed)
//       final user = userCredential.user;
//       if (user != null) {
//         DocumentSnapshot snapshot = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();
//         Map<String, dynamic>? userData = snapshot.data() as Map<String, dynamic>?;

//         // Proceed to the next screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       print(e);
//       String errorMessage;
//       if (e.code == 'user-not-found') {
//         errorMessage =
//             'An error occurred while signing in. Please try again later.';
//       } else if (e.code == 'wrong-password') {
//         errorMessage = 'Incorrect password. Please try again.';
//       } else {
//         errorMessage =
//             'No user found with this email. Please check your email or sign up for a new account.';
//       }
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Error'),
//           content: Text(errorMessage),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     } finally {
//       Navigator.pop(context); // Close the loading dialog
//     }
//   }
// }

