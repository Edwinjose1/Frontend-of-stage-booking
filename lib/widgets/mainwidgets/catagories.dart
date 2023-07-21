
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/catagory_screen.dart';
import '../core/colours.dart';

class Catagories extends StatelessWidget {
  const Catagories({
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
                     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CatagoryScreeen(text:"WEDDING", name1: "Hindu Wedding",name2: "Christian Wedding",name3: "Muslim Wedding",name4:"Other Wedding",img1: 'lib/asset/Hinduweddding.jpg',img2: 'lib/asset/christianwedding.jpg',img3: 'lib/asset/muslimwedding.jpg',img4: 'lib/asset/otherwedding.jpg',)),
  );
                  },
            ),
            InkWell(
              child: Catagorycard(
                  size: size,
                  networkimage:
                      "https://pictime4eus1public-m.azureedge.net/pictures/29/91/29091250/slideshows/63fbda3ee910e51f28080eb3/images/black-white-photo-two-year-old-girl-blowing-out-birthday-candles-the-dark_pt(-100).jpg?rev=85",
                  eventname: "Birthday"),
                  onTap: () {
                     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CatagoryScreeen(text:"BIRTHDAY", name1: "1st Birthday",name2: "18th Birthday",name3: "30th Birthday",name4:"50th Birthday",img1: 'lib/asset/1bday.jpg',img2: 'lib/asset/18bday.jpg',img3: 'lib/asset/30bday.jpg',img4: 'lib/asset/50thbday.jpg',)),
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
                     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CatagoryScreeen(text:"SOCIAL EVENTS", name1: "Community Events",name2: "Sporting Events",name3: " Cultural Event",name4:"Group Activities",img1: 'lib/asset/soc1.jpg',img2: 'lib/asset/soc2.jpg',img3: 'lib/asset/soc3.jpg',img4: 'lib/asset/soc4.jpg',)),
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
                     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CatagoryScreeen(text:"FUNERAL", name1: "Memorial Reception",name2: "Memorial Service",name3: "Tribute Ceremony",name4:"Reflection Garden",img1: 'lib/asset/f1.jpg',img2: 'lib/asset/f2.jpg',img3: 'lib/asset/f3.jpg',img4: 'lib/asset/f4.jpg',)),
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
