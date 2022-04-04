import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamicapp/authentications/providers/database_services.dart';
import 'package:islamicapp/mainpage/widgets/bottom_drawee.dart';

class AddCommunity extends StatefulWidget {
  const AddCommunity({Key? key}) : super(key: key);

  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
  final TextEditingController _titleController = TextEditingController();
  Uint8List? _image;

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

  void submit(String title, Uint8List file) async {
    String response =
        await DataBaseMethods().uploadImage(title: title, file: file);
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          InkWell(
            onTap: selectImage,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: _image != null
                  ? Image(
                      image: MemoryImage(_image!),
                    )
                  : const Image(
                      image: NetworkImage(
                          'https://t4.ftcdn.net/jpg/02/15/84/43/360_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg'),
                    ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          ElevatedButton(
              onPressed: () => submit(_titleController.text, _image!),
              child: const Text('Submit'))
        ],
      )),
    );
  }
}
