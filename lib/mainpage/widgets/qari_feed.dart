import 'package:flutter/material.dart';

class QariFeed extends StatelessWidget {
  var snap;
  QariFeed({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            snap['title'],
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            snap['title'],
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            snap['dateTime'],
            style: TextStyle(color: Colors.grey, fontSize: 20),
          )
        ],
      ),
    );
  }
}
