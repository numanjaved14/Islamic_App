import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  Uint8List? _image;
  final TextEditingController _mosqueController = TextEditingController();
  final TextEditingController _qariController = TextEditingController();
  final TextEditingController _bioConroller = TextEditingController();

  void submit(String mosqueName, String qariName, String qariBio, var location,
      Uint8List file) async {
    String response = await DataBaseMethods().uploadMosque(
        mosque: mosqueName,
        qari: qariName,
        location: location,
        file: file,
        bio: qariBio);
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

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    }

    return 'No Image Selected.';
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
        body:  Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/back.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: selectImage,
                      child:  SizedBox(
                          height: 200,
                          // height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          child: _image != null
                              ? Image(
                                  image: MemoryImage(_image!),
                                )
                              : const Image(
                                  image: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/3159/3159331.png'),
                                ),
                        ),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _mosqueController,
                        decoration: const InputDecoration(
                          hintText: 'Mosque Name',
                          hintStyle: TextStyle( fontFamily: 'Gilroy',),
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
                          hintStyle: TextStyle( fontFamily: 'Gilroy',),
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
                        controller: _bioConroller,
                        decoration: const InputDecoration(
                          hintText: 'Qari Description',
                          hintStyle: TextStyle( fontFamily: 'Gilroy',),
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
                          style: TextStyle(color: Colors.black, fontFamily: 'Gilroy',),
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
                              _bioConroller.text, newdata, _image!),
                      child: const Text('Submit',style: TextStyle( fontFamily: 'Gilroy',),),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          fixedSize: Size(200, 40),
                          primary: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          
        ),
      ),
    );
  }
}
