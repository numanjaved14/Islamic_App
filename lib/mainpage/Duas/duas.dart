import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islamicapp/apicalls/apicall.dart';
import 'package:islamicapp/apicalls/read_json.dart';
import 'package:islamicapp/authentications/providers/models/dua_model.dart';

class Duas extends StatefulWidget {
  const Duas({Key? key}) : super(key: key);

  @override
  State<Duas> createState() => _DuasState();
}

class _DuasState extends State<Duas> {
  // late Future<DuaModel> _duaModel;

  @override
  void initState() {
    // _duaModel = ApiCalls().getDua();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Svg(
              'assets/back.svg',
              size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
            ),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff45211a),
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'Duas',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontStyle: FontStyle.normal),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: ReadJSON().ReadJsonDua(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    } else if (data.hasData) {
                      var items = data.data as List<DuaModel>;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemCount: items == null ? 0 : items.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              margin:
                                  EdgeInsets.only(left: 5, right: 5, top: 20),
                              width: MediaQuery.of(this.context).size.width,
                              // height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Color(0xff3F48CC),
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(items[index].id!,
                                              style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal)),
                                        ),
                                        Spacer(),
                                        Icon(Icons.share,
                                            color: Color.fromARGB(
                                                255, 244, 244, 245)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(Icons.play_arrow,
                                            color: Color.fromARGB(
                                                255, 244, 244, 245))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          'assets/bismillah.png',
                                          height: 70,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(items[index].translation!,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal)),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
