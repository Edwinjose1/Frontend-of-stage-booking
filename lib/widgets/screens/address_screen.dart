import 'package:flutter/material.dart';

import '../core/colours.dart';




class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController streetnameController = TextEditingController();
  final TextEditingController postofficeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
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
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                  ),
                ),
                TextFormField(
                  controller: pincodeController,
                  decoration: InputDecoration(
                    labelText: "Pincode",
                  ),
                ),
                TextFormField(
                  controller: stateController,
                  decoration: InputDecoration(
                    labelText: "State",
                  ),
                ),
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: "City",
                  ),
                ),
                TextFormField(
                  controller: placeController,
                  decoration: InputDecoration(
                    labelText: "Place",
                  ),
                ),
                TextFormField(
                  controller: streetnameController,
                  decoration: InputDecoration(
                    labelText: "Street Name",
                  ),
                ),
                TextFormField(
                  controller: postofficeController,
                  decoration: InputDecoration(
                    labelText: "Post Office",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Submit address information
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
