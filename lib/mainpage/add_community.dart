import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamicapp/authentications/providers/database_services.dart';
import 'package:islamicapp/mainpage/widgets/bottom_drawee.dart';
import 'package:video_player/video_player.dart';

class AddCommunity extends StatefulWidget {
  const AddCommunity({Key? key}) : super(key: key);

  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
  final TextEditingController _titleController = TextEditingController();
  Uint8List? _image;
  File? _video;
  final picker = ImagePicker();
  VideoPlayerController? _videoPlayerController;

// This funcion will helps you to pick a Video File
  _pickVideo() async {
    PickedFile? pickedFile = await picker.getVideo(source: ImageSource.gallery);
    _video = File(pickedFile!.path);
    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
      });
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
          // margin: EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
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
                              'https://cdn-icons-png.flaticon.com/512/3159/3159331.png'),
                        ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle( fontFamily: 'Gilroy',),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ElevatedButton(
                onPressed: () => submit(_titleController.text, _image!),
                child: const Text('Submit',style: TextStyle(  fontFamily: 'Gilroy',),),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    fixedSize: Size(200, 60),
                    primary: Colors.black),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
