import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_side_app/widgets/core/colours.dart';

import '../../drawer.dart';
import '../Screens/search_screen.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: kPink,
      leading: IconButton(onPressed: () {
        
         Navigator.push(context, MaterialPageRoute(builder: (context) => Drawerr()));
      }, icon: Icon(Icons.menu)),
      title: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Text(
          "Eventhive",
          style: GoogleFonts.charm(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 40,
              fontWeight: FontWeight.w600,
              
              color: kWhite),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 28, 52, 71),
          ),
          onPressed: () {
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SearchScreen()),
  );
          },
        ),
        
        
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(48.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}
