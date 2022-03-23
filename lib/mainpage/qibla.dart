import 'package:flutter/material.dart';

class Qibla extends StatefulWidget {
  const Qibla({ Key? key }) : super(key: key);

  @override
  State<Qibla> createState() => _QiblaState();
}

class _QiblaState extends State<Qibla> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/back.png",),fit: BoxFit.cover)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff45211a),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Icon(Icons.arrow_back,color: Colors.white,),
                        ),
                      ),
                      Text('Qibla',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                        Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff45211a),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Icon(Icons.map,color: Colors.white,),
                      )
                    ],
                  ),
                ),
                 
                Container(
                  margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                  child: Image.asset('assets/maos.png'),
                ),
                 Stack(
                   children: [
                     Container(
                      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      child: Image.asset('assets/q.png',height: 300,),
                ),
                   ],
                 )
              ],
            ),
            )
            
        
      ),
    );
  }
}