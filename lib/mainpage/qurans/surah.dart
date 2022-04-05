
import 'package:flutter/material.dart';
import 'package:islamicapp/authentications/providers/models/quran_audio_model.dart';

import '../../apicalls/apicall.dart';

class SurahPage extends StatefulWidget {
  var snap;
  SurahPage({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  late Future<QuranAudio> _quranAudio;

  @override
  void initState() {
    _quranAudio = ApiCalls().getQuranAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.snap.name!)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.snap.name!),
          SizedBox(
            height: 10,
          ),
          Text(widget.snap.revelationType!),
          SizedBox(
            height: 20,
          ),
          Text(widget.snap.ayahs!),
          SizedBox(
            height: 10,
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height * 0.1,
          //   child: FutureBuilder<QuranAudio>(
          //       future: _quranAudio,
          //       builder: (context, snapshot) {
          //         if(snapshot.hasData){
          //           return Container();
          //         }
          //               if (snapshot.hasData &&
          //                   snapshot.data!.data!.surahs![widget.snap.name!]) {
          //                return IconButton(
          //                   icon: Icon(Icons.play_arrow),
          //                   onPressed: () => play() async {
          // int result = await audioPlayer.play(url);
          // if (result == 1) {
          //   // success
          // }

          // },
          //                   );
          //                 } else
          //                   return CircularProgressIndicator();
          //               }),
          //         )
        ],
      ),
    );
  }
}
