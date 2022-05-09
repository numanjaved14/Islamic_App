import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        appBar: AppBar(
           backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding:  EdgeInsets.only(top:8.0,bottom: 8),
            child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
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
          ),
                    title: Text(
                      'Dua/Hadiths',
                      style: TextStyle(
                         fontFamily: 'Gilroy',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    centerTitle: true,
        ),
        backgroundColor: Colors.white,
        extendBody:true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/back.png",
                  ),
                  fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
               
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
                                  child: SvgPicture.asset(
                                    'assets/ram.svg',
                                    width: 130,
                                  ),
                                ),
                             
                            
                             Expanded(child: 
                             Column(
                               children: [
                                 Text("Dua's",style: TextStyle(color: Color(0xff555555), fontFamily: 'Gilroy',fontSize: 30,fontWeight: FontWeight.bold),),
                                 SizedBox(height: 10,),
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
                                  child: SvgPicture.asset(
                                    'assets/qurans.svg',
                                    width: 130,
                                  ),
                                ),
                             
                            
                             Expanded(child: 
                             Column(
                               children: [
                                 Text("Hadiths",style: TextStyle(color: Color(0xff555555), fontFamily: 'Gilroy',fontSize: 30,fontWeight: FontWeight.bold),),
                                 SizedBox(height: 10,),
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
      ),
    );
  }
}
