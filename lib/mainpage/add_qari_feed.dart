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
        body: Column(
          children: [
            TextField(
              controller: _mosqueController,
              decoration: const InputDecoration(hintText: 'Mosque Name'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            TextField(
              controller: _qariController,
              decoration: const InputDecoration(hintText: 'Qari Name'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                Text(
                  newdata == null
                      ? 'Please Enable Location'
                      : newdata.toString(),
                  style: TextStyle(color: Colors.white),
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
                    : submit(
                        _mosqueController.text, _qariController.text, newdata),
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
