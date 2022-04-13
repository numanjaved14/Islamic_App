import 'package:flutter/material.dart';
import 'package:islamicapp/mainpage/widgets/snackbar.dart';

import '../authentications/providers/database_services.dart';
import '../services/location_methods.dart';
import 'widgets/bottom_drawee.dart';

class AddQariFeed extends StatefulWidget {
  const AddQariFeed({Key? key}) : super(key: key);

  @override
  State<AddQariFeed> createState() => _AddQariFeedState();
}

class _AddQariFeedState extends State<AddQariFeed> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  String? newdata;
  final TextEditingController _mosqueController = TextEditingController();
  final TextEditingController _qariController = TextEditingController();

  void submit(String mosqueName, String qariName, var location) async {
    String response = await DataBaseMethods()
        .uploadMosque(mosque: mosqueName, qari: qariName, location: location);
    if (response == 'Success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainScreen(),
      ));
    } else {
      print('Some Error Occured');
    }
  }

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  void initState() {
    getLocation();
    // TODO: implement initState
    super.initState();
  }

  void getLocation() async {
    await LocationMethods()
        .checkLocationStatus()
        .then((value) => newdata = value);
    setState(() {
      newdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: scaffoldKey,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/back.png",
                ),
                fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _mosqueController,
                    decoration: const InputDecoration(
                      hintText: 'Mosque Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _qariController,
                    decoration: const InputDecoration(
                      hintText: 'Qari Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    Text(
                      newdata == null
                          ? 'Please Enable Location'
                          : newdata.toString(),
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () => newdata == null
                      ? CustomSnackbar.snackbar(
                          'Please Enable your Location', scaffoldKey)
                      : submit(_mosqueController.text, _qariController.text,
                          newdata),
                  child: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      fixedSize: Size(200, 60),
                      primary: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
