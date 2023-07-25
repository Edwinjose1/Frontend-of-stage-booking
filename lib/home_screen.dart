import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/carousel_widget.dart';
import 'package:user_side_app/widgets/grid_view.dart';
import 'package:user_side_app/widgets/mainwidgets/catagories.dart';

import 'drawer.dart';
import 'widgets/core/colours.dart';
import 'widgets/mainwidgets/appbar.dart';
import 'widgets/mainwidgets/main_headings.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      drawer: Drawerr(),
      extendBodyBehindAppBar: true,
      backgroundColor: kWhite,
      appBar: const Appbar(),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            MainHeadings(fontsize: 21, color: kBlue, text: "Top offers"),
            CarouselSliderWidget(),
            MainHeadings(fontsize: 21, color: kBlue, text: "Categories"),
            Catagories(),
            MainHeadings(fontsize: 21, color: kBlue, text: "Trending"),
            StageGridview(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNav(),
      
        
        // ...
      
    );
  }
}
