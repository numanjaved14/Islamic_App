import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamicapp/mainpage/current_prayer.dart';
import 'package:islamicapp/mainpage/duaandhadith.dart';
import 'package:islamicapp/mainpage/prayertimings.dart';
import 'package:islamicapp/mainpage/qibla.dart';
import 'package:islamicapp/mainpage/qurans/quran.dart';
import 'package:islamicapp/mainpage/radio/radio-session.dart';
import 'package:islamicapp/mainpage/settings/settings.dart';

import '../apicalls/apicall.dart';
import '../models/prayertimemodel.dart';
import '../services/location_methods.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? newdata;
  int currentPage = 0;
  final _controller = PageController(initialPage: 0);

  String? _cPrayer;
  var time = TimeOfDay.now();
  bool init = true;

  @override
  void initState() {
    getLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (init == true) {
      setState(() {
        _cPrayer = CurrentPrayer().currentPrayer(time);
        // print(cPrayer);
      });
      init = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void getLocation() async {
    await LocationMethods()
        .checkLocationStatus()
        .then((value) => newdata = value);
    setState(() {
      newdata;
    });
  }

  // int _getSize(var size){
  //   if(size.height > )
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => Settings()));
                },
                child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff441009),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/grid.png',
                        height: 24,
                        width: 24,
                      ),
                    ))),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Next prayer time',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Settings()));
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: Color(0xff441009),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.settings)),
              ),
            ),
          )
        ],
      ),
      // extendBody: true,
      extendBodyBehindAppBar: true,
      // drawer: MyDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  _cPrayer == 'Fajr'
                      ? "assets/fajr_back.png"
                      : _cPrayer == 'Dhuhr'
                          ? "assets/duhr_back.png"
                          : _cPrayer == 'Asar'
                              ? "assets/asr_back.png"
                              : _cPrayer == 'Maghrib'
                                  ? "assets/maghrib_back.png"
                                  : "assets/isha_back.png",
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // height: 110,
                  child: StreamBuilder<PrayerTimeModel>(
                    stream: ApiCalls().gettime(const Duration(seconds: 0)),
                    builder:
                        (context, AsyncSnapshot<PrayerTimeModel> snapshot) {
                      if (snapshot.hasData) {
                        PrayerTimeModel data = snapshot.data!;
                        return Column(
                          children: [
                            SizedBox(
                              // height: 110,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        newdata.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gilroy',
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      // margin: EdgeInsets.only(top: 20),
                                      child: Text(
                                    DateFormat.Hms().format(DateTime.now()),
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  // Text(
                                  //   'Isha',
                                  //   style: TextStyle(color: Colors.white, fontFamily: 'Gilroy',),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Text(
                                  //   'Today',
                                  //   style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontWeight: FontWeight.bold,
                                  //     fontFamily: 'Gilroy',
                                  //   ),
                                  // ),
                                  // Text(
                                  //   '13 Ramadan',
                                  //   // data.data.date.hijri!.month!.number
                                  //   //         .toString() +
                                  //   //     '  ' +
                                  //   //     data.data.date.hijri!.month!.en
                                  //   //         .toString(),m
                                  //   style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontFamily: 'Gilroy',
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ],
                          // ),
                        );
                      } else {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  child: PageView(
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,

                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Navigator.pushNamed(context , categories[index].route),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) => Qurans()));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.25),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child:
                                                Image.asset('assets/quran.png'),
                                          ),
                                        ),
                                        Text(
                                          'Quran',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Gilroy',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  PrayersTimes()));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.25),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child:
                                                Image.asset('assets/mos.png'),
                                          ),
                                        ),
                                        SizedBox(height: 6,),
                                        Text(
                                          'Prayer Times',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Gilroy',
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) => RadioSessions()));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.25),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                              'assets/radio.png',
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Q/A Radio',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Gilroy',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                 InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) => DuaAndHadith()));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.25),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                              'assets/ram.png',
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Dua/Hadiths',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Gilroy',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) => Qibla()));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.25),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                              'assets/qib.png',
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Qibla',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Gilroy',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                   InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) => Settings()));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.25),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                              'assets/sett.png',
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Setting',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Gilroy',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              ],)
                            ],
                          )
                        ),
                          
                           Column(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      Qurans()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.25),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                    'assets/mos.png'),
                                              ),
                                            ),
                                            Text(
                                              'Prayer Times',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gilroy',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      PrayersTimes()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.25),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                    'assets/radio.png'),
                                              ),
                                            ),
                                            Text(
                                              'Q/A Radio',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gilroy',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (builder) => RadioSessions()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.25),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Image.asset(
                                                    'assets/nes.png'),
                                              ),
                                            ),
                                            Text(
                                              'News',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gilroy',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (builder) =>
                                                          Qibla()));
                                            },
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.25),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                    'assets/qib.png'),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Qibla',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Gilroy',
                                            ),
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      Settings()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.25),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                  'assets/sett.png',
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Setting',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gilroy',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (builder) => Settings()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.25),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                  'assets/membership.png',
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Membership',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gilroy',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 200),
                  child: Center(
                    child: DotsIndicator(
                      dotsCount: 2,
                      position: currentPage.toDouble(),
                      decorator: DotsDecorator(
                        color: Colors.grey, // Inactive color
                        activeColor: Color(0xff3F48CC),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
