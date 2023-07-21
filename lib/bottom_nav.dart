import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/core/colours.dart';


class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: kPink,
      backgroundColor: kWhite,
      buttonBackgroundColor: kPink,
    
      height: 50,
      items: <Widget>[

      Icon(Icons.home,size: 27,color: kWhite,),
       Icon(Icons.add,size: 27,color:kWhite,),
        Icon(Icons.list,size: 27,color: kWhite,),
        
    ],
    
    animationDuration: Duration(milliseconds: 200),
    index: 1,
    animationCurve: Curves.bounceInOut,
    onTap: (value) {
      debugPrint("Current index is $value");
    
    },);
  }
}
