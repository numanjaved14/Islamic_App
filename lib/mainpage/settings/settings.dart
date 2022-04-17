import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islamicapp/authentications/providers/database_services.dart';
import 'package:islamicapp/mainpage/account_info.dart';

import '../widgets/info_widget.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var _uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
          appBar: AppBar(
             
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
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
              title: Text('Profile',
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.normal))),
                      extendBody: true,
                      extendBodyBehindAppBar: true,
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
            child: Container(
              margin: EdgeInsets.only(top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(_uid)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return InfoWidget(snap: snapshot.data!.data());
                    },
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: Color(0xffCBCBCB),
                      ),
                      title: Text(
                        'Notfication',
                        style: TextStyle(color: Color(0xffCBCBCB)),
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AccountInfo(),
                    )),
                    child: Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text('Account Information',
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                                fontStyle: FontStyle.normal))),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Color(0xffCBCBCB),
                      ),
                      title: Text(
                        'Help & FeedBack',
                       style: TextStyle(
                                fontFamily: 'Gilroy',
                                
                                color: Color(0xffCBCBCB)
                               )
                      
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Color(0xffCBCBCB),
                      ),
                      title: Text(
                        'About',
                         style: TextStyle(
                                fontFamily: 'Gilroy',
                                
                                color: Color(0xffCBCBCB)
                               )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Icon(
                        Icons.privacy_tip,
                        color: Color(0xffCBCBCB),
                      ),
                      title: Text(
                        'Privacy Policy',
                         style: TextStyle(
                                fontFamily: 'Gilroy',
                                
                                color: Color(0xffCBCBCB)
                               )
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => DataBaseMethods().singnOut(context),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Color(0xffD63939),
                        ),
                        title: Text(
                          'Log out',
                           style: TextStyle(
                                fontFamily: 'Gilroy',
                                
                              color: Color(0xffD63939)
                               )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
    );
  }
}
