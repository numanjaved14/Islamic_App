import 'package:flutter/material.dart';

import '../apicalls/apicall.dart';
import '../models/prayertimemodel.dart';

class Masijid extends StatelessWidget {
  var snap;
  Masijid({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Color(0xff441009),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )))),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Masjid',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Gilroy',
            ),
          ),
        ),
        // extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/back.png',
                ),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 230,
                      width: 368,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              image: AssetImage('assets/work.png'))),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              snap['mosqueName'],
                              style:
                                  TextStyle(fontSize: 34, color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.pin_drop,color:Colors.white),
                                Text(
                                  snap['location'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // width: MediaQuery.of(context).size.width * 2.0,
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '\$1',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  // width: MediaQuery.of(context).size.width * 2.0,
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '\$5',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  // width: MediaQuery.of(context).size.width * 2.0,
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '\$10',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  // width: MediaQuery.of(context).size.width * 2.0,
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '\$15',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  // width: MediaQuery.of(context).size.width * 2.0,
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'More...',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                               
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset('assets/btn.png',width: 130,)
                                ),
                                 
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset('assets/btnc.png',width: 130,fit: BoxFit.cover,)
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                      Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                    child: Text('Salah times',style: TextStyle(color: Colors.white,fontSize: 
20,fontWeight: FontWeight.bold),),
                                    
                                    ),
                  StreamBuilder<PrayerTimeModel>(
                      stream: ApiCalls().gettime(const Duration(seconds: 0)),
                      builder:
                          (context, AsyncSnapshot<PrayerTimeModel> snapshot) {
                        if (snapshot.hasData) {
                          PrayerTimeModel data = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                           


                              Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 15),
                                child: Table(
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
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Image(
                            image: NetworkImage(snap['photoUrl']),
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text(
                          snap['qariBio'] == null ? 'No Bio' : snap['qariBio'],
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
