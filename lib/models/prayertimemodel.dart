// To parse this JSON data, do
//
//     final prayerTimeModel = prayerTimeModelFromJson(jsonString);

import 'dart:convert';

PrayerTimeModel prayerTimeModelFromJson(String str) =>
    PrayerTimeModel.fromJson(json.decode(str));

String prayerTimeModelToJson(PrayerTimeModel data) =>
    json.encode(data.toJson());

class PrayerTimeModel {
  PrayerTimeModel({
    required this.code,
    required this.status,
    required this.data,
  });

  int code;
  String status;
  Data data;

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) =>
      PrayerTimeModel(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.timings,
    required this.date,
  });

  Timings timings;
  Date date;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        timings: Timings.fromJson(json["timings"]),
        date: Date.fromJson(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "timings": timings.toJson(),
        "date": date.toJson(),
      };
}

class Date {
  Date({
    this.readable,
    this.timestamp,
    this.hijri,
    this.gregorian,
  });

  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        readable: json["readable"] != null ? json["readable"] : "null",
        timestamp: json["timestamp"] != null ? json["timestamp"] : "null",
        hijri: json["hijri"] != null ? Hijri.fromJson(json["hijri"]) : null,
        gregorian: json["gregorian"] != null
            ? Gregorian.fromJson(json["gregorian"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "readable": readable,
        "timestamp": timestamp,
        "hijri": hijri!.toJson(),
        "gregorian": gregorian!.toJson(),
      };
}

class Gregorian {
  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  String? date;
  String? format;
  String? day;
  GregorianWeekday? weekday;
  GregorianMonth? month;
  String? year;
  Designation? designation;

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json["date"] != null ? json["date"] : "null",
        format: json["format"] != null ? json["format"] : "null",
        day: json["day"] != null ? json["day"] : "null",
        weekday: GregorianWeekday.fromJson(json["weekday"]),
        month: GregorianMonth.fromJson(json["month"]),
        year: json["year"] != null ? json["year"] : null,
        designation: Designation.fromJson(json["designation"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday!.toJson(),
        "month": month!.toJson(),
        "year": year,
        "designation": designation!.toJson(),
      };
}

class Designation {
  Designation({
    this.abbreviated,
    this.expanded,
  });

  String? abbreviated;
  String? expanded;

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: json["abbreviated"] != null ? json["abbreviated"] : "null",
        expanded: json["expanded"] != null ? json["expanded"] : "null",
      );

  Map<String, dynamic> toJson() => {
        "abbreviated": abbreviated!,
        "expanded": expanded!,
      };
}

class GregorianMonth {
  GregorianMonth({
    this.number,
    this.en,
  });

  int? number;
  String? en;

  factory GregorianMonth.fromJson(Map<String, dynamic> json) => GregorianMonth(
        number: json["number"] != null ? json["number"] : "null",
        en: json["en"] != null ? json["en"] : "null",
      );

  Map<String, dynamic> toJson() => {
        "number": number!,
        "en": en!,
      };
}

class GregorianWeekday {
  GregorianWeekday({
    this.en,
  });

  String? en;

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) =>
      GregorianWeekday(
        en: json["en"] != null ? json["en"] : "null",
      );

  Map<String, dynamic> toJson() => {
        "en": en!,
      };
}

class Hijri {
  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
  });

  String? date;
  String? format;
  String? day;
  HijriWeekday? weekday;
  HijriMonth? month;
  String? year;
  Designation? designation;
  List<dynamic>? holidays;

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
        date: json["date"] != null ? json["date"] : "null",
        format: json["format"] != null ? json["format"] : "null",
        day: json["day"] != null ? json["day"] : "null",
        weekday: HijriWeekday.fromJson(json["weekday"]),
        month: HijriMonth.fromJson(json["month"]),
        year: json["year"] != null ? json["year"] : "null",
        designation: Designation.fromJson(json["designation"]),
        holidays: List<dynamic>.from(json["holidays"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date!,
        "format": format!,
        "day": day!,
        "weekday": weekday!.toJson(),
        "month": month!.toJson(),
        "year": year!,
        "designation": designation!.toJson(),
        "holidays": List<dynamic>.from(holidays!.map((x) => x)),
      };
}

class HijriMonth {
  HijriMonth({
    this.number,
    this.en,
    this.ar,
  });

  int? number;
  String? en;
  String? ar;

  factory HijriMonth.fromJson(Map<String, dynamic> json) => HijriMonth(
        number: json["number"] != null ? json["number"] : "null",
        en: json["en"] != null ? json["en"] : "null",
        ar: json["ar"] != null ? json["ar"] : "null",
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
        "ar": ar,
      };
}

class HijriWeekday {
  HijriWeekday({
    this.en,
    this.ar,
  });

  String? en;
  String? ar;

  factory HijriWeekday.fromJson(Map<String, dynamic> json) => HijriWeekday(
        en: json["en"] != null ? json["en"] : "null",
        ar: json["ar"] != null ? json["ar"] : "null",
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

// class Meta {
//     Meta({
//         required this.latitude,
//         required this.longitude,
//         required this.timezone,
//         required this.method,
//         required this.latitudeAdjustmentMethod,
//         required this.midnightMode,
//         required this.school,
//         required this.offset,
//     });

//     double latitude;
//     double longitude;
//     String timezone;
//     Method method;
//     String latitudeAdjustmentMethod;
//     String midnightMode;
//     String school;
//     Map<String, int> offset;

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         latitude: json["latitude"].toDouble(),
//         longitude: json["longitude"].toDouble(),
//         timezone: json["timezone"],
//         method: Method.fromJson(json["method"]),
//         latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
//         midnightMode: json["midnightMode"],
//         school: json["school"],
//         offset: Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
//     );

//     Map<String, dynamic> toJson() => {
//         "latitude": latitude,
//         "longitude": longitude,
//         "timezone": timezone,
//         "method": method.toJson(),
//         "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
//         "midnightMode": midnightMode,
//         "school": school,
//         "offset": Map.from(offset).map((k, v) => MapEntry<String, dynamic>(k, v)),
//     };
// }

// class Method {
//     Method({
//         required this.id,
//         required this.name,
//         required this.params,
//         required this.location,
//     });

//     int id;
//     String name;
//     Params params;
//     Location location;

//     factory Method.fromJson(Map<String, dynamic> json) => Method(
//         id: json["id"],
//         name: json["name"],
//         params: Params.fromJson(json["params"]),
//         location: Location.fromJson(json["location"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "params": params.toJson(),
//         "location": location.toJson(),
//     };
// }

// class Location {
//     Location({
//         required this.latitude,
//         required this.longitude,
//     });

//     double latitude;
//     double longitude;

//     factory Location.fromJson(Map<String, dynamic> json) => Location(
//         latitude: json["latitude"].toDouble(),
//         longitude: json["longitude"].toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "latitude": latitude,
//         "longitude": longitude,
//     };
// }

// class Params {
//     Params({
//         required this.fajr,
//         required this.isha,
//     });

//     int fajr;
//     int isha;

//     factory Params.fromJson(Map<String, dynamic> json) => Params(
//         fajr: json["Fajr"],
//         isha: json["Isha"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Fajr": fajr,
//         "Isha": isha,
//     };
// }

class Timings {
  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
  });

  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String imsak;
  String midnight;

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
        midnight: json["Midnight"],
      );

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Imsak": imsak,
        "Midnight": midnight,
      };
}
