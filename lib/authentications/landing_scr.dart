import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:islamicapp/authentications/providers/user_provider.dart';
import 'package:islamicapp/authentications/signinpage.dart';
import 'package:provider/provider.dart';


import '../mainpage/widgets/bottom_drawee.dart';

class LandingScreen extends StatefulWidget {
   LandingScreen({ Key? key }) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
Future<FirebaseApp> intialize = Firebase.initializeApp();

@override
  void initState() {
    super.initState();
    getData();
  }

  getData()async{
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: intialize,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Text("${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext context, AsyncSnapshot streamsnapshot) {
                  if (streamsnapshot.hasError) {
                    return Scaffold(
                      body: Text("${streamsnapshot.error}"),
                    );
                  }
                  if(streamsnapshot.connectionState == ConnectionState.active){
                    User? user = streamsnapshot.data;
                    if(user==null){
                      return Signinpage();
                    }else{
                      return MainScreen();
                    }
                  }
                  return Scaffold(
                    body: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Checking Authnetication....',
                            
                          ),
                           CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  );
                });
          }
         
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'INITIALZATION...',
                 
                  ),
                   CircularProgressIndicator()
                ],
              ),
            ),
          );
        });
  }
}