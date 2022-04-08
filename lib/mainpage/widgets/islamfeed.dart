import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:islamicapp/mainpage/add_qari_feed.dart';
import 'package:islamicapp/mainpage/widgets/qari_feed.dart';

class IslamFeed extends StatefulWidget {
  const IslamFeed({Key? key}) : super(key: key);

  @override
  State<IslamFeed> createState() => _IslamFeedState();
}

class _IslamFeedState extends State<IslamFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('QariMosqueFeed')
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
                  return QariFeed(
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
            builder: (context) => AddQariFeed(),
          ),
        ),
      ),
    );
  }
}
