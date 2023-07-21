import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/Screens/welcome_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization tasks or logic here
    _navigateToNextScreen(); // Navigate to the next screen after a certain delay
  }

  // Method to navigate to the next screen after a delay
  void _navigateToNextScreen() {
    Future.delayed(Duration(seconds: 2), () {
      // Replace 'NextScreen()' with the actual widget you want to navigate to
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      // Customize the splash screen UI according to your needs
      body: Center(
        child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage("lib/asset/eventhive.png"
                        ), // replace with your own image path
                    fit: BoxFit.cover,
                  ),
                ),
                width: 250,
                height: 250, // adjust the height as desired
              ),
      ),
      
    );
  }
}
