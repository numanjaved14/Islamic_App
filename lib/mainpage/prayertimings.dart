import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamicapp/apicalls/apicall.dart';
import 'package:intl/intl.dart';
import 'package:islamicapp/mainpage/settings/settings.dart';

import '../models/prayertimemodel.dart';
import '../services/location_methods.dart';

class PrayersTimes extends StatefulWidget {
  const PrayersTimes({Key? key}) : super(key: key);

  @override
  State<PrayersTimes> createState() => _PrayersTimesState();
}

class _PrayersTimesState extends State<PrayersTimes> {
  String? newdata;
  String? cPrayer;
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
        cPrayer = currentPrayer(time);
        print(cPrayer);
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                      child: Icon(Icons.arrow_back)
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
       extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    cPrayer == 'Fajr'
                        ? "assets/fajr_back.png"
                        : cPrayer == 'Dhuhr'
                            ? "assets/duhr_back.png"
                            : cPrayer == 'Asar'
                                ? "assets/asr_back.png"
                                : cPrayer == 'Maghrib'
                                    ? "assets/maghrib_back.png"
                                    : "assets/isha_back.png",
                  ),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Spacer(),
      
              Container(
                margin: EdgeInsets.only(top: 10),
                child: StreamBuilder<PrayerTimeModel>(
                    stream: ApiCalls().gettime(const Duration(seconds: 0)),
                    builder: (context, AsyncSnapshot<PrayerTimeModel> snapshot) {
                      if (snapshot.hasData) {
                        PrayerTimeModel data = snapshot.data!;
                        return Column(
                          children: [
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
                                      margin: EdgeInsets.only(top: 14),
                                      child: Text(
                                        DateFormat.Hms().format(DateTime.now()),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Text(
                                    cPrayer!,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                                    'Today',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data.data.date.hijri!.month!.number
                                            .toString() +
                                        '  ' +
                                        data.data.date.hijri!.month!.en
                                            .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                            SizedBox(
                              height:20,
                            ),

                          
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15, right: 15, top: 15),
                                  child:  Table(
                                          children: [
                                            TableRow(children: [
                                              Column(children: [
                                                Text('Fajr',
                                                    style: TextStyle(
                                                        color: Colors.white))
                                              ]),
                                               Column(children: [
                                                Text('',
                                                    style: TextStyle(
                                                        color: Colors.white))
                                              ]),
                                              Column(children: [
                                                Text(data.data.timings.fajr +' '+''+ '(AM)',
                                                    style: TextStyle(
                                                        color: Colors.white))
                                              ]),
                                             
                                              Column(children: [
                                                Icon(
                                                  Icons.notifications,
                                                  color: Colors.white,
                                                )
                                              ]),
                                            ]),
                                          ],
                                        )
                                  ),
                             
                              Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 15),
                                child: Table(
                                      children: [
                                        TableRow(children: [
                                          Column(children: [
                                            Text('Dhuhr',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                           Column(children: [
                                            Text('',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),

                                          Column(children: [
                                            Text(data.data.timings.dhuhr + ' '+''+ '(PM)',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                          Column(children: [
                                            Icon(
                                              Icons.notifications,
                                              color: Colors.white,
                                            )
                                          ]),
                                        ]),
                                      ],
                                    )
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 15),
                                child:Table(
                                      children: [
                                        TableRow(children: [
                                          Column(children: [
                                            Text('Asar',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                           Column(children: [
                                            Text('',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),

                                          Column(children: [
                                            Text(data.data.timings.asr + ' '+''+ '(PM)',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                          Column(children: [
                                            Icon(
                                              Icons.notifications,
                                              color: Colors.white,
                                            )
                                          ]),
                                        ]),
                                      ],
                                    )
                              ),
                             Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 15),
                                child: Table(
                                      children: [
                                        TableRow(children: [
                                          Column(children: [
                                            Text('Maghrib',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                          Column(children: [
                                            Text('',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                          Column(children: [
                                            Text(data.data.timings.maghrib + ' '+''+ '(PM)',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                          Column(children: [
                                            Icon(
                                              Icons.notifications,
                                              color: Colors.white,
                                            )
                                          ]),
                                        ]),
                                      ],
                                    )
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 15),
                                child:  Table(
                                      children: [
                                        TableRow(children: [
                                          Column(children: [
                                            Text('Isha',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                          Column(children: [
                                            Text('',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                          Column(children: [
                                            Text(data.data.timings.isha + ' '+''+ '(PM)',
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ]),
                                          Column(children: [
                                            Icon(
                                              Icons.notifications,
                                              color: Colors.white,
                                            )
                                          ]),
                                        ]),
                                      ],
                                    )
                              )
                           
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      //  Column(
                      //    children: [
                      //      SizedBox(height: 20,),
                      //      Row(
                      //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //        children: [
                      //          Text('Dhuhr',style: TextStyle(color: Colors.white),),
                      //          Text('01:30(PM)',style: TextStyle(color: Colors.white)),
                      //          Icon(Icons.notifications,color: Colors.white,)
                      //        ],
                      //      ),
                      //      SizedBox(height: 20,),
                      //      Row(
                      //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //        children: [
                      //          Text('Asar',style: TextStyle(color: Colors.white),),
                      //          Text('01:30(PM)',style: TextStyle(color: Colors.white)),
                      //          Icon(Icons.notifications,color: Colors.white,)
                      //        ],
                      //      ),
                      //      SizedBox(height: 20,),
                      //      Row(
                      //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //        children: [
                      //          Text('Maghrib',style: TextStyle(color: Colors.white),),
                      //          Text('01:30(PM)',style: TextStyle(color: Colors.white)),
                      //          Icon(Icons.notifications,color: Colors.white,)
                      //        ],
                      //      ),
                      //      SizedBox(height: 20,),
                      //      Row(
                      //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //        children: [
                      //          Text('Isha',style: TextStyle(color: Colors.white),),
                      //          Text('01:30(PM)',style: TextStyle(color: Colors.white)),
                      //          Icon(Icons.notifications,color: Colors.white,)
                      //        ],
                      //      ),
                      //      SizedBox(height: 20,),
                      //    ],
                      //  ),
                      //  Spacer()
      
                      // ],
                    }),
              ),
            ]),
          ),
        ),
          
      );
  }

//Round off double to specific length
  double roundDouble(double value, int places) {
    double mod = pow(10.0, places).toDouble();
    return ((value * mod).round().toDouble() / mod);
  }

//Convert TimeOfDay to double
  double toDouble(TimeOfDay myTime) =>
      roundDouble(myTime.hour.toDouble() + myTime.minute.toDouble() / 60, 2);

//Calculate current prayer time
  String currentPrayer(TimeOfDay time) {
    double timeD = toDouble(time);
    print(timeD);
    if (timeD >= 4.65 && timeD <= 12.2) {
      print('A');
      return 'Fajr';
    } else if (timeD >= 12.2 && timeD <= 16.6) {
      print('B');
      return 'Dhuhr';
    } else if (timeD >= 16.6 && timeD <= 18.42) {
      print('C');
      return 'Asar';
    } else if (timeD >= 18.42 && timeD <= 20.78) {
      print('D');
      return 'Maghrib';
    } else if (timeD >= 20.78 && timeD <= 4.65) {
      print('E');
      return 'Isha';
    } else {
      print('No timing condition is executed');
      return '';
    }
  }
}