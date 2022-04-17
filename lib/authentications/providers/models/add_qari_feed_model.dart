import 'dart:typed_data';

class AddQariFeedModel {
  final String qariName;
  final String mosqueName;
  final String location;
  final String photoUrl;
  final String qariBio;
  // var locationCo_ordinate;

  AddQariFeedModel(
      {required this.qariName,
      required this.mosqueName,
      required this.location,
      required this.photoUrl,
      required this.qariBio
      // required this.locationCo_ordinate,
      });

  Map<String, dynamic> toJson() => {
        'qariName': qariName,
        'mosqueName': mosqueName,
        'location': location,
        'photoUrl': photoUrl,
        'qariBio': qariBio,
        // 'locationCo-ordinate': locationCo_ordinate,
      };
}
