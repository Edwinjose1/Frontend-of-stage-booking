import 'package:flutter/material.dart';

import '../core/colours.dart';
import '../mainwidgets/card_one.dart';
import '../mainwidgets/headings.dart';

class CatagoryScreeen
 extends StatelessWidget {
  const CatagoryScreeen
  ({super.key,
  required this.name1,
  required this.name2,
  required this.name3,
  required this.name4,
  required this.text,
  required  this.img1,
  required this.img2,
  required this.img3,
  required this.img4});
  
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  final String text;
  final img1;
  final img2;
  final img3;
  final img4;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kBlue ,
      body:Center(
        child: Container(
          child: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Color.fromARGB(119, 40, 15, 37),
                            ),
                            height: 55,
                            width: 55,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Headings(
                        fontsize: 30,
                        color: Colors.white,
                        text: text),
                  ],
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0, // Adjust the cross-axis spacing here
                    mainAxisSpacing: 15, 
                    // Adjust the main-axis spacing here
                    // children: List(4, (index) {
                    //   return Card1();
                    // }),
                    children: [
                      Card1(text: name1,img: img1,),
                      Card1(text: name2,img:img2),
                      Card1(text: name3,img:img3),
                      Card1(text: name4,img: img4,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}