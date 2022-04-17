// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/authentications/landing_scr.dart';
import 'package:islamicapp/authentications/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:returnpostuser/firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  //   await Firebase.initializeApp(

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          fontFamily: 'Gilroy',
          primarySwatch: Colors.red,
        ),
        home: LandingScreen(),
      ),
    );
  }
}
