import 'package:flutter/material.dart';

class RadioSessions extends StatefulWidget {
  const RadioSessions({Key? key}) : super(key: key);

  @override
  State<RadioSessions> createState() => _RadioSessionsState();
}

class _RadioSessionsState extends State<RadioSessions> {
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
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
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
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Radio',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        height: 70,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/red.png',
                                ),
                                fit: BoxFit.cover)),
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.radio,
                              color: Colors.white,
                            ),
                            label: Text('Live Quran',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.red
                      // border: Border.all(
                      //     style: BorderStyle.solid,
                      //     width: 2,
                      //     color: Colors.red)
                          ),
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 200,
                    height: 200,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'JOIN',
                      style: TextStyle(color: Color(0xff3F48CC), 
                      
                      
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      
                      fixedSize: Size(150, 50),
                      primary: Colors.white,shape: StadiumBorder()),
                  )),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                      ),
                      color: Colors.white
                    ),
                    
                  )
            ],
          ),
        ),
      ),
    );
  }
}
