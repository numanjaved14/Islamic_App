import 'package:flutter/material.dart';
import 'package:islamicapp/apicalls/apicall.dart';
import 'package:intl/intl.dart';

import '../models/prayertimemodel.dart';
import '../services/location_methods.dart';

class PrayersTimes extends StatefulWidget {
  const PrayersTimes({Key? key}) : super(key: key);

  @override
  State<PrayersTimes> createState() => _PrayersTimesState();
}

class _PrayersTimesState extends State<PrayersTimes> {
  String? newdata;

  @override
  void initState() {
    getLocation();
    // TODO: implement initState
    super.initState();
  }

  void getLocation() async {
    setState(() async {
      newdata = await LocationMethods().checkLocationStatus();
    });
  }

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
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
          // Spacer(),

          StreamBuilder<PrayerTimeModel>(
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
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data.data.date.hijri!.month!.number.toString() +
                                  '  ' +
                                  data.data.date.hijri!.month!.en.toString(),
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Card(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fajr',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(data.data.timings.fajr,
                                    style: TextStyle(color: Colors.white)),
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text(
                          //     "Fajr",
                          //     style: TextStyle(color: Colors.white),
                          //   ),

                          //   // ignore: deprecated_member_use
                          //   trailing: TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       data.data.timings.fajr,
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Card(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dhuhr',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(data.data.timings.dhuhr,
                                    style: TextStyle(color: Colors.white)),
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          //  ListTile(
                          //   title: Text(
                          //     "Dhuhr",
                          //     style: TextStyle(color: Colors.white),
                          //   ),

                          // ignore: deprecated_member_use
                          //   trailing: TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       data.data.timings.dhuhr,
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Card(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Asar',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(data.data.timings.asr,
                                    style: TextStyle(color: Colors.white)),
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text(
                          //     "Asr",
                          //     style: TextStyle(color: Colors.white),
                          //   ),

                          //   // ignore: deprecated_member_use
                          //   trailing: TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       data.data.timings.asr,
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Card(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Maghrib',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(data.data.timings.maghrib,
                                    style: TextStyle(color: Colors.white)),
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text(
                          //     "Maghrib",
                          //     style: TextStyle(color: Colors.white),
                          //   ),

                          //   // ignore: deprecated_member_use
                          //   trailing: TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       data.data.timings.maghrib,
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Card(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Isha',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(data.data.timings.isha,
                                    style: TextStyle(color: Colors.white)),
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text(
                          //     "Isha",
                          //     style: TextStyle(color: Colors.white),
                          //   ),

                          //   // ignore: deprecated_member_use
                          //   trailing: TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       data.data.timings.isha,
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
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
        ]),
      ),
    ));
  }

  // String currentPrayer(String dateTime){
  //   TimeOfDay.now()
  // }
}
