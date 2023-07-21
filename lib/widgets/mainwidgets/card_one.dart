


import 'package:flutter/material.dart';

import '../Screens/stage_card_screen.dart';

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,required this.text,required this.img,
  }) : super(key: key);
final  String text;
final String img;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>StagecardScreen(subcategory: text,) ));
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(img
                      ), // replace with your own image path
                  fit: BoxFit.cover,
                ),
              ),
              width: 160,
              height: 140, // adjust the height as desired
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(0, 0, 0, 0), // adjust the color as desired

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text
                ,
                style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w500),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
