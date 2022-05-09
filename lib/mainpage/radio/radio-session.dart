import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamicapp/mainpage/duaandhadith.dart';
import 'package:islamicapp/mainpage/prayertimings.dart';
import 'package:islamicapp/mainpage/qibla.dart';
import 'package:islamicapp/mainpage/qurans/quran.dart';
import 'package:islamicapp/mainpage/radio/streaming_controller.dart';
import 'package:islamicapp/mainpage/settings/settings.dart';

class RadioSessions extends StatefulWidget {
  const RadioSessions({Key? key}) : super(key: key);

  @override
  State<RadioSessions> createState() => _RadioSessionsState();
}

class _RadioSessionsState extends State<RadioSessions> {
  int currentPage = 0;
  final _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:  InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 5,top: 8),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xff45211a),
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Radio',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
              height: 70,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/red.png',
                      ),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.radio,
                    color: Colors.white,
                  ),
                  label: Text('Live Quran',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ))
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
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
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(color: Colors.red
                      // border: Border.all(
                      //     style: BorderStyle.solid,
                      //     width: 2,
                      //     color: Colors.red)
                      ),
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 200,
                    height: 200,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyApp(),
                    )),
                    // launchURL("https://www.radioking.com/play/muslim-path"),
                    child: Text(
                      'JOIN',
                      style: TextStyle(
                        color: Color(0xff3F48CC),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 50),
                        primary: Colors.white,
                        shape: StadiumBorder()),
                  )),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    height: MediaQuery.of(context).size.height * 0.475,
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      //                 Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: Row(
                      //                     mainAxisAlignment: MainAxisAlignment.center,
                      //                     children: [
                      //                       Container(
                      //                         decoration: BoxDecoration(
                      //                            border: Border(
                      //   bottom: BorderSide(width: 1.0, color: Color(0xffC98E00)),
                      // ),
                      //                         ),
                      //                         child: Text('Questions Asked',style: TextStyle(fontSize: 16),)),
                      //                       SizedBox(width: 20,),
                      //                        Text('Questions Answered',style: TextStyle(fontSize: 16),),
                      //                     ],
                      //                   ),
                      //                 ),
        
                      Expanded(
                        child: PageView(
                            controller: _controller,
                            onPageChanged: (index) {
                              setState(() {
                                currentPage = index;
                              });
                            },
                            children: [
                              
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            width: 1.0,
                                                            color: Color(0xffC98E00)),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Questions Asked',
                                                      style:
                                                          TextStyle(fontSize: 16),
                                                    )),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            width: 1.0,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Questions Answered',
                                                      style:
                                                          TextStyle(fontSize: 16),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                  ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                            '1. Do they not see the birds controlled in the atmosphere of the sky?'),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                            '2. Do they not see the animals lived in the jungle?'),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                            '3. Do they not see the everyone was created by the God?'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                          width: 1.0,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Questions Asked',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  )),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                          width: 1.0,
                                                          color:
                                                              Color(0xffC98E00)),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Questions Answered',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                     Divider(
                                      color: Colors.white,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '1. Do they not see the birds controlled in the atmosphere of the sky?'),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Answer no 1',
                                            style: TextStyle(
                                                color: Color(0xff666666)),
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(9),
                                            decoration: BoxDecoration(
                                                color: Color(0xffF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                                'our lord! Forgive me and my parrents, and (all) the believers on the day')),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                            '2. Do they not see the animals lived in the jungle?'),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Answer no 2',
                                            style: TextStyle(
                                                color: Color(0xff666666)),
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(9),
                                            decoration: BoxDecoration(
                                                color: Color(0xffF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                                'our lord! Forgive me we know every thing is created by you')),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                            '3. Do they not see the everyone was created by the God?'),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Answer no 3',
                                            style: TextStyle(
                                                color: Color(0xff666666)),
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(9),
                                            decoration: BoxDecoration(
                                                color: Color(0xffF3F3F3),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                                'Everything is created by Allah')),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      )
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
