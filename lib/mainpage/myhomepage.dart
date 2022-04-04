import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamicapp/mainpage/duaandhadith.dart';
import 'package:islamicapp/mainpage/prayertimes.dart';
import 'package:islamicapp/mainpage/qibla.dart';
import 'package:islamicapp/mainpage/qurans/quran.dart';
import 'package:islamicapp/mainpage/radio/radio-session.dart';
import 'package:islamicapp/mainpage/settings/settings.dart';

import '../services/location_methods.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? newdata;

  @override
  void initState() {
    getLocation();
    // TODO: implement initState
    super.initState();
  }

  void getLocation() async {
    await LocationMethods()
        .checkLocationStatus()
        .then((value) => newdata = value);
    setState(() {
      newdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // drawer: MyDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/back.png",
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => Settings()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          'assets/rec.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Next prayer time',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => Settings()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          'assets/set.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 110,
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
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          DateFormat.Hms().format(DateTime.now()),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                      'Isha',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1st Ramzan',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '23 Days',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Days left to Eid',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Qurans()));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset('assets/quran.png'),
                        ),
                        Text(
                          'Quran',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => PrayersTimes()));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset('assets/mos.png'),
                        ),
                        Text(
                          'Prayer Times',
                          style: TextStyle(color: Colors.white),
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
                            color: Color.fromRGBO(255, 255, 255, 0.25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset('assets/radio.png'),
                        ),
                        Text(
                          'Q/A Radio',
                          style: TextStyle(color: Colors.white),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => DuaAndHadith()));
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset('assets/ram.png'),
                        ),
                      ),
                      Text(
                        'Dua/Hadiths',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Qibla()));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            'assets/qib.png',
                          ),
                        ),
                        Text(
                          'Qibla',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Settings()));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            'assets/sett.png',
                          ),
                        ),
                        Text(
                          'Setting',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
