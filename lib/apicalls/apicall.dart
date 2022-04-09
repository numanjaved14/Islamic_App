import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islamicapp/authentications/providers/models/dua_model.dart';
import 'package:islamicapp/authentications/providers/models/quran_audio_model.dart';
import 'package:islamicapp/authentications/providers/models/quran_text_asad_model.dart';
import 'package:islamicapp/authentications/providers/models/quran_text_model.dart';
import 'package:islamicapp/authentications/providers/models/test_model.dart';
import 'package:islamicapp/constants/url_links.dart';
import 'package:islamicapp/services/location_methods.dart';
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

  var client = http.Client();

//Internal JSON String used
  // Future<DuaModel> getDua() async {
  //   var dua = null;

  //   var myDataString = utf8.decode(duasVar.toString());

  //   var jsonMap = json.decode(myDataString);

  //   dua = DuaModel.fromJson(jsonMap);

  //   // try {
  //   //   var jsonMap = json.decode(duasVar.toString());

  //   //   dua = DuaModel.fromJson(jsonMap);
  //   // } catch (exception) {
  //   //   print(exception);
  //   //   return dua;
  //   // }

  //   return dua;
  // }

  Future<QuranTextModel> getQuranText() async {
    var response = await client.get(Uri.parse(''));
    var quranText = null;

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        quranText = QuranTextModel.fromJson(jsonMap);
      }
    } catch (exception) {
      print(exception);
      return quranText;
    }

    return quranText;
  }

  Future<QuranTest> getTestCall() async {
    var response = await client.get(Uri.parse(
        'http://api.alquran.cloud/v1/surah/114/editions/quran-uthmani,en.asad,en.pickthall'));
    var quranText = null;

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        quranText = QuranTest.fromJson(jsonMap);
      }
    } catch (exception) {
      print(exception);
      return quranText;
    }

    return quranText;
  }

  Future<QuranTextAsad> getQuranTextAsad() async {
    var response = await client.get(Uri.parse(Strings.quranTextAsadUrl));
    print(response.body);
    var quranText;

    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);

    quranText = QuranTextAsad.fromJson(jsonMap);
    print("Call Success: " + quranText);
    // try {
    //   if (response.statusCode == 200) {}
    // } catch (exception) {
    //   print("Call Failed: " + quranText);
    //   return quranText;
    // }

    return quranText;
  }

  Future<QuranAudio> getQuranAudio() async {
    var response = await client.get(Uri.parse(Strings.quranAudioUrl));
    var quranAudio = null;

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        quranAudio = QuranAudio.fromJson(jsonMap);
      }
    } catch (exception) {
      print(exception);
      return quranAudio;
    }

    return quranAudio;
  }

  Future<PrayerTimeModel> prayerTimebyAddress(String address) async {
    // var url=Uri.parse("https://api.aladhan.com/v1/timingsByAddress?address=$address");
    var response = await http.get(Uri.parse(
        "https://api.aladhan.com/v1/timingsByAddress?address=$address"));
    print(response.body);

    return PrayerTimeModel.fromJson(jsonDecode(response.body));
  }

  Future<PrayerTimeModel> gettiming(String address) async {
    // var url = Uri.parse("https://api.aladhan.com/v1/timingsByAddress?address=$address");

    final response = await http.get(Uri.parse(
        "https://api.aladhan.com/v1/timingsByAddress?address=$address"));
    print(response.body);

    return PrayerTimeModel.fromJson(jsonDecode(response.body));
  }

  Stream<PrayerTimeModel> gettime(Duration refreshTime) async* {
    var address = await LocationMethods().checkLocationStatus();
    while (true) {
      // await Future.delayed(refreshTime);
      yield await gettiming(address!);
    }
  }
}
