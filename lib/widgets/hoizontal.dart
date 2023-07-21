import 'package:flutter/material.dart';

class HorzotallistHome extends StatelessWidget {
  const HorzotallistHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
       
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            InkWell(
              onTap: () {
                
              },
              child: Column(
                
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(11),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKLG-7R-veDnIg2SxfDQaSahCWZX_6xDc8UV6zNhdsjuCMU72Fo0B8WzUXtNg2EeKERRI&usqp=CAU"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  Text('Playlist')
                ],
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKLG-7R-veDnIg2SxfDQaSahCWZX_6xDc8UV6zNhdsjuCMU72Fo0B8WzUXtNg2EeKERRI&usqp=CAU"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  Text('Recently played')
                ],
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKLG-7R-veDnIg2SxfDQaSahCWZX_6xDc8UV6zNhdsjuCMU72Fo0B8WzUXtNg2EeKERRI&usqp=CAU"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  Text("Most played")
                ],
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKLG-7R-veDnIg2SxfDQaSahCWZX_6xDc8UV6zNhdsjuCMU72Fo0B8WzUXtNg2EeKERRI&usqp=CAU"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  Text('favourite list')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
