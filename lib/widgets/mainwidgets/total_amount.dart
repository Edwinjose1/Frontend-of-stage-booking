import 'package:flutter/material.dart';

class Totalamount extends StatelessWidget {
  const Totalamount({Key? key, required this.price}) : super(key: key);
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 165,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color:Colors.white70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Subtotal',
                
                  ),
                  Text(
                    '₹$price',
                    
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Shiping',
              
                ),
                Text(
                  '₹200',
                
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Total Cost',
                  
                ),
                Text(
                  '₹${int.parse(price) + 200}',
            style: TextStyle(fontWeight: FontWeight.w800 ),
                )
              ],
            ),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
