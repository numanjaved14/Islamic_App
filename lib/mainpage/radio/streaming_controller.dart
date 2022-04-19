import 'package:url_launcher/url_launcher.dart';

// const String _url = 'https://flutter.dev';

void launchURL(String url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
