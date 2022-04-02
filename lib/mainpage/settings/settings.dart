import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff350801), 
          elevation: 0,
          leading:   Container(
            padding: EdgeInsets.only(top: 8,bottom: 8),
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
                           
       centerTitle: true,
title:                     Text('Profile',style: TextStyle(color: Colors.white,fontSize: 20),)    ,
           
        ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: Container(
                    height: 150,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/ellipse.png'),
                    ),
                    
                  ),
                  title: Text('Fahim Rehman',style: TextStyle(color: Colors.white),),
                    subtitle: Text('fwdkaleem@gmail.com',style: TextStyle(color: Colors.white),),
                ),
              ),
              Divider(),
Container(
                margin: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: Icon(Icons.notifications,color:  Color(0xffCBCBCB),),
                    
                  
                  title: Text('Notfication',style: TextStyle(color: Color(0xffCBCBCB)),),
                ),
              ),
              Divider(),

          
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 20),
                    child: Text('Account Information',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
               Divider(),
Container(
                margin: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: Icon(Icons.email,color:  Color(0xffCBCBCB),),
                    
                  
                  title: Text('Help & FeedBack',style: TextStyle(color: Color(0xffCBCBCB)),),
                ),
              ),
                        Divider(),
Container(
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  leading: Icon(Icons.info,color:  Color(0xffCBCBCB),),
                    
                  
                  title: Text('About',style: TextStyle(color: Color(0xffCBCBCB)),),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  leading: Icon(Icons.privacy_tip,color:  Color(0xffCBCBCB),),
                    
                  
                  title: Text('Privacy Policy',style: TextStyle(color: Color(0xffCBCBCB)),),
                ),
              ),
            Spacer(),
Container(
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  leading: Icon(Icons.logout,color:  Color(0xffD63939),),
                    
                  
                  title: Text('Log out',style: TextStyle(color: Color(0xffD63939)),),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}