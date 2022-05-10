import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../apicalls/apicall.dart';
import '../models/prayertimemodel.dart';

class Masijid extends StatefulWidget {
  var snap;
  Masijid({Key? key, required this.snap}) : super(key: key);

  @override
  State<Masijid> createState() => _MasijidState();
}

class _MasijidState extends State<Masijid> {
  Map<String, dynamic>? paymentIntentData;
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
                    ),
                  ),
                ),
              ),
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
                              widget.snap['mosqueName'],
                              style:
                                  TextStyle(fontSize: 34, color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.pin_drop, color: Colors.white),
                                Text(
                                  widget.snap['location'],
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
                                    onTap: () async {
                                      await makePayment();
                                    },
                                    child: Image.asset(
                                      'assets/btn.png',
                                      width: 130,
                                    )),
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/btnc.png',
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Text(
                      'Salah times',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
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
                                          Text(
                                              data.data.timings.fajr +
                                                  ' ' +
                                                  '' +
                                                  '(AM)',
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
                                  )),
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
                                          Text(
                                              data.data.timings.dhuhr +
                                                  ' ' +
                                                  '' +
                                                  '(PM)',
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
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: Table(
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
                                          Text(
                                              data.data.timings.asr +
                                                  ' ' +
                                                  '' +
                                                  '(PM)',
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
                                  )),
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
                                          Text(
                                              data.data.timings.maghrib +
                                                  ' ' +
                                                  '' +
                                                  '(PM)',
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
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: Table(
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
                                          Text(
                                              data.data.timings.isha +
                                                  ' ' +
                                                  '' +
                                                  '(PM)',
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
                                  )),
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
                            image: NetworkImage(widget.snap['photoUrl']),
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text(
                          widget.snap['qariBio'] == null
                              ? 'No Bio'
                              : widget.snap['qariBio'],
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

  Future<void> makePayment() async {
    try {
      paymentIntentData =
          await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  applePay: true,
                  googlePay: true,
                  testEnv: true,
                  style: ThemeMode.dark,
                  merchantCountryCode: 'US',
                  merchantDisplayName: 'ANNIE'))
          .then((value) {});

      ///now finally display payment sheeet

      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              parameters: PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ))
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51KxapZBmHAwiQPYIeGYaKoAnhFCuSlvK0nwXz1WKwPWBFZtsM9AHa2qPyXgc5NbQ1kYAR7pJZpJg6a7qFxQKtQ5400E2r0jzdX',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
