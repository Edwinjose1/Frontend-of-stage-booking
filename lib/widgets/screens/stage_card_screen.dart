import 'package:flutter/material.dart';

import '../mainwidgets/appbar1.dart';
import '../grid_view_for_catagory.dart';

class StagecardScreen extends StatelessWidget {
  const StagecardScreen({super.key,required this.subcategory});
final String subcategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       appBar:CustomAppBar(),
      body:SafeArea(child:ListView(
        children: [ SizedBox(
                height: 20,
              ),
             
          StageGridviewCatagory(subcategory: subcategory),
        ],
      ) ) ,
    );
  }
}