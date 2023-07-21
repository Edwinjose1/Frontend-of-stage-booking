import 'package:flutter/material.dart';

import '../../bottom_nav.dart';
import '../core/colours.dart';

class BirthdaycatagoryScreen extends StatelessWidget {
  const BirthdaycatagoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPink,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                color: kWhite,
              ),
              Divider(height: 20),
              Weddingcatagories(
                text: "1 st Birthday",
              ),
              Weddingcatagories(
                text: "18 th Birthday",
              ),
              Weddingcatagories(
                text: "30 th Birthday",
              ),
              Weddingcatagories(
                text: "50 th Birthday",
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
class Weddingcatagories extends StatelessWidget {
  const Weddingcatagories({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100, // Adjust this value to set the desired width
        height: 100, // Adjust this value to set the desired height
        color: Color.fromARGB(255, 147, 155, 120),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
