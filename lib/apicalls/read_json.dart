import 'dart:convert';

import 'package:islamicapp/authentications/providers/models/dua_model.dart';

import 'package:flutter/services.dart' as rootBundle;
import 'package:islamicapp/authentications/providers/models/hadith_model.dart';

class ReadJSON {
  Future<List<DuaModel>> ReadJsonDua() async {
    //read json file
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/dua_list.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => DuaModel.fromJson(e)).toList();
  }

  Future<List<HadithModel>> ReadJsonHadith() async {
    //read json file
    final jsondata = await rootBundle.rootBundle
        .loadString('jsonfile/Hisnul_muslim_dua_item.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => HadithModel.fromJson(e)).toList();
  }
}
