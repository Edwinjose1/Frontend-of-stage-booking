import 'package:flutter/material.dart';

import '../core/colours.dart';

class AddCartScreen extends StatelessWidget {
  const AddCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kBlue,
      appBar: AppBar(
        backgroundColor: kBlue,
        leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color.fromARGB(119, 40, 15, 37),
          ),
          height: 55,
          width: 55,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
              // Handle menu button press
            },
          ),
        ),
      ),
      ),
      body:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            // child: Stagecard(),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            // child: Stagecard(),
          )
        ],
      ) ,
    );
  }
}