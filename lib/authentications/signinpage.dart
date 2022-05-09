import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islamicapp/authentications/providers/database_services.dart';
import 'package:islamicapp/authentications/signuppage.dart';
import 'package:islamicapp/mainpage/widgets/bottom_drawee.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';


class Signinpage extends StatefulWidget {
  const Signinpage({Key? key}) : super(key: key);

  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool formStateLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
         width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
              'assets/back.png',
            ),
                  fit: BoxFit.cover)),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 88,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 68,bottom: 20),
                      child: Text(
                        'Welcome\n Islamic Prayer App',
                        
                        style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontStyle: FontStyle.normal
                    )
                        //  GoogleFonts.getFont('Montserrat',
                        //     fontWeight: FontWeight.w600,
                        //     color: Colors.white,
                        //     fontSize: 26,
                        //     fontStyle: FontStyle.normal),
                      ),
                    ),
                    Container(
                        height: 60,
                        margin: EdgeInsets.only(left: 30, right: 30, top: 30),

                        //  padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xff535353),
                          borderRadius: new BorderRadius.circular(20),
                        ),
                        // border: Border.all(color: Colors.grey,width: 0.5)

                        child: TextFormField(
                          controller: _emailController,
                          //  textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: ' email...',
                            contentPadding:const EdgeInsets.only(
                              top: 10,
                              left: 20,
                            ),
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontStyle: FontStyle.normal
                    ),
                            hintStyle: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff8D8989),
                      fontStyle: FontStyle.normal
                    )
                            
                            // GoogleFonts.getFont('Montserrat',
                            //     fontWeight: FontWeight.w600,
                            //     color: const Color(0xff8D8989),
                            //     fontSize: 12,
                            //     fontStyle: FontStyle.normal),
                          ),
                        )),
                    Container(
                        height: 60,
                        margin:const EdgeInsets.only(left: 30, right: 30, top: 28),

                        //  padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xff535353),
                          borderRadius: new BorderRadius.circular(20),
                        ),
                        // border: Border.all(color: Colors.grey,width: 0.5)

                        child: TextFormField(
                          controller: _passwordController,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Please Enter password field";
                            }
                          },
                          obscureText: true,
                          //  textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 13, right: 20),
                                child: Icon(
                                  Icons.visibility_off,
                                  color: Color.fromARGB(255, 77, 21, 21),
                                )),
                            hintText: 'Password',
                            contentPadding: EdgeInsets.only(top: 20, left: 20),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                              hintStyle: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff8D8989),
                      fontStyle: FontStyle.normal
                    )
                           
                          ),
                        )),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffEB5757),
                    minimumSize: Size(310, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate())
                      setState(() {
                        formStateLoading = true;
                      });
                    DataBaseMethods()
                        .loginUser(
                          _emailController.text,
                          _passwordController.text,
                        )
                        .then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => MainScreen(
                                  // title: '',
                                  ),
                            ),
                          ),
                        );
                    setState(() {
                      formStateLoading = false;
                    });
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontStyle: FontStyle.normal
                    )
                    
                    //  GoogleFonts.getFont('Montserrat',
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.white,
                    //     fontSize: 15,
                    //     fontStyle: FontStyle.normal),
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
                                    builder: (builder) => SignUpPage()));
                          },
                          child: Text(
                            'Sign Up',
                            style: 
                              TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffEB5757),
                      fontStyle: FontStyle.normal
                    )
                            
                            
                          
                          )))),
            ],
          ),
        ),
      ),
    );
  }
}
