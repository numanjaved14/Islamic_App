import 'package:flutter/material.dart';

class QariFeed extends StatelessWidget {
  var snap;
  QariFeed({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Mosque: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  snap['mosqueName'],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Qari: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  snap['qariName'],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'City: ',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                Text(
                  snap['location'],
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
