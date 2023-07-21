import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_app/widgets/Screens/login_screen.dart';
import 'package:user_side_app/widgets/mainwidgets/google_signin.dart';
import 'package:user_side_app/widgets/utils.dart';

import 'home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp());
}

// void main() {
//   runApp(Myapp());
// }
final navigatorKey = GlobalKey<NavigatorState>();

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
              initialRoute: '/login', // Set the initial route
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
        // Add more routes if needed
      },

        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("something went wrong"),
                );
              } else if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return LoginPage();
              }
            }),
      ),
    );
  }
}
