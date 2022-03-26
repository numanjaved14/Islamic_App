import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamicapp/apicalls/apicall.dart';
import 'package:islamicapp/models/prayertimemodel.dart';
import 'package:islamicapp/qibla_direction/flutter_qiblah.dart';

class PrayersTimes extends StatefulWidget {
  const PrayersTimes({Key? key}) : super(key: key);

  @override
  State<PrayersTimes> createState() => _PrayersTimesState();
}

class _PrayersTimesState extends State<PrayersTimes> {
  Future<String?>? newdata;

  // @override
  // void initState() {
  //   newdata = _checkLocationStatus();
  //   // TODO: implement initState
  //   super.initState();
  // }

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
                      'Lahore',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      '05:45:44',
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
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1st Ramzan',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<PrayerTimeModel>(
              stream: ApiCalls().gettime(Duration(seconds: 0), 'Lahore'),
              builder: (context, AsyncSnapshot<PrayerTimeModel> snapshot) {
                if (snapshot.hasData) {
                  PrayerTimeModel data = snapshot.data!;
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Card(
                          color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

  Future<String?> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled) {
      var position = await Geolocator.getCurrentPosition();
      // debugPrint(location.altitude.toString());
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      print(placemarks);
      Placemark place = placemarks[0];
      var Address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      print(Address);
      return place.locality;
      // var addresses = await Geocoder.local
      //     .findAddressesFromCoordinates(location.latitude, location.longitude);
      // var first = addresses.first;
      // debugPrint(first.toString());
    }
    return null;
  }
}
