
import 'package:flutter/material.dart';

import '../core/colours.dart';
import '../mainwidgets/headings.dart';


class WeddigncatagoryScreen extends StatelessWidget {
  const WeddigncatagoryScreen({super.key});

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
            Container(color: kWhite),
            Divider(height: 20),
            Weddingcatagories(
              text: "Hindu Wedding",
            ),
            Weddingcatagories(
              text: "Hindu Wedding",
            ),
            Weddingcatagories(
              text: "Hindu Wedding",
            ),
            Weddingcatagories(
              text: "Hindu Wedding",
            )
          ],
        ),
      ),
      ),
      // bottomNavigationBar: BottomNav(),
    );
  }
}

class Weddingcatagories extends StatelessWidget {
  const Weddingcatagories({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Headings(fontsize: 30, color: Colors.black54, text: text)],
        ),
        height: 70,
        width: double.infinity,
        color: Color.fromARGB(255, 132, 137, 115),
      ),
    );
  }
}
