import 'package:flutter/material.dart';
import 'package:islamicapp/mainpage/qari_feed_details_page.dart';

class QariFeed extends StatelessWidget {
  var snap;
  QariFeed({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Masijid(
          snap: snap,
        ),
      )),
      child:SingleChildScrollView(child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 10),
            width: 368,
            height: 100,
            decoration: BoxDecoration(
                          color: Colors.white,

              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                     decoration: BoxDecoration(
                          color: Colors.white,

              borderRadius: BorderRadius.circular(20)
            ),
                    child: Image.network(
                          
                            snap['photoUrl'],
                            fit: BoxFit.cover,
                            height: 80,
                            width: 100,
                          ),
                  ),
                    SizedBox(width: 5,),

                         Text(
                                              snap['mosqueName'],
                                              style: const TextStyle(
                           fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            overflow: TextOverflow.fade),
                                            ),
                        
                                            SizedBox(width: 5,),

                    const VerticalDivider(
                      // thickness: 2,
                      color: Colors.grey,
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          Text(
                            snap['location'],
                            style: TextStyle(
                               fontFamily: 'Gilroy',
                                color: Colors.grey,
                                fontSize: 16,
                                overflow: TextOverflow.fade),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),)
    );
  }
}
