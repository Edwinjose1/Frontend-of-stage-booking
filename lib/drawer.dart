// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:user_side_app/widgets/Screens/login_screen.dart';
// import 'package:user_side_app/widgets/Screens/my_orders.dart';
// import 'package:user_side_app/widgets/favorite_screen.dart';


// class Drawerr extends StatefulWidget {
//   const Drawerr({
//     Key? key,
//   }) : super(key: key);
  

//   @override
//   State<Drawerr> createState() => _DrawerrState();
  
// }

// class _DrawerrState extends State<Drawerr> {
//   @override
//   void initState() {
 
//     super.initState();
//     String? userid = getCurrentUserId();
//   }
//   Widget build(BuildContext context) {

//     return Drawer(
//       backgroundColor: Colors.black,
//       child: Center(
//         child: Column(children: <Widget>[
//            Center(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () => Navigator.pop(context),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(Radius.circular(15)),
//                               color: Colors.black,
//                             ),
//                             height: 55,
//                             width: 55,
//                             child: const Icon(
//                               Icons.arrow_back_ios,
//                               color: Color.fromARGB(255, 212, 203, 203),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(15)),
//                             color: Color.fromARGB(119, 40, 15, 37)
//                           ),
//                           height: 55,
//                           width: 55,
//                           child: const Icon(
//                             Icons.favorite_border_outlined,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//           Container(
//             margin: EdgeInsets.only(top: 30),
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                   image: AssetImage('assets/images/piyano.webp'),
//                   fit: BoxFit.fill),
//             ),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.playlist_add,
//               color: Colors.white,
//             ),
//             title: Text(
//               'Profile',
//               style: TextStyle(color: Colors.white),
//             ),
//             // trailing: Icon(
//             //   Icons.person,
//             //   color: Colors.white,
//             // ),
//             onTap: () {
//               // Navigator.of(context)
//               //     .push(MaterialPageRoute(builder: (context) => Mostplayed()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.recent_actors_rounded, color: Colors.white),
//             title: Text(
//               'MyOrders',
//               style: TextStyle(color: Colors.white),
//             ),
//             // trailing: Icon(Icons.arrow_right, color: Colors.white),
//             onTap: () {
//                Navigator.of(context)
//                .push(MaterialPageRoute(builder: (context) => AddCartScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite, color: Colors.white),
//             title: Text(
//               'Favorites',
//               style: TextStyle(color: Colors.white),
//             ),
//             // trailing: Icon(Icons.arrow_right, color: Colors.white),
//             onTap: () {
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => FavoriteScreen(userId:,)));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.settings, color: Colors.white),
//             title: Text(
//               'Setting',
//               style: TextStyle(color: Colors.white),
//             ),
//             // trailing: Icon(Icons.arrow_right, color: Colors.white),
//             onTap: () {
//               // Navigator.of(context).push(
//               //     MaterialPageRoute(builder: (context) => SettingScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.logout, color: Colors.white),
//             title: Text(
//               'Log out',
//               style: TextStyle(color: Colors.white),
//             ),
//             // trailing: Icon(Icons.arrow_right, color: Colors.white),
//             onTap: ()async {
//                                 await FirebaseAuth.instance.signOut();
//                   Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(builder: (context) => LoginPage()),
//                       (route) => false);
//               // Navigator.of(context).push(
//               //     MaterialPageRoute(builder: (context) => SettingScreen()));
//             },
//           ),
//         ]),
//       ),
//     );
//   }

//   String? getCurrentUserId() {
//   final user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     return user.uid;
//   }
//   return null; // If user is not signed in
// }
// }



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_side_app/widgets/Screens/add_cart_screen.dart';
import 'package:user_side_app/widgets/Screens/login_screen.dart';
import 'package:user_side_app/widgets/Screens/my_order_screen.dart';
import 'package:user_side_app/widgets/favorite_screen.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  String? userId;

  @override
  void initState() {
    super.initState();
    userId = getCurrentUserId();
  }

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Center(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.black,
                        ),
                        height: 55,
                        width: 55,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Color.fromARGB(255, 212, 203, 203),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color.fromARGB(119, 40, 15, 37)),
                      height: 55,
                      width: 55,
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/piyano.webp'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.playlist_add,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Navigate to Profile screen
              },
            ),
            ListTile(
              leading: Icon(Icons.recent_actors_rounded, color: Colors.white),
              title: Text(
                'My Orders',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>MyOrderScreen(userId: userId ,)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.white),
              title: Text(
                'Favorites',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FavoriteScreen(userId: userId),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.trolley, color: Colors.white),
              title: Text(
                'My Cart',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartScreen(userId: userId),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Navigate to Settings screen
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                'Log out',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String? getCurrentUserId() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null; // If user is not signed in
  }
}




