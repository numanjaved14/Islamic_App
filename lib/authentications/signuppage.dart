import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamicapp/authentications/providers/database_services.dart';
import 'package:islamicapp/authentications/signinpage.dart';
import 'package:islamicapp/mainpage/widgets/bottom_drawee.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _refreralController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();


  bool _isLoading = false;

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/back.png",
                  ),
                  fit: BoxFit.cover)),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Text(
                      'Create an account',
                      textAlign: TextAlign.center,
                      style:
                             TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontStyle: FontStyle.normal
                    )
                      
                       
                    ),
                  ),
                  
                  Container(
                      height: 60,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 33),

                      //  padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Color(0xff535353),
                        borderRadius: new BorderRadius.circular(20),
                      ),
                      // border: Border.all(color: Colors.grey,width: 0.5)

                      child: TextFormField(
                        //  textAlign: TextAlign.start,
                        controller: _usernameController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return " Please Enter username..  ";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Name...',
                          contentPadding: EdgeInsets.only(top: 10, left: 20),
                          border: InputBorder.none,
                          labelStyle: GoogleFonts.getFont('Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 12,
                              fontStyle: FontStyle.normal),
                         hintStyle:          TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color:   Color(0xff8D8989),
                      fontStyle: FontStyle.normal
                    )
                         
                        ),
                      )),
                  Container(
                      height: 60,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 25),

                      //  padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Color(0xff535353),
                        borderRadius: new BorderRadius.circular(20),
                      ),
                      // border: Border.all(color: Colors.grey,width: 0.5)

                      child: TextFormField(
                        //  textAlign: TextAlign.start,
                        controller: _emailController,
                        validator: (v) {
                          if (v!.isEmpty || !v.contains("@")) {
                            return " Enter valid email ";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: ' email...',
                          contentPadding: EdgeInsets.only(top: 10, left: 20),
                          border: InputBorder.none,
                          labelStyle: GoogleFonts.getFont('Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 12,
                              fontStyle: FontStyle.normal),
                            hintStyle:          TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color:   Color(0xff8D8989),
                      fontStyle: FontStyle.normal
                    )
                        ),
                      )),
                  Container(
                      height: 60,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 25),

                      //  padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Color(0xff535353),
                        borderRadius: new BorderRadius.circular(20),
                      ),
                      // border: Border.all(color: Colors.grey,width: 0.5)

                      child: TextFormField(
                        controller: _passwordController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return " Please Enter password..  ";
                          }

                          return null;
                        },
                        obscureText: true,
                        //  textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Icon(
                              Icons.visibility_off,
                              color: Color(0xff8D8989),
                            ),
                          ),
                          hintText: ' Password',
                          contentPadding: EdgeInsets.only(top: 20, left: 20),
                          border: InputBorder.none,
                          labelStyle: GoogleFonts.getFont('Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 12,
                              fontStyle: FontStyle.normal),
                             hintStyle:          TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color:   Color(0xff8D8989),
                      fontStyle: FontStyle.normal
                    )
                        ),
                      )),
                
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffEB5757),
                        fixedSize: Size(310, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                      onPressed: signUpUser,
                      //  () {
                      //   print('this is name controller $_usernameController');

                      //   print('this is name controller $_emailController');

                      //   print('this is name controller $_passwordController');

                      //   print('this is name controller $_refreralController');

                      //   if (formKey.currentState!.validate()) ;

                      //   // Navigator.push(context,
                      //   //     MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                      // },
                      child: Text(
                        'SignUp',
                          style:          TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontStyle: FontStyle.normal
                    )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => Signinpage()));
                        },
                        child: Text(
                          'Sign In',
                             style:          TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffEB5757),
                      fontStyle: FontStyle.normal
                    )
                         
                         
                          
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUpUser() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        CircularProgressIndicator();
        _isLoading = true;
      });
      String res = await DataBaseMethods().registerUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
      );
   
      setState(() {
        _isLoading = false;
      });
      if (res == "added successfully") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => MainScreen()),
          ),
        );
      }
    }
    print('this is SignUPUser $_emailController');
  }
}
