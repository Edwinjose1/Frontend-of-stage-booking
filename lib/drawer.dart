

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_side_app/widgets/Screens/add_cart_screen.dart';
import 'package:user_side_app/widgets/Screens/login_screen.dart';
import 'package:user_side_app/widgets/Screens/my_order_screen.dart';
import 'package:user_side_app/widgets/core/colours.dart';
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
      
      backgroundColor: kWhite,
      child: Center(
      
        child: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                    
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: kBlack,
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
              leading: Icon(Icons.recent_actors_rounded, color: kBlack),
              title: Text(
                'My Orders',
                style: TextStyle(color: kBlack),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>MyOrderScreen(userId: userId ,)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: kBlack),
              title: Text(
                'Favorites',
                style: TextStyle(color: kBlack),
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
              leading: Icon(Icons.trolley, color: kBlack),
              title: Text(
                'My Cart',
                style: TextStyle(color: kBlack),
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
              leading: Icon(Icons.settings, color: kBlack),
              title: Text(
                'Contact Us',
                style: TextStyle(color: kBlack),
              ),
              onTap: () {
                          _launchContactUsURL(); 
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: kBlack),
              title: Text(
                'Log out',
                style: TextStyle(color: kBlack),
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
  void _launchContactUsURL() async {
    const contactUsURL = 'https://abhijith-ug.github.io/ShortIn-Contact-Page/'; // Replace with your actual contact us URL
    if (await canLaunch(contactUsURL)) {
      await launch(contactUsURL);
    } else {
      throw 'Could not launch $contactUsURL';
    }
  }

}




