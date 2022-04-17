import 'package:flutter/material.dart';
import 'dart:math';

class CurrentPrayer {
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
