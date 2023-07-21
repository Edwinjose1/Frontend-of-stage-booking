import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../core/colours.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  
  late Position currentPosition;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    try {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home
      : Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kPink, //background color of button
              // side: BorderSide(
              //     width: 3,
              //     color: kBlue), //border width and color
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                //to set border radius to button
                borderRadius: BorderRadius.circular(30)),
              padding:
                  EdgeInsets.all(15) //content padding inside button
            ),
            onPressed: () async {
              getCurrentLocation();
              if (currentPosition != null) {
                List<Placemark> placemarks = await placemarkFromCoordinates(
                    currentPosition.latitude, currentPosition.longitude);
                if (placemarks.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Your current address is: ${placemarks.first.administrativeArea}",
                      ),
                    ),
                  );
                }
              }
            },
            child: Text("Get Address", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}