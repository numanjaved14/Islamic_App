import 'package:flutter/material.dart';

class PrayersTimes extends StatefulWidget {
  const PrayersTimes({ Key? key }) : super(key: key);

  @override
  State<PrayersTimes> createState() => _PrayersTimesState();
}

class _PrayersTimesState extends State<PrayersTimes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,body:  Container(
         width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/back.png",),fit: BoxFit.cover)
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.arrow_back,color: Colors.white,),
                    ),
                  ),
                  Center(
                   
                    child: Text('Next prayer time',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset('assets/set.png',height: 50,width: 50,),
                      ),
                    )
                ],
              ),
              ),
                SizedBox(
                height: 110,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.location_on,color: Colors.white,),
                      Text('Lahore',style: TextStyle(color: Colors.white),)
                    ],),
                    
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('05:45:44',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
                       Text('Isha',style: TextStyle(color: Colors.white),),

                  ],
                ),
              ),
              Spacer(),
               Container(
                 margin: EdgeInsets.only(left: 20),
                 child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Today',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              Text('1st Ramzan',style: TextStyle(color: Colors.white),)
                          ],
                        ),
               ),
SizedBox(height: 20,),
               Column(
                 children: [
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text('Dhuhr',style: TextStyle(color: Colors.white),),
                       Text('01:30(PM)',style: TextStyle(color: Colors.white)),
                       Icon(Icons.notifications,color: Colors.white,)
                     ],
                   ),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text('Asar',style: TextStyle(color: Colors.white),),
                       Text('01:30(PM)',style: TextStyle(color: Colors.white)),
                       Icon(Icons.notifications,color: Colors.white,)
                     ],
                   ),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text('Maghrib',style: TextStyle(color: Colors.white),),
                       Text('01:30(PM)',style: TextStyle(color: Colors.white)),
                       Icon(Icons.notifications,color: Colors.white,)
                     ],
                   ),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text('Isha',style: TextStyle(color: Colors.white),),
                       Text('01:30(PM)',style: TextStyle(color: Colors.white)),
                       Icon(Icons.notifications,color: Colors.white,)
                     ],
                   ),
                   SizedBox(height: 20,),
                 ],
               ),
               Spacer()
               
          ],
        ),
      ),),
      
    );
  }
}