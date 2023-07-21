import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color.fromARGB(119, 40, 15, 37),
          ),
          height: 55,
          width: 55,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
              // Handle menu button press
            },
          ),
        ),
      ),
      actions: [
       

      ],
    );
  }
  void showBottomMenu() {
  Get.bottomSheet(
    Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)),color:Colors.white),
      // color: Colors.white,
      child: Wrap(
        children: <Widget>[
          ListTile(
            trailing: IconButton(onPressed: () {
              
            }, icon:Icon(Icons.circle)),
            
            title: Text('Relevance'),
            onTap: () {
              // Handle gallery selection
              Get.back(); // Close the bottom sheet
            },
          ),
          ListTile(
            trailing: IconButton(onPressed: () {
              
            }, icon:Icon(Icons.circle)),
            
            title: Text('Popularity'),
            onTap: () {
              // Handle gallery selection
              Get.back(); // Close the bottom sheet
            },
          ),
          ListTile(
trailing: IconButton(onPressed: () {
              
            }, icon:Icon(Icons.circle)),
                        title: Text('Price--Low to High'),
            onTap: () {
              // Handle gallery selection
              Get.back(); // Close the bottom sheet
            },
          ),
          ListTile(
trailing: IconButton(onPressed: () {
              
            }, icon:Icon(Icons.circle)),
                        title: Text('Price--High to Low'),
            onTap: () {
              // Handle camera selection
              Get.back(); // Close the bottom sheet
            },
          ),
           ListTile(
trailing: IconButton(onPressed: () {
              
            }, icon:Icon(Icons.circle)),
                        title: Text('Price--High to Low'),
            onTap: () {
              // Handle camera selection
              Get.back(); // Close the bottom sheet
            },
          ),
        ],
      ),
    ),
  );
}



}

class BottomMenuController extends GetxController {
  final isMenuOpen = false.obs;

  void openMenu() {
    isMenuOpen.value = true;
  }

  void closeMenu() {
    isMenuOpen.value = false;
  }
}
