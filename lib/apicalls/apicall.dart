import 'dart:convert';

import 'package:http/http.dart';
import '../models/prayertimemodel.dart';

class ApiCalls {
//   Future<PrayerTimeModel>prayerTimes(double latitude,double longitude,String timestamp)async{
//     print(latitude);
//     print(longitude);
//     print(timestamp);
//     var url=Uri.parse("https://api.aladhan.com/v1/timings/${timestamp}?latitude=${latitude.toString()}&longitude=${longitude.toString()}&method=2");
//     var response=await Dio(). get(url);
// print(response.body);

//       return PrayerTimeModel.fromJson(jsonDecode(response.body));

//   }
  Future<PrayerTimeModel> prayerTimebyAddress(String address) async {
    // var url=Uri.parse("https://api.aladhan.com/v1/timingsByAddress?address=$address");
    var response = await get(Uri.parse(
        "https://api.aladhan.com/v1/timingsByAddress?address=$address"));
    print(response.body);

    return PrayerTimeModel.fromJson(jsonDecode(response.body));
  }

  Future<PrayerTimeModel> gettiming(String address) async {
    // var url = Uri.parse("https://api.aladhan.com/v1/timingsByAddress?address=$address");

    final response = await get(Uri.parse(
        "https://api.aladhan.com/v1/timingsByAddress?address=$address"));
    print(response.body);

    return PrayerTimeModel.fromJson(jsonDecode(response.body));
  }

  Stream<PrayerTimeModel> gettime(Duration refreshTime, String address) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await gettiming(address);
    }
  }
}
