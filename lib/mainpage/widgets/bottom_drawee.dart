import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:islamicapp/mainpage/myhomepage.dart';
import 'package:islamicapp/mainpage/qibla.dart';
import 'package:islamicapp/mainpage/settings/settings.dart';
import 'package:islamicapp/mainpage/widgets/community.dart';
import 'package:islamicapp/mainpage/widgets/islamfeed.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    MyHomePage(),
  IslamFeed(),
   Community(),
    Settings()
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MyHomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.transparent,

          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => Qibla()));
          },
          child:
              //  Icon(Icons.add),
              Image.asset(
            'assets/group.png',
            height: 120,
            width: 120,
          )),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(

        color: Color(0xff321410),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        MyHomePage(); // if user taps on this dashboard tab will be active
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //  currentTab == 0 ? Image.asset('assets/homered.png',height: 30,width: 30,) : Image.asset('assets/home.png',height: 30,width: 30,)
                    Icon(
                      Icons.home,
                      color: currentTab == 0
                          ? Color(0xff3f48cc)
                          : Color(0xff8d8282),
                    ),
                
                
                
                    Text(
                      'Home',
                      style: TextStyle(
                         fontFamily: 'Gilroy',
                        fontSize: 10,
                        color: currentTab == 0
                            ? Color(0xff3f48cc)
                            : Color(0xff8d8282),
                      ),
                    )
                  ],
                ),
              ),
              //Orders
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                         IslamFeed();
                         // if user taps on this dashboard tab will be active
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Image.asset('assets/livevideo.png',height: 30,width: 30,),
                   
                    Text(
                      'Islamfeed',
                      style: TextStyle(
                         fontFamily: 'Gilroy',
                        fontSize: 10,
                        color: currentTab == 1
                            ? Color(0xff3f48cc)
                            : Color(0xff8d8282),
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        Community(); // if user taps on this dashboard tab will be active
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Image.asset('assets/com.png',height: 30,width: 30,),
                    
                    Text(
                      'Community',
                      style: TextStyle(
                         fontFamily: 'Gilroy',
                        fontSize: 10,
                        color: currentTab == 2
                            ? Color(0xff3f48cc)
                            : Color(0xff8d8282),
                      ),
                    )
                  ],
                ),
              ),

              ///Create Orders
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        Settings(); // if user taps on this dashboard tab will be active
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: currentTab == 3
                          ? Color(0xff3f48cc)
                          : Color(0xff8d8282),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                         fontFamily: 'Gilroy',
                        color: currentTab == 3
                            ? Color(0xff3f48cc)
                            : Color(0xff8d8282),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
