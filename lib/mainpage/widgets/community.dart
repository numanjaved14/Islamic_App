import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'News',
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
              Container(
                height: 300,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (index, context) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                        width: MediaQuery.of(this.context).size.width,
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Image.asset(
                                  'assets/happy.png',
                                  height: 200,
                                  fit: BoxFit.cover,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Tadarus Bulan Ramandan',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'Today',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20),
                                    ))
                              ],
                            ),
                            Text(
                              'Latest News',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                child: Text('Latest News',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),

                    
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: ((context, index) {
                  return  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(left: 10, right: 10,top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    child: Column(
                      children: [
                        Row(
                          children: [
                             Container(
                                  decoration: BoxDecoration(
                                    
                                      borderRadius: BorderRadius.circular(20)),
                                  margin:
                                      EdgeInsets.only(top: 10, bottom: 10,left: 10,right: 10),
                                  child: Image.asset(
                                    'assets/lovr.png',
                                    width: 130,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                             
                            
                             Expanded(child: 
                             Column(
                               children: [
                                 Text("Tadarus Bulan Mahe Eid Ramandan's",style: TextStyle(color: Color(0xff555555),fontSize: 20,fontWeight: FontWeight.bold),),
                                 SizedBox(height: 10,),
                                 Text('By Faheem Khan,   12min ago')
                               ],
                             ))
                
                          ],
                        )
                      ],
                    ),
                  
                );
                })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
