import 'package:flutter/material.dart';
import 'package:islamicapp/mainpage/Duas/duas.dart';
import 'package:islamicapp/mainpage/Duas/hadith.dart';

class DuaAndHadith extends StatefulWidget {
  const DuaAndHadith({Key? key}) : super(key: key);

  @override
  State<DuaAndHadith> createState() => _DuaAndHadithState();
}

class _DuaAndHadithState extends State<DuaAndHadith> {
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
                  image: AssetImage(
                    "assets/back.png",
                  ),
                  fit: BoxFit.cover)),
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
                      'Dua/Hadiths',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
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
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => Duas()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(left: 10, right: 10,top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Column(
                    children: [
                      Row(
                        children: [
                           Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff3F48CC),
                                    borderRadius: BorderRadius.circular(20)),
                                margin:
                                    EdgeInsets.only(top: 10, bottom: 10,left: 10,right: 10),
                                child: Image.asset(
                                  'assets/ramadan.png',
                                  width: 130,
                                ),
                              ),
                           
                          
                           Expanded(child: 
                           Column(
                             children: [
                               Text("Dua's",style: TextStyle(color: Color(0xff555555),fontSize: 30,fontWeight: FontWeight.bold),),
                               SizedBox(height: 10,),
                               Text('Lorem Ipsum as their default and a search for')
                             ],
                           ))
              
                        ],
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => Hadiths()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(left: 10, right: 10,top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Column(
                    children: [
                      Row(
                        children: [
                           Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff3F48CC),
                                    borderRadius: BorderRadius.circular(20)),
                                margin:
                                    EdgeInsets.only(top: 10, bottom: 10,left: 10,right: 10),
                                child: Image.asset(
                                  'assets/quran.png',
                                  width: 130,
                                ),
                              ),
                           
                          
                           Expanded(child: 
                           Column(
                             children: [
                               Text("Hadiths",style: TextStyle(color: Color(0xff555555),fontSize: 30,fontWeight: FontWeight.bold),),
                               SizedBox(height: 10,),
                               Text('Lorem Ipsum as their default and a search for')
                             ],
                           ))
              
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
