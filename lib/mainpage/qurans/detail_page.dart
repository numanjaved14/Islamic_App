import 'package:flutter/material.dart';

class SuratDetailsPage extends StatefulWidget {
  var snap;
  // int? number;
  // String? name;
  // String? englishName;
  // String? englishNameTranslation;
  // // RevelationType? revelationType;
  // List<Ayah>? ayahs;
  SuratDetailsPage({
    Key? key,
    required this.snap,
    // this.name,
    // this.ayahs,
    // this.englishName,
    // this.englishNameTranslation,
    // this.number,
  }) : super(key: key);

  @override
  State<SuratDetailsPage> createState() => _SuratDetailsPageState();
}

class _SuratDetailsPageState extends State<SuratDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(widget.snap.name),
          )),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(widget.snap.englishName!),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  'Meaining of name ${widget.snap.englishNameTranslation!}'),
            ),
          ),
        ),
        Container(
          height: 500,
          width: 300,
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                  itemCount: widget.snap.ayahs.length,
                  itemBuilder: (context, index) =>
                      Text(widget.snap.ayahs[index].toString())),
              // child: Text('Meaining of name ${widget.snap.ayahs}'),
            ),
          ),
        ),
      ]),
    );
  }
}
