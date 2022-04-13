import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommunityWidget extends StatelessWidget {
  var snap;
  CommunityWidget({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      width: MediaQuery.of(context).size.width,
      // height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image(
                  image: NetworkImage(
                    snap['photoUrl'],
                  ),
                ),
              ),
            ),
          ),
          // Container(
          //   height: 200,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(image: NetworkImage(snap['photoUrl'])),
          //       borderRadius: BorderRadius.all(Radius.circular(50))),
          //   margin: EdgeInsets.only(bottom: 3, left: 10, right: 10),
          //   // child: Image.asset(
          //   //   'assets/happy.png',
          //   //   height: 200,
          //   //   fit: BoxFit.cover,
          //   // )
          // ),
          SizedBox(
            height: 20,
          ),
          Text(
            snap['title'],
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            snap['dateTime'],
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
