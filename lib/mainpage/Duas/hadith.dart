import 'package:flutter/material.dart';
import 'package:islamicapp/authentications/providers/models/hadith_model.dart';

import '../../apicalls/read_json.dart';

class Hadiths extends StatefulWidget {
  const Hadiths({Key? key}) : super(key: key);

  @override
  State<Hadiths> createState() => _HadithsState();
}

class _HadithsState extends State<Hadiths> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/back.png",
                    ),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
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
                        Text('Hadith',
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal)),
                        Text(
                          '',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: ReadJSON().ReadJsonHadith(),
                    builder: (context, data) {
                      if (data.hasError) {
                        return Center(child: Text("${data.error}"));
                      } else if (data.hasData) {
                        var items = data.data as List<HadithModel>;
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: items == null ? 0 : items.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 20),
                                  width: MediaQuery.of(this.context).size.width,
                                  // height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        color: Color(0xff3F48CC),
                                        height: 30,
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(items[index]
                                                    .groupId!
                                                    .toString())),
                                            Spacer(),
                                            Icon(Icons.share,
                                                color: Color.fromARGB(
                                                    255, 244, 244, 245)),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(Icons.play_arrow,
                                                color: Color.fromARGB(
                                                    255, 244, 244, 245))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              'assets/bismillah.png',
                                              height: 70,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 20),
                                          child: Text(items[index].arDua!,
                                              style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal)))
                                    ],
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
