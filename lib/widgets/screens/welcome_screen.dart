import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/Screens/sign_up.dart';




class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 

       Scaffold(
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Create an account and access thousands of cool stuffs',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                 style:ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.pink)) ,
                onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage()));
                  // Handle "Get Started" button press
                },
                child: Text('Get Started'),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Handle "Already have an account? Login?" button press
                },
                child: Text('Already have an account? Login?'),
              ),
            ],
          ),
        ));
    
    
  }
}
