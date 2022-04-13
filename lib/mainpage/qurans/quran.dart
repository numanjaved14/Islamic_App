import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamicapp/apicalls/apicall.dart';
import 'package:islamicapp/authentications/providers/models/quran_text_asad_model.dart';
import 'package:islamicapp/authentications/providers/models/quran_text_model.dart';
import 'package:islamicapp/authentications/providers/models/test_model.dart';
import 'package:islamicapp/mainpage/qurans/surah.dart';

class Qurans extends StatefulWidget {
  const Qurans({Key? key}) : super(key: key);

  @override
  State<Qurans> createState() => _QuransState();
}

class _QuransState extends State<Qurans> {
  late Future<QuranEditionModel> _quranText;

  @override
  void initState() {
    _quranText = ApiCalls().getTestCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10),
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
          'Quran',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff350801),
      ),
      extendBody: true,
      extendBodyBehindAppBar: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/back.png",
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/ellipse.png'),
                            ),
                          ),
                          Text(
                            'Fawad',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      );
                    })),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: FutureBuilder<QuranEditionModel>(
                    future: _quranText,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var surah = snapshot.data!.data![index];
                              print(surah);
                              return InkWell(
                                onTap: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        SurahPage(snap: surah),
                                  ))
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 20),
                                  width: MediaQuery.of(this.context).size.width,
                                  // height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(top: 30),
                                          child: Text(
                                            surah.name!,
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Color(0xff555555)),
                                          )),
                                      // Text(
                                      //   surah.revelationType! +
                                      //       ' • ' +
                                      //       surah.ayahs!.length.toString() +
                                      //       ' Verses',
                                      //   style: TextStyle(
                                      //       color: Color(0xffAEAEAE),
                                      //       fontSize: 16),
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else
                        return Center(child: CircularProgressIndicator());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
