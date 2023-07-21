import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/birthday_catagory_screen.dart';
import '../Screens/funeral_catagory.dart';
import '../Screens/social_event_screen.dart';
import '../Screens/wedding_catagory_screen.dart.dart';
import '../core/colours.dart';



class Insidecatagory

 extends StatelessWidget {
  const Insidecatagory

  ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      // height: size.width * 0.4,
      // //  width: MediaQuery.of(context).size.width / 10,
      // width: 100,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
                 InkWell(
              child: Catagorycard(
                  size: size,
                  networkimage:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSrihrgUC6CMVfaaGMNTiz_SCOM_tiqm8A7g&usqp=CAU",
                  eventname: "Wedding"),
                  onTap: () {
                     Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => WeddigncatagoryScreen()),
  );
                  },
            ),
            InkWell(
              child: Catagorycard(
                  size: size,
                  networkimage:
                      "https://media.istockphoto.com/id/1282261516/vector/happy-birthday-hand-drawn-line-doodle-print-for-a-balloon-or-t-shirt-comet-sun-stars-and.jpg?s=612x612&w=0&k=20&c=-ecPgRKk8ffbNMr2PN-q5iuea60zYXQAD1F_oh0EiJE=",
                  eventname: "Birthday"),
                  onTap: () {
                     Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const BirthdaycatagoryScreen()),
  );
                  },
            ),
        InkWell(
              child: Catagorycard(
                  size: size,
                  networkimage:
                      "https://thumbs.dreamstime.com/z/people-event-holiday-official-people-person-drink-alcohol-crockery-black-white-engagement-honeymoon-concept-cropped-close-up-112692801.jpg",
                  eventname: "Social Events"),
                  onTap: () {
                     Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const SocialEventScreen()),
  );
                  },
            ),
            InkWell(
              child: Catagorycard(
                  size: size,
                  networkimage:
                      "https://img.freepik.com/free-vector/mourning-victims_23-2148598185.jpg?w=2000",
                  eventname: "Funeral"),
                  onTap: () {
                     Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const FuneralcatagoryScreen()),
  );
                  },
            )

         
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Catagorycard extends StatelessWidget {
  Catagorycard(
      {super.key,
      required this.size,
      required this.networkimage,
      required this.eventname});

  final Size size;
  String networkimage;
  final String eventname;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(05),
            width: size.width * 0.4,
            height: size.width * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(networkimage), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        Text(
          eventname,
          style: GoogleFonts.roboto
(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: kBlue
          ),

          // style:
          //     TextStyle(fontSize: 20, color: kPink,fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
