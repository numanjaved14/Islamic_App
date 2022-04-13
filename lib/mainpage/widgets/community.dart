import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:islamicapp/mainpage/add_community.dart';
import 'package:islamicapp/mainpage/widgets/community_widget.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff45211a),
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          title: Text(
            'News',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          centerTitle: true,
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/back.png",
                  ),
                  fit: BoxFit.cover)),
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('communities')
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CommunityWidget(
                      snap: snapshot.data!.docs[index].data(),
                    );
                  },
                );
              }),
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          backgroundColor: new Color(0xFFE57373),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddCommunity(),
            ),
          ),
        ),
      ),
    );
  }
}


//  Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(
//                       "assets/back.png",
//                     ),
//                     fit: BoxFit.cover)),