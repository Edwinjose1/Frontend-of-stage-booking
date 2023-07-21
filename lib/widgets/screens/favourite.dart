import 'package:flutter/material.dart';

import '../mainwidgets/appbar1.dart';
import '../grid_view.dart';

class StagecardScreen extends StatelessWidget {
  const StagecardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       appBar:CustomAppBar(),
      body:SafeArea(child:ListView(
        children: [
          StageGridview(),
        ],
      ) ) ,
    );
  }
}