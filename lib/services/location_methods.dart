import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../qibla_direction/flutter_qiblah.dart';

class LocationMethods {
  Future<String?> checkLocationStatus() async {
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
      // print(Address);
      return place.locality;
      // var addresses = await Geocoder.local
      //     .findAddressesFromCoordinates(location.latitude, location.longitude);
      // var first = addresses.first;
      // debugPrint(first.toString());
    }
    return null;
  }
}
