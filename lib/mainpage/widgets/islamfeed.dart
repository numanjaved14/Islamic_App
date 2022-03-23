import 'package:flutter/material.dart';

class IslamFeed extends StatefulWidget {
  const IslamFeed({ Key? key }) : super(key: key);

  @override
  State<IslamFeed> createState() => _IslamFeedState();
}

class _IslamFeedState extends State<IslamFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/islamfeed.png',),fit: BoxFit.cover)
        ),
      ),
      
    );
  }
}