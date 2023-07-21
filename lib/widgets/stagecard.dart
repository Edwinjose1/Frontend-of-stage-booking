import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class Stagecard extends StatelessWidget {
  const Stagecard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 250,
          color: Color.fromARGB(255, 27, 52, 74),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset('lib/asset/wedding-stage.webp'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Aligns items at the start of the row horizontally
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    SizedBox(
                      width: 140,
                      height: 50,
                    ),
                    DecoratedIcon(
                      icon: Icon(Icons.favorite, color: Colors.white),
                      decoration: IconDecoration(border: IconBorder(width: 2)),
                    )

                    // Icon(
                    //   Icons.favorite,
                    //   color: Colors.white,

                    // ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "ID:124",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Rs:- 20,000",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
