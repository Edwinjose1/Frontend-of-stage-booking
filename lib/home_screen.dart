import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/carousel_widget.dart';
import 'package:user_side_app/widgets/grid_view.dart';
import 'package:user_side_app/widgets/mainwidgets/catagories.dart';

import 'bottom_nav.dart';
import 'drawer.dart';
import 'widgets/core/colours.dart';
import 'widgets/mainwidgets/appbar.dart';
import 'widgets/mainwidgets/main_headings.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawerr(),
//       extendBodyBehindAppBar: true,
//       backgroundColor: Mbgc,
//       appBar: const Appbar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 50,),
//             MainHeadings(fontsize: 21, color: kBlue, text: "Top offers"),
//             CarouselSliderWidget(),
//             MainHeadings(fontsize: 21, color: kBlue, text: "Categories"),
//             Catagories(),

//             MainHeadings(fontsize: 21, color: kBlue, text: "Trending"),
//             StageGridview(),
//             // SizedBox(child: Expanded(child: StageGridview())),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNav(),
    //   floatingActionButton: ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //       primary: kPink,
    //       elevation: 3,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(30),
    //       ),
    //       padding: EdgeInsets.all(15),
    //     ),
    //     onPressed: () async {
    //       DateTime? pickedDate = await showDatePicker(
    //         context: context,
    //         initialDate: DateTime.now(),
    //         firstDate: DateTime(2023),
    //         lastDate: DateTime(2024),
    //       );
    //       if (pickedDate != null) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //             content: Text("Date selected: ${pickedDate.toLocal()}"),
    //           ),
    //         );
    //       }
    //     },
    //     child: Text(
    //       "Choose Day",
    //       style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
    //     ),
    //   ),
    // );
//   }
// }
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerr(),
      extendBodyBehindAppBar: true,
      backgroundColor: Mbgc,
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
      bottomNavigationBar: BottomNav(),
      
        
        // ...
      
    );
  }
}
