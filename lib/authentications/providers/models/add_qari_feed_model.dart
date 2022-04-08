class AddQariFeedModel {
  final String qariName;
  final String mosqueName;
  final String location;
  var locationCo_ordinate;

  AddQariFeedModel({
    required this.qariName,
    required this.mosqueName,
    required this.location,
    required this.locationCo_ordinate,
  });

  Map<String, dynamic> toJson() => {
        'qariName': qariName,
        'mosqueName': mosqueName,
        'location': location,
        'locationCo-ordinate': locationCo_ordinate,
      };
}
