import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  var snap;
  InfoWidget({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ListTile(
        leading: Container(
          height: 150,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/ellipse.png'),
          ),
        ),
        title: Text(
          snap['username'],
          style: TextStyle(color: Colors.white, fontFamily: 'Gilroy',),
        ),
        subtitle: Text(
          snap['email'],
          style: TextStyle(color: Colors.white, fontFamily: 'Gilroy',),
        ),
      ),
    );
  }
}
