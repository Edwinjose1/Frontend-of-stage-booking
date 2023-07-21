// import 'package:flutter/material.dart';

// import 'Mainwidgets/buy_cart.dart';


// class Cards extends StatelessWidget {
//   Cards({super.key, required this.Keyname});
//     final String Keyname;

// //   @override
// //   State<Cards> createState() => _CardsState();

// // }

// // class _CardsState extends State<Cards> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Expanded(
//           child: GestureDetector(
//             onTap: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => BuyAndCart(productid: ,)))
// ,
//             child: Container(
//               margin: const EdgeInsets.all(10),
//               width: size.width * 0.4,
//               height: size.width * 0.4,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/songimg2.jpg"),
//                     fit: BoxFit.cover),
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//             ),
//           ),
//         ),
//         Text(
//           Keyname,
//           style: TextStyle(
//               fontSize: 25, color: Colors.white, fontStyle: FontStyle.italic),
//         )
//       ],
//     );
//   }
// }
